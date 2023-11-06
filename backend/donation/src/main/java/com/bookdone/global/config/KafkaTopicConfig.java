package com.bookdone.global.config;

import org.apache.kafka.clients.admin.AdminClient;
import org.apache.kafka.clients.admin.AdminClientConfig;
import org.apache.kafka.clients.admin.ListTopicsResult;
import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.TopicBuilder;
import org.springframework.kafka.core.KafkaAdmin;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

@Configuration
public class KafkaTopicConfig {
    @Value("${spring.kafka.bootstrap-servers}")
    private String bootstrapServers;
    @Value("${spring.kafka.topic.name}")
    private String topicName;

    @Bean
    public KafkaAdmin admin() {
        Map<String, Object> configs = new HashMap<>();
        configs.put(AdminClientConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
        return new KafkaAdmin(configs);
    }

    @Bean
    public NewTopic rankingUpdate() {
        return TopicBuilder.name(topicName)
                .partitions(1)
                .replicas(3)
                .build();
    }

    // 토픽을 확인하고 이미 존재하면 삭제한 다음 다시 생성하는 메서드
    @Bean
    public AdminClient adminClient() {
        return AdminClient.create(admin().getConfigurationProperties());
    }

    @Bean
    public void recreateTopic() throws ExecutionException, InterruptedException {
        AdminClient client = adminClient();
        // 현재 토픽 목록 확인
        ListTopicsResult topics = client.listTopics();
        topics.names().get().forEach(t -> {
            if (t.equals(topicName)) {
                // 토픽이 존재하면 삭제
                client.deleteTopics(Collections.singleton(topicName));
                try {
                    // 삭제가 완료될 때까지 기다림
                    Thread.sleep(500); // Kafka의 토픽 삭제는 시간이 걸릴 수 있으니 적절한 대기 시간 설정 필요
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }
        });
        // 토픽 다시 생성
        client.createTopics(Collections.singleton(rankingUpdate()));
    }
}


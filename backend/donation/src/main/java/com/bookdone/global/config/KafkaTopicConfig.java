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

import java.util.*;
import java.util.concurrent.ExecutionException;

@Configuration
public class KafkaTopicConfig {
    @Value("${spring.kafka.bootstrap-servers}")
    private String bootstrapServers;
    @Value("${spring.kafka.topic.res-req.name}")
    private String topicName;
    @Value("${spring.kafka.topic.don-can.name}")
    private String topicName2;
    @Value("${spring.kafka.topic.don-fin.name}")
    private String topicName3;

    @Bean
    public KafkaAdmin admin() {
        Map<String, Object> configs = new HashMap<>();
        configs.put(AdminClientConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
        return new KafkaAdmin(configs);
    }

    @Bean
    public KafkaAdmin.NewTopics topicsBuilder() {
        return new KafkaAdmin.NewTopics(
                TopicBuilder.name(topicName)
                        .replicas(3)
                        .partitions(2)
                        .build(),
                TopicBuilder.name(topicName2)
                        .replicas(3)
                        .partitions(2)
                        .build(),
                TopicBuilder.name(topicName3)
                        .replicas(3)
                        .partitions(2)
                        .build());
    }
}


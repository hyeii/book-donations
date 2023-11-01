//package com.bookdone.global.config;
//
//import org.apache.kafka.clients.admin.AdminClientConfig;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.kafka.config.TopicBuilder;
//import org.springframework.kafka.core.KafkaAdmin;
//
//import java.util.HashMap;
//import java.util.Map;

//@Configuration
//public class KafkaTopicConfig {
//    @Value("${spring.kafka.bootstrap-servers}")
//    private String bootstrapServers;
//
//    @Bean
//    public KafkaAdmin admin() {
//        Map<String, Object> configs = new HashMap<>();
//        configs.put(AdminClientConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
//        return new KafkaAdmin(configs);
//    }
//
//    @Bean
//    public KafkaAdmin.NewTopics topics456() {
//        return new KafkaAdmin.NewTopics(
//                TopicBuilder.name("ranking_update")
//                        .partitions(3)
//                        .replicas(3)
//                        .build());
//    }
//}

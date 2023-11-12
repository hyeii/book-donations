package com.bookdone.global.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UtilConfig {
    @Bean
    ObjectMapper objectMapper() {
        return new ObjectMapper();
    }
}

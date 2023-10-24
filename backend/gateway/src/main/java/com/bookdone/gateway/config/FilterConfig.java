package com.bookdone.gateway.config;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;

// @Configuration
public class FilterConfig {
    // @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder) {
        return builder.routes()
                .route(r -> r.path("/api/members/**")
                        .filters(f -> f.addRequestHeader("member-request", "member-request-header")
                                .addResponseHeader("member-response", "member-response-header"))
                        .uri("http://localhost:8001"))
                .build();
    }
}

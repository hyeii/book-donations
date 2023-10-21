package com.bookdone.gateway.filter;

import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.OrderedGatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.core.Ordered;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Mono;

@Component
@Slf4j
public class LoggingFilter extends AbstractGatewayFilterFactory<LoggingFilter.Config> {
	public LoggingFilter() {
		super(Config.class);
	}

	@Override
	public GatewayFilter apply(Config config) {
		GatewayFilter filter = new OrderedGatewayFilter((exchange, chain) -> {
			ServerHttpRequest request = exchange.getRequest();
			ServerHttpResponse response = exchange.getResponse();

			log.info("Logging filter baseMessage: {}", config.getBaseMessage());
			if (config.isPreLogger()) {
				log.info("Logging Filter Start: request id -> {}", request.getId());
			}
			// Global Post Filter
			return chain.filter(exchange)
				.then(Mono.fromRunnable(() -> { // 비동기 방식 웹 플럭스 기능 모노
					if (config.isPostLogger()) {
						log.info("Logging Filter End: response code -> {}", response.getStatusCode());
					}
				}));
		}, Ordered.HIGHEST_PRECEDENCE);

		return filter;
		//Global Pre Filter
		// return ((exchange, chain) -> {
		// 	ServerHttpRequest request = exchange.getRequest();
		// 	ServerHttpResponse response = exchange.getResponse();
		//
		// 	log.info("Global filter baseMessage: {}", config.getBaseMessage());
		// 	if (config.isPreLogger()) {
		// 		log.info("Global Filter Start: request id -> {}", request.getId());
		// 	}
		//
		// 	// Global Post Filter
		// 	return chain.filter(exchange)
		// 		.then(Mono.fromRunnable(() -> { // 비동기 방식 웹 플럭스 기능 모노
		// 			if (config.isPostLogger()) {
		// 				log.info("Global Filter End: response code -> {}", response.getStatusCode());
		// 			}
		// 		}));
		// });
	}

	@Data
	public static class Config {
		private String baseMessage;
		private boolean preLogger;
		private boolean postLogger;
		//Put the configuration properties
	}
}

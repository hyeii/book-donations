package com.bookdone.gateway.filter;

import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.bookdone.gateway.util.JwtTokenUtil;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

@Component
@Slf4j
public class CustomFilter extends AbstractGatewayFilterFactory<CustomFilter.Config> {
    public CustomFilter() {
        super(Config.class);
    }

    @Override
    public GatewayFilter apply(Config config) {
        //Custom Pre Filter
        return ((exchange, chain) -> {
            ServerHttpRequest request = exchange.getRequest();
            ServerHttpResponse response = exchange.getResponse();

            log.info("Custom Pre filter: request id -> {}", request.getId());

            if (!request.getHeaders().containsKey(HttpHeaders.AUTHORIZATION)) {
                return onError(exchange, "토큰이 존재하지 않습니다.", HttpStatus.UNAUTHORIZED);
            }

            String token = getToken(request);
            if (token == null) {
                return onError(exchange, "토큰이 존재하지 않습니다.", HttpStatus.UNAUTHORIZED);
            }

            JWTVerifier verifier = JwtTokenUtil.getVerifier();
            /**
             * AccessToken 검증
             * 실패시 401 반환
             * 성공시 header에 "memberId" : ??? 로 200 반환
             */
            try {
                DecodedJWT jwt = verifier.verify(token);
                String memberId = jwt.getClaim("sub").asString();
                response.getHeaders().add("member-id", memberId);
            } catch (TokenExpiredException ex) {
                return onError(exchange, "토큰이 만료 되었습니다.", HttpStatus.UNAUTHORIZED);
            } catch (JWTVerificationException ex) {
                return onError(exchange, ex.getMessage(), HttpStatus.UNAUTHORIZED);
            }


            log.info("request path - {}", request.getPath());
            log.info("request uri - {}", request.getURI());

            // Custom Post Filter
            return chain.filter(exchange)
                    .then(Mono.fromRunnable(() -> { // 비동기 방식 웹 플럭스 기능 모노
                        log.info("Custom Post filter: response id -> {}", response.getStatusCode());
                    }));
        });
    }

    private Mono<Void> onError(ServerWebExchange exchange, String error, HttpStatus httpStatus) {
        ServerHttpResponse response = exchange.getResponse();
        response.setStatusCode(httpStatus);
        return response.setComplete();
    }

    private String getToken(ServerHttpRequest request) {
        String headerAuth = request.getHeaders().get(HttpHeaders.AUTHORIZATION).get(0);
        log.info("getToken");
        log.info("headerAuth - " + headerAuth);
        if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
            return headerAuth.substring(7);
        }
        return null;
    }

    public static class Config {
        //Put the configuration properties
    }
}

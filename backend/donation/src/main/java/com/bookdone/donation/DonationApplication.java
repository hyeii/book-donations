package com.bookdone.donation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication(scanBasePackages = "com.bookdone")
@EnableFeignClients(basePackages = "com.bookdone")
@EnableJpaAuditing
public class DonationApplication {

    public static void main(String[] args) {
        SpringApplication.run(DonationApplication.class, args);
    }

}

package com.example.backmanage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BackManageApplication {

    @Autowired

    public static void main(String[] args) {

        SpringApplication.run(BackManageApplication.class, args);
    }


}

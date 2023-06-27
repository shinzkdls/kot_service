package com.kbstar.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

//    다른 디렉토리도 웹에서 접근할 수 있도록 추가한것

//    @Value("${imgdir}")
//    String imgdir;
//    @Value("${logdir}")
//    String logdir;
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/uimg/**").addResourceLocations(imgdir);
//        registry.addResourceHandler("/logs/**").addResourceLocations(logdir);
//    }
        @Bean
        public WebMvcConfigurer corsConfigurer() {
            return new WebMvcConfigurer() {
                @Override
                public void addCorsMappings(CorsRegistry registry) {
                    registry.addMapping("/ws").allowedOrigins("http://127.0.0.1");
                }
            };
        }
}

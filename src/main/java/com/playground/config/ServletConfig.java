package com.playground.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;


/**
 * Dispatcher Servlet 과 관련된 설정을 한다
 */
@Configuration
public class ServletConfig implements WebMvcConfigurer {
    public static final int STATIC_RESOURCE_CACHE_PERIOD = 60;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/resources/", "classpath:/static/", "classpath:/static/resources/")
                .setCachePeriod(STATIC_RESOURCE_CACHE_PERIOD)
                .resourceChain(true)
                .addResolver(new PathResourceResolver());

        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/")
                .setCachePeriod(STATIC_RESOURCE_CACHE_PERIOD)
                .resourceChain(true)
                .addResolver(new PathResourceResolver());
    }
}

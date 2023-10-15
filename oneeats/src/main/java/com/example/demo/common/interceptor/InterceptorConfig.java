package com.example.demo.common.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter{
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new ViewNameInterceptor())
		.addPathPatterns("/*.do")
		.addPathPatterns("/*/*.do")
		.addPathPatterns("/*/*/*.do")
		.addPathPatterns("/*/*/*/*.do")
		.excludePathPatterns("/users/login");
		
	}

}

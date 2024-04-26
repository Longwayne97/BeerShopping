package org.lab.configure;

import org.lab.service.Auth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AuthConfiguration implements WebMvcConfigurer {

    @Autowired
    Auth auth;


    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(auth).addPathPatterns("/admin/**","/product/admin/productManage","/product/admin/productManage/**","/info",
                "/info/**");
    }
}

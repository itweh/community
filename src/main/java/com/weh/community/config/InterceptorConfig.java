package com.weh.community.config;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration//加载配置文件
public class InterceptorConfig implements WebMvcConfigurer {

    @Override
    /**
     * 配置拦截器
     */
    public void addInterceptors(InterceptorRegistry registry) {
        //开发登录路径
        registry.addInterceptor( new Interceptor()).addPathPatterns("/**")
                .excludePathPatterns("/toLogin/**")
                .excludePathPatterns("/doLogin/**")
                .excludePathPatterns("/static/**")
                .excludePathPatterns("/homePage")
                .excludePathPatterns("/toRegister")
                .excludePathPatterns("/announcement/dataList")
                .excludePathPatterns("/message/add");
    }
    //样式加载不进来加一句话
    @Override
    /**
     * 指定静态资源的路径，也可以在配置文件中指定
     */
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
    }
}

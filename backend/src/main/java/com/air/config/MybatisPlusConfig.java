package com.air.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;


/**
 * 单数据源配置
 * @author zgs
 *
 */
@Configuration
@MapperScan(value={"com.air.modules.**.mapper*"})
public class MybatisPlusConfig {

    /**
     *  分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

}

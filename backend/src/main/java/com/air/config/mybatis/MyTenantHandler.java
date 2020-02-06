package com.air.config.mybatis;

import com.baomidou.mybatisplus.extension.plugins.tenant.TenantHandler;
import com.air.config.ApiContext;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.NullValue;
import net.sf.jsqlparser.expression.StringValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

/**
 * @Classname PreTenantHandler
 * @Description 租户处理器 -主要实现mybatis-plus https://mp.baomidou.com/guide/tenant.html
 * @Version 1.0
 */
@Slf4j
@Component
public class MyTenantHandler implements TenantHandler {

    /**
     * 多租户标识
     */
    private static final String SYSTEM_STORE_ID = "store_id";

    @Autowired
    private ApiContext apiContext;

    /**
     * 租户Id
     *
     * @return
     */
    @Override
    public Expression getTenantId() {
        // 从当前系统上下文中取出当前请求的服务商ID，通过解析器注入到SQL中。
        String tenantId = apiContext.getCurrentStoreId();
        log.debug("当前租户为{}", tenantId);
        if (tenantId == null) {
            return new NullValue();
        }
        return new StringValue(tenantId);
    }

    /**
     * 租户字段名
     *
     * @return
     */
    @Override
    public String getTenantIdColumn() {
        return SYSTEM_STORE_ID;
    }

    /**
     * 根据表名判断是否进行过滤
     * 忽略掉一些表：如租户表（sys_tenant）本身不需要执行这样的处理
     *
     * @param tableName
     * @return
     */
    @Override
    public boolean doTableFilter(String tableName) {
        Set filters = new HashSet() ;
        //这些需要开启 多租户模式
        filters.add("goods");
        filters.add("goods_amount");
        filters.add("goods_brand");
        filters.add("goods_order");
        filters.add("goods_type");
        filters.add("goods_store");
//        boolean f =  !filters.contains(tableName);
        return !filters.contains(tableName);
    }
}

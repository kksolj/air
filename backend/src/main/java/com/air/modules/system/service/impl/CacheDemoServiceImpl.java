package com.air.modules.system.service.impl;

import com.air.modules.system.entity.CacheDemo;
import com.air.modules.system.mapper.CacheDemoMapper;
import com.air.modules.system.service.ICacheDemoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

@Service
@CacheConfig(cacheNames = "cache")
public class CacheDemoServiceImpl extends ServiceImpl<CacheDemoMapper, CacheDemo> implements ICacheDemoService {

    @Resource
    private CacheDemoMapper cacheDemoMapper;



    @Override
    @Cacheable(key = "#id")
    public List<CacheDemo> readCacheDemo(String id) {
        CacheDemo demo = new CacheDemo();
        demo.setId("1235435324L");
        List<CacheDemo> list= Arrays.asList(demo);
        return list;
    }
}

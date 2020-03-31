package com.air.modules.system.service;

import com.air.modules.system.entity.CacheDemo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface ICacheDemoService extends IService<CacheDemo> {
    List<CacheDemo> readCacheDemo(String id);
}

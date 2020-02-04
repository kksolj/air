package com.lst.modules.quartz.service;

import java.util.List;

import com.lst.modules.quartz.entity.QuartzJob;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 定时任务在线管理
 * @author： zgs
 */
public interface IQuartzJobService extends IService<QuartzJob> {

	List<QuartzJob> findByJobClassName(String jobClassName);

}

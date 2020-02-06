package com.air.modules.quartz.service.impl;

import java.util.List;

import com.air.modules.quartz.entity.QuartzJob;
import com.air.modules.quartz.mapper.QuartzJobMapper;
import com.air.modules.quartz.service.IQuartzJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * 定时任务在线管理
 * @author： zgs
 */
@Service
public class QuartzJobServiceImpl extends ServiceImpl<QuartzJobMapper, QuartzJob> implements IQuartzJobService {

	@Autowired
	private QuartzJobMapper quartzJobMapper;

	@Override
	public List<QuartzJob> findByJobClassName(String jobClassName) {
		return quartzJobMapper.findByJobClassName(jobClassName);
	}

}

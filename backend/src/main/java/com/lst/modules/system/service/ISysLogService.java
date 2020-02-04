package com.lst.modules.system.service;

import com.lst.modules.system.entity.SysLog;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 系统日志表 服务类
 *
 * @author lee
 */
public interface ISysLogService extends IService<SysLog> {

	/**
	 * 清空所有日志记录
	 */
	void removeAll();
	
	/**
	 * 获取系统总访问次数
	 *
	 * @return Long
	 */
	Long findTotalVisitCount();

	/**
	 * 获取系统今日访问次数
	 *
	 * @return Long
	 */
	Long findTodayVisitCount();

	/**
	 * 获取系统今日访问 IP数
	 *
	 * @return Long
	 */
	Long findTodayIp();

}

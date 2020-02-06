package com.air.modules.system.service.impl;

import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.air.modules.system.entity.SysLog;
import com.air.modules.system.entity.SysUser;
import com.air.modules.system.mapper.SysLogMapper;
import org.apache.shiro.SecurityUtils;
import com.air.common.system.api.ISysBaseAPI;
import com.air.common.util.IPUtils;
import com.air.common.util.SpringContextUtils;
import org.springframework.stereotype.Service;

@Service
public class SysBaseAPI implements ISysBaseAPI {
	@Resource
	private SysLogMapper sysLogMapper;

	@Override
	public void addLog(String LogContent, Integer logType, Integer operatetype) {
		SysLog sysLog = new SysLog();
		//注解上的描述,操作日志内容
		sysLog.setLogContent(LogContent);
		sysLog.setLogType(logType);
		sysLog.setOperateType(operatetype);

		//请求的方法名
		//请求的参数

		//获取request
		HttpServletRequest request = SpringContextUtils.getHttpServletRequest();
		//设置IP地址
		sysLog.setIp(IPUtils.getIpAddr(request));

		//获取登录用户信息
		SysUser sysUser = (SysUser)SecurityUtils.getSubject().getPrincipal();
		if (sysUser != null){
			sysLog.setUserid(sysUser.getUsername());
			sysLog.setUsername(sysUser.getUsername());

		}
		sysLog.setCreateTime(new Date());
		//保存系统日志
		sysLogMapper.insert(sysLog);
	}

}

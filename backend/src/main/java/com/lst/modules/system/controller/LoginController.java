package com.lst.modules.system.controller;

import com.alibaba.fastjson.JSONObject;
import com.lst.common.api.vo.Result;
import com.lst.common.constant.CommonConstant;
import com.lst.common.system.api.ISysBaseAPI;
import com.lst.common.util.PasswordUtil;
import com.lst.common.util.RedisUtil;
import com.lst.config.ApiContext;
import com.lst.modules.shiro.authc.util.JwtUtil;
import com.lst.modules.system.entity.SysUser;
import com.lst.modules.system.model.SysLoginModel;
import com.lst.modules.system.service.ISysLogService;
import com.lst.modules.system.service.ISysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 登录
 * @author lee
 */
@RestController
@RequestMapping("/sys")
@Api("用户登录")
public class LoginController {

	@Autowired
	private ISysUserService sysUserService;

	@Autowired
	private ISysBaseAPI sysBaseAPI;

	@Autowired
	private ISysLogService logService;

	@Autowired
    private RedisUtil redisUtil;

	@Autowired
	private ApiContext apiContext;
	

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ApiOperation("登录接口")
	public Result login(@RequestBody SysLoginModel sysLoginModel) {
		//redis取出判断 没有
		String username = sysLoginModel.getUsername();
		String password = sysLoginModel.getPassword();
		SysUser sysUser = sysUserService.getUserByName(username);
		if (sysUser == null) {
			sysBaseAPI.addLog("登录失败，用户名:"+username+"不存在！", CommonConstant.LOG_TYPE_1, null);
			return Result.fail("该用户不存在");
		} else {
			//密码验证
			String userPassword = PasswordUtil.encrypt(username, password, sysUser.getSalt());
			String sysPassword = sysUser.getPassword();
			if (!sysPassword.equals(userPassword)) {
				return Result.fail("用户名或密码不正确");
			}
			String userId = sysUser.getId();

			//生成token
			String token = JwtUtil.sign(userId, username, sysPassword);
			redisUtil.set(CommonConstant.PREFIX_USER_TOKEN + token, token);
			 //设置超时时间
			redisUtil.expire(CommonConstant.PREFIX_USER_TOKEN + token, JwtUtil.EXPIRE_TIME/1000);

			JSONObject obj = new JSONObject();
			obj.put("token", token);
			obj.put("userInfo", sysUser);

			//全局上下文设置下ID  这里没有完全解决多租户问题
			apiContext.setCurrentStoreId(sysUser.getStoreId());
			sysBaseAPI.addLog("用户名: "+username+",登录成功！", CommonConstant.LOG_TYPE_1, null);
			return Result.success(obj);
		}
	}
	
	/**
	 * 获取访问量
	 * @return
	 */
	@GetMapping("loginfo")
	public Result loginfo() {

		JSONObject obj = new JSONObject();
		// 获取系统访问记录
		Long totalVisitCount = logService.findTotalVisitCount();
		obj.put("totalVisitCount", totalVisitCount);
		Long todayVisitCount = logService.findTodayVisitCount();
		obj.put("todayVisitCount", todayVisitCount);
		Long todayIp = logService.findTodayIp();
		obj.put("todayIp", todayIp);

		return Result.success(obj);
	}

}

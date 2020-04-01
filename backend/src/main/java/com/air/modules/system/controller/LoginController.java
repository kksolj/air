package com.air.modules.system.controller;

import com.air.common.api.vo.Result;
import com.air.common.constant.CommonConstant;
import com.air.common.system.api.ISysBaseAPI;
import com.air.common.util.PasswordUtil;
import com.air.common.util.RedisUtil;
import com.air.config.ApiContext;
import com.air.modules.shiro.vo.DefContants;
import com.air.modules.system.entity.SysUser;
import com.air.modules.system.model.SysLoginModel;
import com.air.modules.system.service.ISysLogService;
import com.air.modules.system.service.ISysUserService;
import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

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
    private KeyGenerator keyGenerator;

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    @ApiOperation("退出登陆")
    public Result loginOut(HttpServletRequest request) {
        String token = request.getHeader(DefContants.X_ACCESS_TOKEN);
        redisUtil.del(token);
        return Result.success("退出成功");
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ApiOperation("登录接口")
    public Result login(@RequestBody SysLoginModel sysLoginModel, HttpServletRequest request) {

        String username = sysLoginModel.getUsername();
        String password = sysLoginModel.getPassword();
        SysUser sysUser = null;

        String token = request.getHeader(DefContants.X_ACCESS_TOKEN);
        if (!StringUtils.isEmpty(token) && !token.equalsIgnoreCase("undefined")
                && !token.equalsIgnoreCase("null")) {
            //从redis读取用户数据
            Object obj = redisUtil.get(token);

            if (obj == null) {
                //缓存无记录，查数据库
                sysUser = sysUserService.getUserByName(username);
                if (sysUser == null) {
                    sysBaseAPI.addLog("登录失败，用户名:" + username + "不存在！", CommonConstant.LOG_TYPE_1, null);
                    return Result.fail("该用户不存在");
                } else {
                    //密码验证
                    String userPassword = PasswordUtil.encrypt(username, password, sysUser.getSalt());
                    String sysPassword = sysUser.getPassword();
                    if (!sysPassword.equals(userPassword)) {
                        return Result.fail("用户名或密码不正确");
                    }
                    //用户密码验证通过，说明前端token与缓存匹配不上，更新前端的token
                }
            }
            JSONObject data = new JSONObject();
            data.put("token", token);
            data.put("userInfo", sysUser);
            sysBaseAPI.addLog("用户名: " + username + ",登录成功！", CommonConstant.LOG_TYPE_1, null);
            return Result.success(data);
        } else {
            //token为空，根据username查询用户，并校验密码，向前端提供token
            sysUser = sysUserService.getUserByName(username);
            token = String.valueOf(this.keyGenerator.generate(null, null, username));
            redisUtil.set(token,sysUser);
            redisUtil.expire(token,CommonConstant.TOKEN_EXPIRE_TIME);
            if (sysUser == null) {
                sysBaseAPI.addLog("登录失败，用户名:" + username + "不存在！", CommonConstant.LOG_TYPE_1, null);
                return Result.fail("该用户不存在");
            } else {
                //密码验证
                String userPassword = PasswordUtil.encrypt(username, password, sysUser.getSalt());
                String sysPassword = sysUser.getPassword();
                if (!sysPassword.equals(userPassword)) {
                    return Result.fail("用户名或密码不正确");
                }
                //用户密码验证通过，向前端提供token
            }
            JSONObject data = new JSONObject();
            data.put("token", token);
            data.put("userInfo", sysUser);
            sysBaseAPI.addLog("用户名: " + username + ",登录成功！", CommonConstant.LOG_TYPE_1, null);
            return Result.success(data);
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

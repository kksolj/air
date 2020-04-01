package com.air.modules.shiro.authc.util;

import com.air.common.exception.ServiceException;
import com.air.common.util.RedisUtil;
import com.air.modules.shiro.vo.DefContants;
import com.air.modules.system.entity.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Component
public class AuthorizedUtil {

    @Autowired
    private RedisUtil redisUtil;

    /**
     * 根据request中的token获取用户账号
     *
     * @param request
     * @return
     * @throws ServiceException
     */
    public SysUser getUser(HttpServletRequest request) throws ServiceException {
        String accessToken = request.getHeader(DefContants.X_ACCESS_TOKEN);
        Object obj = redisUtil.get(accessToken);
        if (obj == null || !(obj instanceof SysUser)) {
            throw new ServiceException("未获取到用户");
        }
        SysUser user = (SysUser) obj;
        return user;
    }
}

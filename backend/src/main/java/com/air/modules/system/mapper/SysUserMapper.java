package com.air.modules.system.mapper;

import com.air.modules.system.entity.SysUser;
import org.apache.ibatis.annotations.Param;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * 用户表 Mapper 接口
 *
 * @author lee
 */
public interface SysUserMapper extends BaseMapper<SysUser> {
	/**
	 * @param username
	 * @return
	 */
	SysUser getUserByName(@Param("username") String username);
}

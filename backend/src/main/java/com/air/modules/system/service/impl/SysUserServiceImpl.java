package com.air.modules.system.service.impl;

import java.util.List;

import com.air.common.util.IdGen;
import com.air.modules.system.entity.SysUser;
import com.air.modules.system.entity.SysUserRole;
import com.air.modules.system.mapper.SysUserMapper;
import com.air.modules.system.mapper.SysUserRoleMapper;
import com.air.modules.system.service.ISysUserService;
import com.air.common.util.oConvertUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户表 服务实现类
 *
 * @author lee
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

	@Autowired
	private SysUserMapper userMapper;

	@Autowired
	private SysUserRoleMapper sysUserRoleMapper;

	@Override
	public SysUser getUserByName(String username) {
		return userMapper.getUserByName(username);
	}


	@Override
	public void addUserWithRole(SysUser user, String roles) {
		String id = IdGen.uuid();
		user.setId(id);
		this.save(user);

		if (oConvertUtils.isNotEmpty(roles)) {
			String[] arr = roles.split(",");
			for (String roleId : arr) {
				SysUserRole userRole = new SysUserRole(id, roleId);
				sysUserRoleMapper.insert(userRole);
			}
		}
	}

	@Override
	public void editUserWithRole(SysUser user, String roles) {
		this.updateById(user);
		//先删后加
		sysUserRoleMapper.delete(new QueryWrapper<SysUserRole>().lambda().eq(SysUserRole::getUserId, user.getId()));
		if(oConvertUtils.isNotEmpty(roles)) {
			String[] arr = roles.split(",");
			for (String roleId : arr) {
				SysUserRole userRole = new SysUserRole(user.getId(), roleId);
				sysUserRoleMapper.insert(userRole);
			}
		}
	}


	@Override
	public List<String> getRole(String username) {
		return sysUserRoleMapper.getRoleByUserName(username);
	}

}

package com.air.modules.system.service;

import com.air.modules.system.entity.SysRolePermission;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 角色权限表 服务类
 *
 * @author lee
 */
public interface ISysRolePermissionService extends IService<SysRolePermission> {

	/**
	 * 保存授权/先删后增
	 * @param roleId
	 * @param permissionIds
	 */
	void saveRolePermission(String roleId,String permissionIds);

}

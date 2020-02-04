package com.lst.modules.system.service;

import java.util.List;

import com.lst.modules.system.entity.SysPermission;
import com.lst.modules.system.model.TreeModel;
import com.lst.common.exception.ServiceException;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 菜单权限表 服务类
 *
 * @author lee
 */
public interface ISysPermissionService extends IService<SysPermission> {
	
	List<TreeModel> queryListByParentId(String parentId);
	
	/**真实删除*/
	void deletePermission(String id) throws ServiceException;
	/**逻辑删除*/
	void deletePermissionLogical(String id) throws ServiceException;
	
	void addPermission(SysPermission sysPermission, String userId) throws ServiceException;
	
	void editPermission(SysPermission sysPermission, String userId) throws ServiceException;
	
	List<SysPermission> queryByUser(String username);
}

package com.air.modules.system.mapper;

import com.air.modules.system.entity.SysPermission;
import com.air.modules.system.model.TreeModel;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 菜单权限表 Mapper 接口
 * </p>
 *
 * @author lee
 */
public interface SysPermissionMapper extends BaseMapper<SysPermission> {

    List<TreeModel> queryListByParentId(@Param("parentId") String parentId);

    /**
     * 根据用户查询用户权限
     */
    List<SysPermission> queryByUser(@Param("username") String username);

}

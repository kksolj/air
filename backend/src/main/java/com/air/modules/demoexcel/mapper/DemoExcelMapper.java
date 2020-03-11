package com.air.modules.demoexcel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.air.modules.demoexcel.entity.DemoExcel;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @Description: 
 * @author： lee
 * @date：   2020-03-11
 * @version： V1.0
 */
public interface DemoExcelMapper extends BaseMapper<DemoExcel> {
    List<DemoExcel> getAll();
}

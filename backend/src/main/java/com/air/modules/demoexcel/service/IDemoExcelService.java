package com.air.modules.demoexcel.service;

import com.air.modules.demoexcel.entity.DemoExcel;
import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;

/**
 * @Description: 
 * @author： lee
 * @date：   2020-03-11
 * @version： V1.0
 */
public interface IDemoExcelService extends IService<DemoExcel> {

  void importExcel(List<DemoExcel> DemoExcelList);

  List<DemoExcel> getAll();
}

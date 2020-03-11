package com.air.modules.demoexcel.service.impl;

import com.air.modules.demoexcel.entity.DemoExcel;
import com.air.modules.demoexcel.mapper.DemoExcelMapper;
import com.air.modules.demoexcel.service.IDemoExcelService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;

/**
 * @Description: 
 * @author： k_boot
 * @date：   2020-03-11
 * @version： V1.0
 */
@Service
public class DemoExcelServiceImpl extends ServiceImpl<DemoExcelMapper, DemoExcel> implements IDemoExcelService {

    @Resource
    private DemoExcelMapper demoExcelMapper;

    @Override
    public void importExcel(List<DemoExcel> DemoExcelList) {
        for (DemoExcel item : DemoExcelList) {
            demoExcelMapper.insert(item);
        }
    }

    @Override
    public List<DemoExcel> getAll() {
        return demoExcelMapper.getAll();
    }
}

package com.air.modules.autoCode;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.jeecgframework.codegenerate.generate.impl.CodeGenerateOne;
import org.jeecgframework.codegenerate.generate.pojo.TableVo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "代码生成器")
@RestController
@Slf4j
@RequestMapping("autoCode")
public class AutoCode {

    @ApiOperation("根据数据库表名生成代码")
    @PostMapping(value = "makeBySql")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "table", value = "数据库表名称"),
            @ApiImplicitParam(name = "bage", value = "子业务包名"),
            @ApiImplicitParam(name = "entity", value = "实体类名"),
            @ApiImplicitParam(name = "des", value = "功能描述")
    })
    public String makeCode(
            @RequestParam(name = "table") String tableName,
            @RequestParam(name = "bage") String bage,
            @RequestParam(name = "entity") String entity,
            @RequestParam(name = "des") String des
    ) {

        try {
            System.out.println("make mysql model");
            /**[2]、表配置参数 */
            TableVo table = new TableVo();
            //表名
            table.setTableName(tableName);

            //表主键策略（目前只支持UUID）
            table.setPrimaryKeyPolicy("uuid");

            //子业务包名
            table.setEntityPackage(bage);

            //实体类名
            table.setEntityName(entity);

            //功能描述
            table.setFtlDescription(des);

            new CodeGenerateOne(table).generateCodeFile();
            return ("生成完成");
        }catch (Exception e){
            return e.getMessage();
        }
    }
}

package com.lst;


import org.jeecgframework.codegenerate.generate.impl.CodeGenerateOne;
import org.jeecgframework.codegenerate.generate.pojo.TableVo;

/**
 * k_boot代码生成器
 * 功能说明： 一键生成增删改查所有代码（包括：controller、service、dao、mapper、entity、vue）
 * 自定义模板： 模板位置在/src/main/resources/jeecg/code-template
 * @author lee
 *
 */
public class CodeGenerator {

	/**
	  *  代码生成器使用说明（单表模型）
	 *  
	  * [1]、全局配置文件
	 * src/main/resources/jeecg/jeecg_config.properties 	： 代码生成器基础配置文件（项目路径、根业务包路径）
	 * src/main/resources/jeecg/jeecg_database.properties 	：代码生成器数据库配置文件（独立的数据源配置）
	 * 
	  * [3]、页面使用说明：
	 *  1. 页面生成路径： src/main/java/{业务包根路径}/{子业务包}/vue/
	 *  2. 使用方法，手工复制到webstorm项目下面
	 *  3. 配置访问菜单
	 */
    public static void main(String[] args) {
    	System.out.println("--------- Code------------- Generation -----[单表模型]------- 生成中。。。");
    	
    	/**[2]、表配置参数 */
		TableVo table = new TableVo();
		//表名
		table.setTableName("goods_order");

		//表主键策略（目前只支持UUID）
		table.setPrimaryKeyPolicy("uuid");

		//子业务包名
		table.setEntityPackage("goods");

		//实体类名
		table.setEntityName("goodsOrder");

		//功能描述
		table.setFtlDescription("商品订单");

		new CodeGenerateOne(table).generateCodeFile();
		System.out.println("--------- Code------------- Generation -----[单表模型]------- 生成完成。。。");
	}

}
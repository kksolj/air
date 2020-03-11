package com.air.modules.demoexcel.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.air.common.api.vo.Result;
import com.air.common.util.oConvertUtils;
import com.air.common.util.ExcelUtils;
import com.air.modules.demoexcel.entity.DemoExcel;
import com.air.modules.demoexcel.service.IDemoExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

 /**
 * @Title: Controller
 * @Description: 
 * @author： lee
 * @date：   2020-03-11
 * @version： V1.0
 */
@RestController
@RequestMapping("/demoexcel/demoExcel")
@Slf4j
@Api(tags="")
public class DemoExcelController {
	@Autowired
	private IDemoExcelService demoExcelService;

	private Logger log= LoggerFactory.getLogger(DemoExcelController.class);

	/**
	 * 分页列表查询
	 * @param demoExcel
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	@GetMapping(value = "/list")
    @ApiOperation(value="-分页列表查询", notes="-分页列表查询")
	public Result<IPage<DemoExcel>> queryPageList(DemoExcel demoExcel,
									  @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
									  @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
									  HttpServletRequest req) {
		Result<IPage<DemoExcel>> result = new Result<IPage<DemoExcel>>();
		QueryWrapper<DemoExcel> queryWrapper = new QueryWrapper<DemoExcel>(demoExcel);
		Page<DemoExcel> page = new Page<DemoExcel>(pageNo,pageSize);
		//排序逻辑 处理
		String column = req.getParameter("column");
		String order = req.getParameter("order");
		if(oConvertUtils.isNotEmpty(column) && oConvertUtils.isNotEmpty(order)) {
			if("asc".equals(order)) {
				queryWrapper.orderByAsc(oConvertUtils.camelToUnderline(column));
			}else {
				queryWrapper.orderByDesc(oConvertUtils.camelToUnderline(column));
			}
		}
		IPage<DemoExcel> pageList = demoExcelService.page(page, queryWrapper);
		//log.debug("查询当前页："+pageList.getCurrent());
		//log.debug("查询当前页数量："+pageList.getSize());
		//log.debug("查询结果数量："+pageList.getRecords().size());
		//log.debug("数据总数："+pageList.getTotal());
		result.setSuccess(true);
		result.setData(pageList);
		return result;
	}

	/**
	 *   添加
	 * @param demoExcel
	 * @return
	 */
	@PostMapping(value = "/add")
    @ApiOperation(value="-添加", notes="-添加")
	public Result add(@RequestBody DemoExcel demoExcel) {
		try {
			demoExcelService.save(demoExcel);
	    	return	Result.success("添加成功！");
		} catch (Exception e) {
			e.printStackTrace();
			log.info(e.getMessage());
	    	return	Result.fail("数据已存在");
		}
	}

	/**
	 *  编辑
	 * @param demoExcel
	 * @return
	 */
    @ApiOperation(value="-编辑", notes="-编辑")
    @PutMapping(value = "/edit")
	public Result eidt(@RequestBody DemoExcel demoExcel) {
		DemoExcel demoExcelEntity = demoExcelService.getById(demoExcel.getId());
		if(demoExcelEntity==null) {
		     return	 Result.fail("未找到对应实体");
		}else {
			boolean ok = demoExcelService.updateById(demoExcel);
			//TODO 返回false说明什么？
			if(ok) {
			return	Result.success("修改成功!");
			}
			return	Result.fail("数据已存在");
		}
	}

	/**
	 *   通过id删除
	 * @param id
	 * @return
	 */
    @ApiOperation(value="-通过id删除", notes="-通过id删除")
	@DeleteMapping(value = "/delete")
	public Result delete(@RequestParam(name="id",required=true) String id) {
		DemoExcel demoExcel = demoExcelService.getById(id);
		if(demoExcel==null) {
		     return	Result.fail("未找到对应实体");
		}else {
			boolean ok = demoExcelService.removeById(id);
			if(ok) {
			 return	Result.success("删除成功!");
			}
			 return	Result.fail("删除失败!");
		}
	}

	/**
	 *  批量删除
	 * @param ids
	 * @return
	 */
    @ApiOperation(value="-批量删除", notes="-批量删除")
	@DeleteMapping(value = "/deleteBatch")
	public Result deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		if(ids==null || "".equals(ids.trim())) {
		    return Result.fail("参数不识别！");
		}else {
			this.demoExcelService.removeByIds(Arrays.asList(ids.split(",")));
		    return Result.success("删除成功!");
		}
	}

	/**
	 * 通过id查询
	 * @param id
	 * @return
	 */
    @ApiOperation(value="-通过id查询", notes="-通过id查询")
	@GetMapping(value = "/queryById")
	public Result<DemoExcel> queryById(@RequestParam(name="id",required=true) String id) {
		Result<DemoExcel> result = new Result<DemoExcel>();
		DemoExcel demoExcel = demoExcelService.getById(id);
		if(demoExcel==null) {
			result.fail("未找到对应实体");
		}else {
			result.setData(demoExcel);
			result.setSuccess(true);
		}
		return result;
	}

    /**
    * 通过excel导入数据
    *
    * @param file
    * @return
    */
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public void importExcel(@RequestParam("file") MultipartFile file) {
        List<DemoExcel>  demoExcelList = ExcelUtils.importExcel(file, 0, 1, DemoExcel.class);
        demoExcelService.importExcel(demoExcelList);
    }

    /**
    * 导出excel
    *
    * @param response
    */
    @RequestMapping(value = "/exportExcel")
    public void exportExcel(HttpServletResponse response) {
        List<DemoExcel> demoExcelList = demoExcelService.getAll();
        ExcelUtils.exportExcel(demoExcelList, null, "", DemoExcel.class, ".xls", true, response);
    }

}

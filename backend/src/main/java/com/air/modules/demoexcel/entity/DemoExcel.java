package com.air.modules.demoexcel.entity;

import java.io.Serializable;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import cn.afterturn.easypoi.excel.annotation.Excel;

/**
 * @Description: 
 * @author： lee
 * @date：   2020-03-11
 * @version： V1.0
 */
@Data
@TableName("t_excel")
public class DemoExcel implements Serializable {

    private static final long serialVersionUID = 1L;

	@TableId(type = IdType.UUID)
    @ApiModelProperty(value = "id")
	private java.lang.String id;

    @Excel(name = "姓名", width = 15)
    @ApiModelProperty(value = "name")
	private java.lang.String name;

    @Excel(name = "性别", width = 15)
    @ApiModelProperty(value = "sex")
	private java.lang.String sex;

    @Excel(name = "年龄", width = 15)
    @ApiModelProperty(value = "age")
	private java.lang.Integer age;

    @Excel(name = "地址", width = 15)
    @ApiModelProperty(value = "address")
	private java.lang.String address;

	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "updateTime")
	private java.util.Date updateTime;

	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "createTime")
	private java.util.Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}

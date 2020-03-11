package com.air.common.api.vo;

import lombok.Data;

import java.io.Serializable;

/**
 *  接口返回数据格式
 * @author lee
 */
@Data
public class Result<T> implements Serializable {

	private static final long serialVersionUID = 1L;


	/**
	 * 返回处理消息
	 */
	private String message;

	/**
	 * 返回代码
	 */
	private Integer code;

	private boolean success;

	/**
	 * 返回数据对象 data
	 */
	private T data;

	/**
	 * 时间戳
	 */
	private long timestamp = System.currentTimeMillis();

	public static Result<Object> fail(String msg) {
		return fail(ResultCode.INTERNAL_SERVER_ERROR.code(), msg);
	}

	public static Result<Object> fail(int code, String msg) {
		Result<Object> r = new Result<Object>();
		r.setCode(code);
		r.setMessage(msg);
		r.setSuccess(false);
		return r;
	}

	public static  Result<Object> success(String msg) {
		Result<Object> r = new Result<Object>();
		r.setCode(ResultCode.SUCCESS.code());
		r.setMessage(msg);
		r.setSuccess(true);
		return r;
	}

	public static Result<Object> success(Object obj) {
		Result<Object> r = new Result<Object>();
		r.setCode(ResultCode.SUCCESS.code());
		r.setData(obj);
		r.setSuccess(true);
		return r;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}
}

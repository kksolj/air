package com.air.common.exception;

import com.air.common.api.vo.Result;
import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.slf4j.Slf4j;

/**
 * 异常处理器
 *
 * @author lee
 */
@RestControllerAdvice
@Slf4j
public class ServiceExceptionHandler {

	private Logger log= LoggerFactory.getLogger(ServiceExceptionHandler.class);

	/**
	 * 处理自定义异常
	 */
	@ExceptionHandler(ServiceException.class)
	public Result<?> handleRRException(ServiceException e){
		log.error(e.getMessage(), e);
		return Result.fail(e.getMessage());
	}

	@ExceptionHandler(NoHandlerFoundException.class)
	public Result<?> handlerNoFoundException(Exception e) {
		log.error(e.getMessage(), e);
		return Result.fail(404, "路径不存在，请检查路径是否正确");
	}

	@ExceptionHandler(DuplicateKeyException.class)
	public Result<?> handleDuplicateKeyException(DuplicateKeyException e){
		log.error(e.getMessage(), e);
		return Result.fail("数据库中已存在该记录");
	}

	@ExceptionHandler(AuthorizationException.class)
	public Result<?> handleAuthorizationException(AuthorizationException e){
		log.error(e.getMessage(), e);
		return Result.fail("没有权限，请联系管理员授权");
	}

	@ExceptionHandler(Exception.class)
	public Result<?> handleException(Exception e){
		log.error(e.getMessage(), e);
		return Result.fail(e.getMessage());
	}
}

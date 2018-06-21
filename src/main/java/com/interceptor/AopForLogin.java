package com.interceptor;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.entity.Admin;


/**
 * 权限拦截AOP
 * @author Administrator
 *
 */
@Component
@Aspect
public class AopForLogin {
	 
    @Pointcut("within(com.controller.AdminController.*) and !within(com.controller.AdminController.login())")
    public void pointCut1(){}

    @Around("pointCut1()")
    public Object trackInfo1(ProceedingJoinPoint pjp) throws Throwable {
        Admin admin = (Admin) SysContent.getSession().getAttribute("CUR_ADMIN");
        if(admin == null) {
            System.out.println("哈哈哈哈哈哈哈啊");
        }
    	System.out.println("你是谁你是谁");
        return pjp.proceed();
    }

    /**
     * aop无效等待解决
     */

}
package com.five.myacademy.aop;

import org.aspectj.lang.ProceedingJoinPoint;

public class AfterThrowAdvice {
	
	public Object afterThrowLogging(ProceedingJoinPoint joinPoint)throws Throwable {
		try {
			Object result = joinPoint.proceed();
			return result;
		} catch(Exception e){ 
			String str = joinPoint.getSignature().toLongString();
			System.out.println("에외 발생 " + str);
			e.printStackTrace();
			return null;
		} finally {
		}
	}
}

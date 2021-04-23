package com.wy.Controller;

import com.wy.entity.Role;
import com.wy.entity.SysLog;
import com.wy.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextListener;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
@Aspect
public class LogAop {
    @Resource
    private HttpServletRequest request;
    @Autowired
    private ISysLogService sysLogService;
    private Date startTime; // 访问时间
    private Class executionClass;// 访问的类
    private Method executionMethod; // 访问的方法

    // 主要获取访问时间、访问的类、访问的方法
    @Before("execution(* com.wy.Controller.*.*(..)) && !execution(* com.wy.Controller.SysLogController.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        startTime = new Date();//访问时间
        executionClass = jp.getTarget().getClass();//访问的类
        String methodName = jp.getSignature().getName();//访问的方法的名称
        Object[] args = jp.getArgs();//访问的方法的参数
        if (args == null || args.length == 0) {
            executionMethod = executionClass.getMethod(methodName);
        } else {
            Class[] classArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                classArgs[i] = args[i].getClass();
            }
            executionMethod = executionClass.getMethod(methodName, classArgs);
        }
    }

    @After("execution(* com.wy.Controller.*.*(..)) && !execution(* com.wy.Controller.SysLogController.*(..)) && !execution(* com.wy.Controller.RegisterController.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        String url = "";
        long executionTime = new Date().getTime() - startTime.getTime();//获取操作时长
        if (executionClass != null && executionMethod != null && executionClass != LogAop.class) {
            //获取url
            RequestMapping classAnnotation = (RequestMapping) executionClass.getAnnotation(RequestMapping.class);
            if (classAnnotation != null) {
                String[] classValue = classAnnotation.value();
                RequestMapping methodAnnotation = executionMethod.getAnnotation(RequestMapping.class);
                if (methodAnnotation != null) {
                    String[] methodValue = methodAnnotation.value();
                    url = classValue[0] + methodValue[0];
                }
            }
        }
        //获取ip
        String ip = request.getRemoteAddr();
        //获取当前操作的用户
        User user = getUser();
        if (null == user){
            return;
        }
        String username = user.getUsername();
        SysLog sysLog = new SysLog();
        sysLog.setExecutionTime(executionTime);
        sysLog.setIp(ip);
        sysLog.setUrl(url);
        sysLog.setVisitTime(startTime);
        sysLog.setUsername(username);
        sysLog.setMethod("[类名]" + executionClass.getName() + "[方法名]" + executionMethod.getName());
        sysLogService.save(sysLog);
    }

    private User getUser() {
        SecurityContext context = SecurityContextHolder.getContext();
        User user = null;
        try {
            user = (User) context.getAuthentication().getPrincipal();
        } catch (Exception e) {
            System.out.println("游客访问");
        }
        return user;
    }
}

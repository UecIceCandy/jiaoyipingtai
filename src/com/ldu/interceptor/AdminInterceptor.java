package com.ldu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ldu.pojo.Admin;


public class AdminInterceptor implements HandlerInterceptor {
	
	/* 该方法会在控制器方法前执行，其返回值表示是否中断后续操作。
	 * 当其返回值为true时，表示继续向下执行；当其返回值为false时，会中断后续的所有操作。*/
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin!=null) {
			return true;
		}
		
		System.out.println("////////////"+request.getRequestURI().endsWith("/admin/index"));
		if(request.getRequestURI().endsWith("/admin")) {
			return true;
		}
		if(request.getRequestURI().endsWith("/admin/index")) {
			return true;
		}
		
		response.sendRedirect("error/404");
		return false;
	}

	
	
	/* 该方法会在控制器方法调用之后，且解析视图之前执行。
	 * 可以通过此方法对请求域中的模型和视图做出进一步的修改。*/
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}
	/* 该方法会在整个请求完成，即视图渲染结束之后执行。
	 * 可以通过此方法实现一些资源清理、记录日志信息等工作。 */
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}

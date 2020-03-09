package com.kh.cgx.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WebFilter implements Filter {
	private List<String> passUrl = null;
	private String contextPath;

	@Override
	public void destroy() {
// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
// TODO Auto-generated method stub
// 웹페이지의 root페이지의 url를 취득한다.
		contextPath = filterConfig.getServletContext().getContextPath();
// web.xml에서 설정했던 parameter를 가져와서 설정한다.
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
//User 세션 값이 있으면 통과!
		if (session.getAttribute("admin_id") != null) {
			String adminId = (String)session.getAttribute("admin_id");
			if(!"master".equals(adminId)) {
				res.sendRedirect(contextPath + "/admin/Manager/managerInsert");
			}else {
				chain.doFilter(request, response);
			}
		}else {
		
// User 세션도 없고 passUrl이면 에러를 발생한다.
			res.setStatus(403);
			res.sendRedirect(contextPath + "/error.html");
		}
	}
}

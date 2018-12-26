package com.kh.mhm.common;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.FrameworkServlet;

public class VisitorHitCount implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {

		WebApplicationContext cntx = WebApplicationContextUtils.getWebApplicationContext( se.getSession().getServletContext(), FrameworkServlet.SERVLET_CONTEXT_PREFIX + "appServlet" );

		// 현재 존재하는 자동 삽입 객체 확인
//		for(String str : cntx.getBeanDefinitionNames()) {
//			System.out.println(str);
//			MemberService mService = (MemberService)(cntx.getBean("memberService"));
//			System.out.println("result : "+mService.checkIdDuplicate("admin"));
//		}
		
		CommonDao cDao = (CommonDao)(cntx.getBean("commonDao"));
		
		try {
			if(cDao.selectToday()==0) {
				cDao.insertToday();
			} else {
				cDao.updateCount();
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("세션 종료");
	}

}

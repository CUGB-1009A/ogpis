package com.ogpis.security;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

public class MyAuthenticationFilter extends FormAuthenticationFilter {

	public boolean onPreHandle(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		System.out.println("onPreHandle");
		return true;
	}

}

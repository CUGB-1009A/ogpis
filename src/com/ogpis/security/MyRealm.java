package com.ogpis.security;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.ogpis.system.entity.User;
import com.ogpis.system.service.UserService;

public class MyRealm extends AuthorizingRealm {

	@Autowired
	protected UserService userService;

	/**
	 * 登录认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		// TODO Auto-generated method stub
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		System.out.println("authcToken :" + token.getUsername());
		String username = token.getUsername();

		if (username != null && !"".equals(username)) {
			//用户的验证逻辑
			// User user = userService.findById(id);
			// if (user != null) {
			// return new SimpleAuthenticationInfo(user.getUsername(),
			// user.getPassword(), getName());
			// }
			return new SimpleAuthenticationInfo(username,
					username+"a", getName());
		}

		return null;
	}

	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection pc) {
		// TODO Auto-generated method stub
		return null;
	}

}

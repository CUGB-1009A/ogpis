package com.ogpis.security;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.CollectionUtils;
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
			// 用户的验证逻辑
			User user = userService.findByUserName(username);
			if (user != null) {
				return new SimpleAuthenticationInfo(user.getName(),
						user.getPassword(), getName());
			}
		}
		return null;
	}

	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		//给用户授权
//		String username = (String) principals.getPrimaryPrincipal();
//		User user = userService.findByUserName(username);
//		SimpleAuthorizationInfo auth = new SimpleAuthorizationInfo();
//		if (user != null) {
//			Set<String> viewPermissionSet = new HashSet<String>();
//			Set<String> perms = user.getPerms(site.getId(), viewPermissionSet);
//			if (!CollectionUtils.isEmpty(perms)) {
//				// 权限加入AuthorizationInfo认证对象
//				auth.setStringPermissions(perms);
//			}
//		}
//		return auth;
		return null;
	}
}

package com.thanhvt.springMVC.service.user;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thanhvt.springMVC.dao.user.UserLoginInfoDAO;
import com.thanhvt.springMVC.form.LoginForm;
import com.thanhvt.springMVC.model.data.user.UserLoginInfo;

/**
 * 
 * @author Admin
 *
 */

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	UserLoginInfoDAO dao;

	/**
	 * This function conducts logging in user
	 * 
	 * @param form (Login form)
	 * 
	 * @return userLoginInfo
	 */
	@Override
	@Transactional(readOnly = true)
	public UserLoginInfo loginUser(LoginForm form) {
		// TODO Auto-generated method stub
		try {
			String email = form.getEmail();
			String pass = form.getPassword();
			UserLoginInfo userLoginInfo = dao.getUserLoginInfo(email, pass);
			return userLoginInfo;
		} catch (Exception e) {
		    
		}
		return null;
	}

}

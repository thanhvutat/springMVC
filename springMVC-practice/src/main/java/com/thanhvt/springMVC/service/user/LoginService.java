package com.thanhvt.springMVC.service.user;

import com.thanhvt.springMVC.form.LoginForm;
import com.thanhvt.springMVC.model.data.user.UserLoginInfo;

//@Service
public interface LoginService {

	UserLoginInfo loginUser(LoginForm form);
}

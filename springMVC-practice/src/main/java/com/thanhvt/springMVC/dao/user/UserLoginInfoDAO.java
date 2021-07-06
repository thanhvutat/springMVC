package com.thanhvt.springMVC.dao.user;

import com.thanhvt.springMVC.model.data.user.UserLoginInfo;

public interface UserLoginInfoDAO {

	UserLoginInfo getUserLoginInfo(String email, String password);
}

package com.thanhvt.springMVC.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserRegisterController {

	@RequestMapping(value = "register", method = {RequestMethod.GET, RequestMethod.POST})
	public String register(HttpServletRequest request) {
		System.out.print("thanhvt | Violet | register page request ...\n");
		return "login/register";
	}
}

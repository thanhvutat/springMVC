package com.thanhvt.springMVC.controller.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContactController {

	@RequestMapping(value = "contact", method = {RequestMethod.GET, RequestMethod.GET})
	public String contact(HttpServletRequest request) {
		return "common/contact";
	}
}

package com.thanhvt.springMVC.welcome;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

@Controller
public class HomeController {

	@RequestMapping(value = {"home", ""}, method = { RequestMethod.GET, RequestMethod.POST })
	public String homeController(WebRequest request) {
		System.out.print("thanhvt | Violet | Home page request ...\n");
		return "welcome/home";
	}
}

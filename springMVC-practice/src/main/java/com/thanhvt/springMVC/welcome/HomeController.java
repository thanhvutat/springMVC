package com.thanhvt.springMVC.welcome;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    @RequestMapping(value = { "home", "", "/" }, method = { RequestMethod.GET, RequestMethod.POST })
    public String homeController(HttpServletRequest request) {
        System.out.print("thanhvt | Violet | Home page request ...\n");
        return "welcome/home";
    }
}

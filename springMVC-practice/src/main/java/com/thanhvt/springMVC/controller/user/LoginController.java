package com.thanhvt.springMVC.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thanhvt.springMVC.form.LoginForm;

@Controller
public class LoginController {

	@Inject
	MessageSource messageSource;

	@RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpServletRequest request) {
		System.out.print("thanhvt | Violet | login page request ...\n");
		return "login/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST, params = "form")
	public String login(@Validated LoginForm loginForm, BindingResult result, Model model) {
		try {
			
			if (result.hasErrors()) {
				List<String> errorMessages = new ArrayList<String>();
				for (ObjectError objectError : result.getAllErrors()) {
					errorMessages.add(objectError.getDefaultMessage());
				}
				model.addAttribute("errorMessages", errorMessages);
				return redoLogin(loginForm, model);
			}
			System.out.print("thanhvt | Violet | log form valid ...\n");
		} catch (Exception e) {

		}
		return "welcome/home";
	}

	private String redoLogin(LoginForm loginForm, Model model) {
		model.addAttribute("errorMessages", "Your account information not correct");
		return null;
	}
}

package com.thanhvt.springMVC.controller.user;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thanhvt.springMVC.form.LoginForm;
import com.thanhvt.springMVC.model.data.user.UserLoginInfo;
import com.thanhvt.springMVC.service.user.LoginService;

@Controller
public class LoginController {

    @Inject
    MessageSource messageSource;

    @Inject
    @Autowired
    private LoginService loginService;

    @InitBinder
    public void initBinder(DataBinder binder) {
        binder.validate();
    }

    @RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(HttpServletRequest request) {
        System.out.print("thanhvt | Violet | login page request ...\n");
        return "login/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST, params = "form")
    public String login(Model model, @ModelAttribute("loginForm") LoginForm loginForm, BindingResult result) {
        try {
//            if (result.hasErrors()) {
//                List<String> errorMessages = new ArrayList<String>();
//                String errorMessage;
//                // TODO send a list of error code to client but not show correctly yet
//
//                for (ObjectError objectError : result.getAllErrors()) {
//                    errorMessage = messageSource.getMessage(objectError.getCodes()[0], null,
//                            LocaleContextHolder.getLocale());
//                    System.out.print("thanhvt | Violet | error message ... " + errorMessage + "\n");
//                    errorMessages.add(errorMessage);
//                }
//
//                errorMessage = messageSource.getMessage("loginForm.error", null, LocaleContextHolder.getLocale());
//                model.addAttribute("errorMessages", errorMessage);
//                return redoLogin(loginForm, model);
//            }
			UserLoginInfo userLoginInfor = loginService.loginUser(loginForm);
			if (userLoginInfor != null) {
				return "redirect:login?success";
			} else {

			}
            System.out.print("thanhvt | Violet | log form valid ...\n");

        } catch (Exception e) {
            System.out.print("thanhvt | Violet | log form exception ... " + e + "\n");
//			redoLogin(form, model);
        }
        return "welcome/home";
    }

    public String redoLogin(LoginForm loginForm, Model model) {
//		model.addAttribute("errorMessages", "Your account information is incorrect ...");
        return "login/login";
    }

    @RequestMapping(value = "login", params = "success", method = { RequestMethod.GET, RequestMethod.POST })
    public String loginSuccess(@ModelAttribute("userInfo") UserLoginInfo userInfo, Model model) {
        model.addAttribute("userInfo", userInfo);
        return "login/success";
    }
}

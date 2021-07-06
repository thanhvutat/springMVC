package com.thanhvt.springMVC.form;

import java.io.Serializable;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

//@Data
public class LoginForm implements Serializable {

	public static final long serialVersionUID = 1L;

//	@NotBlank
//	@Email
	public String email;

//	@NotBlank
//	@Size(min = 8, max = 32)
	public String password;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

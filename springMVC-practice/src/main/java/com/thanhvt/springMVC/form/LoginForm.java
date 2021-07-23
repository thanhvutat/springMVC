package com.thanhvt.springMVC.form;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class LoginForm implements Serializable {

	public static final long serialVersionUID = 1L;

	@NotNull
	@Size(min=1)
	public String email;

	@NotNull
	@Size(min=8)
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

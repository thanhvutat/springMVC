package com.thanhvt.springMVC.form;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


import lombok.Data;

@SuppressWarnings("serial")
@Data
public class LoginForm implements Serializable{

	@NotNull
	@Size(min = 8, max = 32)
	private String email;
	
	@NotNull
	private String password;
}

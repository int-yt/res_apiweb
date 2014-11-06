package com.use9.frame.struts.form;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class MyForm1 extends ActionForm {
	private String address;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}

package com.example.demo.common.api.naver.dto;

import com.example.demo.common.functions.GeneralFunctions;

public class NaverDTO {
	private String id;
	private String name;
	private String email;
	private String phone;
	@Override
	public String toString() {
		return "NaverDTO [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public NaverDTO(String id, String name, String email, String phone) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	public NaverDTO() {
		super();
	}
	
	public String hash() {
		return GeneralFunctions.hashMD5(id);
	}
}

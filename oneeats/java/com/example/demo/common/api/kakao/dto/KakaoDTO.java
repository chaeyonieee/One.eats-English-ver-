package com.example.demo.common.api.kakao.dto;

import org.springframework.stereotype.Component;

public class KakaoDTO {

    private long id;
    private String email;
    private String nickname;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public KakaoDTO(long id, String email, String nickname) {
		super();
		this.id = id;
		this.email = email;
		this.nickname = nickname;
	}
	
	@Override
	public String toString() {
		return "KakaoDTO [id=" + id + ", email=" + email + ", nickname=" + nickname + "]";
	}
	
	
	public long hash() {
		long result = 0;
		result += this.id;

		
		return result;
	}
	
}

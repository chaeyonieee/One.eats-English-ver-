package com.example.demo.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private int memberNo;
	private String type;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String gender;
	private Date birth;
	private String sms_agreement;
	private String email_agreement;
	private int busNo;
	private int zipCode;
	private String address;
	private String address_detail;
	private Date creDate;
	private String nickname;
	private String intro;
	private String profileImg;
	private int point;
	
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getSms_agreement() {
		return sms_agreement;
	}
	public void setSms_agreement(String sms_agreement) {
		this.sms_agreement = sms_agreement;
	}
	public String getEmail_agreement() {
		return email_agreement;
	}
	public void setEmail_agreement(String email_agreement) {
		this.email_agreement = email_agreement;
	}
	public int getBusNo() {
		return busNo;
	}
	public void setBusNo(int busNo) {
		this.busNo = busNo;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", type=" + type + ", id=" + id + ", pwd=" + pwd + ", name=" + name
				+ ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", birth=" + birth
				+ ", sms_agreement=" + sms_agreement + ", email_agreement=" + email_agreement + ", busNo=" + busNo
				+ ", zipCode=" + zipCode + ", address=" + address + ", address_detail=" + address_detail + ", creDate="
				+ creDate + ", nickname=" + nickname + ", intro=" + intro + ", profileImg=" + profileImg + ", point="
				+ point + "]";
	}
	
	
}

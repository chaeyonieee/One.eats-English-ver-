package com.example.demo.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("couponVO")
public class CouponVO {
	private int couponNo;
	private String name;
	private String discount_price;
	private String condition;
	private String expDate;
	private Date creDate;
	private int memberNo;
	private String memberName;
	private String couponCode;
	private String used;
	
	
	
	
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(String discount_price) {
		this.discount_price = discount_price;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getExpDate() {
		return expDate;
	}
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	@Override
	public String toString() {
		return "CouponVO [couponNo=" + couponNo + ", name=" + name + ", discount_price=" + discount_price
				+ ", condition=" + condition + ", expDate=" + expDate + ", creDate=" + creDate + ", memberNo="
				+ memberNo + ", memberName=" + memberName + ", couponCode=" + couponCode + ", used=" + used + "]";
	}
	
	
}

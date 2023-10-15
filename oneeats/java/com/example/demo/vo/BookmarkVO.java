package com.example.demo.vo;

import org.springframework.stereotype.Component;

@Component("bookmarkVO")
public class BookmarkVO {
	private int memberNo;
	private int goodsNo;
	private String img1;
	private String name;
	private String price;
	
	
	
	
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	@Override
	public String toString() {
		return "BookmarkVO [memberNo=" + memberNo + ", goodsNo=" + goodsNo + ", + name = " + name + ", img1 = " + img1 + ", price = " + price +" ]";
	}
	
	
}

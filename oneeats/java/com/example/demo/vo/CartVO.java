package com.example.demo.vo;

import org.springframework.stereotype.Component;

// 카트에 담은 Product을 표시하기 위한 VO
@Component
public class CartVO {
	private int goodsNo;
	// 카트에 몇 개 담았는지
	private int goodsQty;
	private String goodsName;
	// Product 메인 이미지만 저장
	private String goodsImg;
	// Product이 원래 개당 얼마인지
	private int goodsPrice;
	
	// 원래(Product을 하나씩 살때)보다 얼마나 Discount Price 받았는지
	private int discountPrice;
	
	// 옵션 테이블에서 가져오는 값들. optionQty는 당근 3개 들이의 3개
	private int optionNo;
	private String optionName;
	private int optionQty;
	private int optionPrice;
	private String optionInbun;
	
	
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getOptionPrice() {
		return optionPrice;
	}
	public void setOptionPrice(int optionPrice) {
		this.optionPrice = optionPrice;
	}

	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	
	
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public int getGoodsQty() {
		return goodsQty;
	}
	public void setGoodsQty(int goodsQty) {
		this.goodsQty = goodsQty;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	
	public int getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public int getOptionQty() {
		return optionQty;
	}
	public void setOptionQty(int optionQty) {
		this.optionQty = optionQty;
	}
	public String getOptionInbun() {
		return optionInbun;
	}
	public void setOptionInbun(String optionInbun) {
		this.optionInbun = optionInbun;
	}
	
	
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	
	// discoutPrice를 다른 필드값을 바탕으로 계산해서 저장하는 메소드
	public void setDiscountPrice() {
		this.discountPrice = (goodsPrice * optionQty-optionPrice)*goodsQty;
	}
	@Override
	public String toString() {
		return "CartVO [goodsNo=" + goodsNo + ", goodsQty=" + goodsQty + ", goodsName=" + goodsName + ", goodsImg="
				+ goodsImg + ", goodsPrice=" + goodsPrice + ", discountPrice=" + discountPrice + ", optionNo="
				+ optionNo + ", optionName=" + optionName + ", optionQty=" + optionQty + ", optionPrice=" + optionPrice
				+ ", optionInbun=" + optionInbun + "]";
	}
	
	
	
}

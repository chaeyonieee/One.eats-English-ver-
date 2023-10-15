package com.example.demo.vo;


import org.springframework.stereotype.Component;

@Component("optionVO")
public class OptionVO {
	
	public OptionVO() { 
	
	}
	private int optionNo;
	private String name;
	private String option_qty;
	private String price;
	private int goodsNo;

	

	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOption_qty() {
		return option_qty;
	}
	public void setOption_qty(String option_qty) {
		this.option_qty = option_qty;
	}

	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public OptionVO(int optionNo,String name, String option_qty, String price) {
		super();
		this.name = name;
		this.option_qty = option_qty;
		this.price = price;
		
	}
	
	public OptionVO(int optionNo,String name, String option_qty, String price, int goodsNo) {
		super();
		this.name = name;
		this.option_qty = option_qty;
		this.price = price;
		this.optionNo=optionNo;
		this.goodsNo=goodsNo;
	}
	@Override
	public String toString() {
		return "OptionVO [optionNo=" + optionNo + ", name=" + name + ", option_qty=" + option_qty + ", price=" + price
				+ ", goodsNo=" + goodsNo + "]";
	}
	
	
}
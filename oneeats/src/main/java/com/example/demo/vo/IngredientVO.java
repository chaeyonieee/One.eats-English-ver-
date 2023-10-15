package com.example.demo.vo;

import org.springframework.stereotype.Component;

@Component
public class IngredientVO {
	private String name;
	private String qty;
	private int recipeNo;
	
	
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public IngredientVO(String name, String qty) {
		super();
		this.name = name;
		this.qty = qty;
	}
	public IngredientVO(int recipeNo,String name, String qty) {
		super();
		this.name = name;
		this.qty = qty;
		this.recipeNo = recipeNo;
	}
	public IngredientVO() {
		super();
	}
	@Override
	public String toString() {
		return "IngredientVO [name=" + name + ", qty=" + qty + ", recipeNo=" + recipeNo + "]";
	}

	
	
	
}

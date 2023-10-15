package com.example.demo.vo;

import java.sql.Date;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component("recipeVO")
public class RecipeVO {
	private int recipeNo;
	private String title;
	private String cooking_time;
	private String description;
	private String cookingImg;
	private String category;
	private String inbun;
	private Date creDate;
	private int memberNo;
	private String memberId;
	
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCooking_time() {
		return cooking_time;
	}
	public void setCooking_time(String cooking_time) {
		this.cooking_time = cooking_time;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCookingImg() {
		return cookingImg;
	}
	public void setCookingImg(String cookingImg) {
		this.cookingImg = cookingImg;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getInbun() {
		return inbun;
	}
	public void setInbun(String inbun) {
		this.inbun = inbun;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "RecipeVO [recipeNo=" + recipeNo + ", title=" + title + ", cooking_time=" + cooking_time
				+ ", description=" + description + ", cookingImg=" + cookingImg + ", category=" + category + ", inbun="
				+ inbun + ", creDate=" + creDate + ", memberNo=" + memberNo + "]";
	}
	
	

	
	
}

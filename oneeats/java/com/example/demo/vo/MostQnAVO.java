package com.example.demo.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("mostQnAVO")
public class MostQnAVO {
	private int qnaNo;
	private String category;
	private String title;
	private String content;
	private Date creDate;
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	@Override
	public String toString() {
		return "MostQnAVO [qnaNo=" + qnaNo + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", creDate=" + creDate + "]";
	}
	
	
	
}

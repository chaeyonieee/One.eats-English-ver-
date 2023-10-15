package com.example.demo.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("oneQnAVO")
public class OneQnAVO {
	private int qnaNo;
	private String title;
	private String content;
	private Date creDate;
	private String status;
	private int parentNo;
	private int memberNo;
	private String memberName;
	private String profile;
	private String id;
	private int level;
	
	
	
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "OneQnAVO [qnaNo=" + qnaNo + ", title=" + title + ", content=" + content + ", creDate=" + creDate
				+ ", status=" + status + ", parentNo=" + parentNo + ", memberNo=" + memberNo + ", memberName="
				+ memberName + ", profile=" + profile + ", id=" + id + ", level=" + level + "]";
	}
	
	
}

package com.example.demo.vo;

import org.springframework.stereotype.Component;

@Component("pointHistoryVO")
public class PointHistoryVO {

	private int pointNo;
	private String name;
	private String creDate;
	private String finishDate;
	private int amount;
	private int memberNo;
	public int getPointNo() {
		return pointNo;
	}
	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreDate() {
		return creDate;
	}
	public void setCreDate(String creDate) {
		this.creDate = creDate;
	}
	public String getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "PointHistoryVO [pointNo=" + pointNo + ", name=" + name + ", creDate=" + creDate + ", finishDate="
				+ finishDate + ", amount=" + amount + ", memberNo=" + memberNo + "]";
	}
	
}

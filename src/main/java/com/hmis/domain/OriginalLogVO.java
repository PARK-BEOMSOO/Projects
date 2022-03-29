package com.hmis.domain;

import java.util.Date;

public class OriginalLogVO extends ApplyVO{
	
	private int originalNo;
	private String oriApprover;
	private Date oriApprovalDate;
	private int applyNo;
	
	
	public int getOriginalNo() {
		return originalNo;
	}
	public void setOriginalNo(int originalNo) {
		this.originalNo = originalNo;
	}
	public String getOriApprover() {
		return oriApprover;
	}
	public void setOriApprover(String oriApprover) {
		this.oriApprover = oriApprover;
	}
	public Date getOriApprovalDate() {
		return oriApprovalDate;
	}
	public void setOriApprovalDate(Date oriApprovalDate) {
		this.oriApprovalDate = oriApprovalDate;
	}
	public int getApplyNo() {
		return applyNo;
	}
	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}
	
	
	@Override
	public String toString() {
		return "OriginalLogVO [originalNo=" + originalNo + ", oriApprover=" + oriApprover + ", oriApprovalDate="
				+ oriApprovalDate + ", applyNo=" + applyNo + "]";
	}
	
	
	
}

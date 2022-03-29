package com.hmis.domain;

import java.sql.Date;

public class NonsubjectVO {

	private int nonsubjectNo;
	private String nonsubName;
	private Date finishDate;
	private String content;
	private int userNo;
	public int getNonsubjectNo() {
		return nonsubjectNo;
	}
	public void setNonsubjectNo(int nonsubjectNo) {
		this.nonsubjectNo = nonsubjectNo;
	}
	public String getNonsubName() {
		return nonsubName;
	}
	public void setNonsubName(String nonsubName) {
		this.nonsubName = nonsubName;
	}
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "NonsubjectVO [nonsubjectNo=" + nonsubjectNo + ", nonsubName=" + nonsubName + ", finishDate="
				+ finishDate + ", content=" + content + ", userNo=" + userNo + "]";
	}
	
	

}

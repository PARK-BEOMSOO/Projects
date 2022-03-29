package com.hmis.domain;

import java.sql.Date;

public class AnnouncementVO {
	private int annNo;
	private String title;
	private String compName;
	private Date endDate;
	private String job;
	private String compArea;
	private String content;
	private String regName;
	private Date regDate;
	private int viewCount;

	public int getAnnNo() {
		return annNo;
	}

	public void setAnnNo(int annNo) {
		this.annNo = annNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getCompArea() {
		return compArea;
	}

	public void setCompArea(String compArea) {
		this.compArea = compArea;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegName() {
		return regName;
	}

	public void setRegName(String regName) {
		this.regName = regName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	@Override
	public String toString() {
		return "AnnouncementVO [annNo=" + annNo + ", title=" + title + ", compName=" + compName + ", endDate=" + endDate
				+ ", job=" + job + ", compArea=" + compArea + ", content=" + content + ", regName=" + regName
				+ ", regDate=" + regDate + "]";
	}

}

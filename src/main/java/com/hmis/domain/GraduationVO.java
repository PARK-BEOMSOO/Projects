package com.hmis.domain;

import java.util.Date;

/*
졸업
CREATE TABLE TBL_GRADUATION
(
    GRADU_NO             NUMBER NOT NULL ,
    APP_START            DATE NOT NULL ,
    APP_END              DATE NOT NULL ,
    REG_DATE             DATE NOT NULL ,
    TITLE                VARCHAR2(50) NOT NULL ,
    GRADU_STATE          VARCHAR2(20) NOT NULL
    CONTENTS             VARCHAR2(3000) NULL  (추가)
);
*/

public class GraduationVO {

	private int graduNo; // 졸업번호
	private Date appStart; // 신청 시작일
	private Date appEnd;// 신청 종료일
	private Date regDate;// 작성일
	private String title;// 제목
	private String graduState;// 마감 상태
	private int underline;

	public int getUnderline() {
		return underline;
	}

	public void setUnderline(int underline) {
		this.underline = underline;
	}

	public int getGraduNo() {
		return graduNo;
	}

	public void setGraduNo(int graduNo) {
		this.graduNo = graduNo;
	}

	public Date getAppStart() {
		return appStart;
	}

	public void setAppStart(Date appStart) {
		this.appStart = appStart;
	}

	public Date getAppEnd() {
		return appEnd;
	}

	public void setAppEnd(Date appEnd) {
		this.appEnd = appEnd;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGraduState() {
		return graduState;
	}

	public void setGraduState(String graduState) {
		this.graduState = graduState;
	}

	@Override
	public String toString() {
		return "GraduationVO [graduNo=" + graduNo + ", appStart=" + appStart + ", appEnd=" + appEnd + ", regDate="
				+ regDate + ", title=" + title + ", graduState=" + graduState + ", underline=" + underline + "]";
	}

}

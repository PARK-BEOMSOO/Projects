// 0) 패키지 및 라이브러리 임포트
package com.hmis.domain;

/**
 * @author beomsoo
 */
//1) class 선언
public class PortfolioVO {
	
/*	    
  CREATE TABLE TBL_PORTFOLIO
    (
        USER_NO           NUMBER NOT NULL ,
        AVG_SCORE         NUMBER NULL ,
        JOB_AREA          VARCHAR2(50) NULL ,
        PHONE     		  CHAR(18) NULL ,
        USER_SALARY       VARCHAR2(10) NULL 
	);
*/	
	
	// 2) 변수 선언
	private int userNo;
	private float avgScore;
	private String jobArea;
	private String phone;
	private String userSalary;
	
	// 3) getter and setter 생성
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public float getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(float avgScore) {
		this.avgScore = avgScore;
	}
	public String getJobArea() {
		return jobArea;
	}
	public void setJobArea(String jobArea) {
		this.jobArea = jobArea;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserSalary() {
		return userSalary;
	}
	public void setUserSalary(String userSalary) {
		this.userSalary = userSalary;
	}
	
	// 4) toString() 재정의
	@Override
	public String toString() {
		return "PortfolioVO [userNo=" + userNo + ", avgScore=" + avgScore + ", jobArea=" + jobArea + ", phone=" + phone
				+ ", userSalary=" + userSalary + "]";
	}



}

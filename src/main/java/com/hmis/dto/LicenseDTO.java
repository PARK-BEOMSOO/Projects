// 0) 패키지 및 라이브러리 임포트
package com.hmis.dto;

import java.util.Date;

/**
 * @author beomsoo
 */
//1) class 선언
public class LicenseDTO {

	/**
	CREATE TABLE TBL_LICENSE
	(
		USER_NO               NUMBER NOT NULL ,
		APPLY_NO           NUMBER NOT NULL ,
		SUB_NO          NUMBER NOT NULL ,
		SERIAL_NUM             VARCHAR2(50) NOT NULL ,
		AC_DATE              DATE NOT NULL ,
		SCORE               NUMBER NULL ,
	)
	
	CREATE TABLE TBL_APPLY
	(
	   APPLY_NO             NUMBER NOT NULL ,
	   USER_NO              NUMBER NOT NULL ,
	   SUB_NO               NUMBER NOT NULL ,
	   APPLY_STATE          VARCHAR2(20) DEFAULT '승인대기'   NOT NULL ,
	   REASON               VARCHAR2(100) NULL ,
	   SERIAL_NUM           VARCHAR2(50) NULL ,
	   AC_DATE              DATE NULL ,
	   APPLY_DATE           DATE DEFAULT SYSDATE NOT NULL ,
	   CONTENT              VARCHAR2(3000) NULL 
	)
	*/
	
	// 2) 변수 선언
		//TBL_LICENSE, TBL_APPLY
		private int userNo;
		private int applyNo;
		private int subNo;
		private String serialNum;
		private Date acDate;
		//TBL_LICENSE
		private int score;
		//TBL_APPLY
		private int acScore;
		private String applyState;
		private String reason;
		private Date applyDate;
		private String approver;
		private String content;
		
		
		// 3) getter and setter 생성
		public int getUserNo() {
			return userNo;
		}
		public void setUserNo(int userNo) {
			this.userNo = userNo;
		}
		public int getApplyNo() {
			return applyNo;
		}
		public void setApplyNo(int applyNo) {
			this.applyNo = applyNo;
		}
		public int getSubNo() {
			return subNo;
		}
		public void setSubNo(int subNo) {
			this.subNo = subNo;
		}
		public String getSerialNum() {
			return serialNum;
		}
		public void setSerialNum(String serialNum) {
			this.serialNum = serialNum;
		}
		public Date getAcDate() {
			return acDate;
		}
		public void setAcDate(Date acDate) {
			this.acDate = acDate;
		}
		public int getScore() {
			return score;
		}
		public void setScore(int score) {
			this.score = score;
		}
		public int getAcScore() {
			return acScore;
		}
		public void setAcScore(int acScore) {
			this.acScore = acScore;
		}
		public String getApplyState() {
			return applyState;
		}
		public void setApplyState(String applyState) {
			this.applyState = applyState;
		}
		public String getReason() {
			return reason;
		}
		public void setReason(String reason) {
			this.reason = reason;
		}
		public Date getApplyDate() {
			return applyDate;
		}
		public void setApplyDate(Date applyDate) {
			this.applyDate = applyDate;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getApprover() {
			return approver;
		}
		public void setApprover(String approver) {
			this.approver = approver;
		}
		
		// 4) toString() 재정의
		@Override
		public String toString() {
			return "LicenseDTO [userNo=" + userNo + ", applyNo=" + applyNo + ", subNo=" + subNo + ", serialNum="
					+ serialNum + ", acDate=" + acDate + ", score=" + score + ", acScore=" + acScore + ", applyState="
					+ applyState + ", reason=" + reason + ", applyDate=" + applyDate + ", approver=" + approver
					+ ", content=" + content + "]";
		}
}

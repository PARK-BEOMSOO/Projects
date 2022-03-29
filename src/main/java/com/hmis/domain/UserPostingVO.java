// 0) 패키지 및 라이브러리 임포트
package com.hmis.domain;

import java.util.Date;

/**
 * @author beomsoo
 */
// 1) class 선언
public class UserPostingVO {
	
/*	    
CREATE TABLE TBL_USER_POSTING
(
	UP_NO                NUMBER NOT NULL ,
	POSTING_ID           NUMBER(7) NOT NULL ,	
	USER_NO              NUMBER NOT NULL ,
	SLEDDING             NUMBER(1) NOT NULL ,
	RECOMMAND_SCORE                NUMBER NULL ,
	RECOMMAND_DATE                 DATE NULL 
);
*/	
	
	// 2) 변수 선언
	private int upNo;
	private int postingId;
	private int userNo;
	private int sledding;
	private int recommandScore;
	private Date recommandDate;
	
	// 3) getter and setter 생성
	public int getUpNo() {
		return upNo;
	}

	public void setUpNo(int upNo) {
		this.upNo = upNo;
	}

	public int getPostingId() {
		return postingId;
	}

	public void setPostingId(int postingId) {
		this.postingId = postingId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSledding() {
		return sledding;
	}

	public void setSledding(int sledding) {
		this.sledding = sledding;
	}

	public int getRecommandScore() {
		return recommandScore;
	}

	public void setRecommandScore(int recommandScore) {
		this.recommandScore = recommandScore;
	}

	public Date getRecommandDate() {
		return recommandDate;
	}

	public void setRecommandDate(Date recommandDate) {
		this.recommandDate = recommandDate;
	}
	
	// 4) toString() 재정의
	@Override
	public String toString() {
		return "UserPostingVO [upNo=" + upNo + ", postingId=" + postingId + ", userNo=" + userNo + ", sledding="
				+ sledding + ", recommandScore=" + recommandScore + ", recommandDate=" + recommandDate + "]";
	}


}

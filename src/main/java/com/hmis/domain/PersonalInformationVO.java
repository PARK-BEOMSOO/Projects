// 0) 패키지 및 라이브러리 임포트
package com.hmis.domain;

/**
 * @author beomsoo
 */
//1) class 선언
public class PersonalInformationVO {
	
/*	    
	CREATE TABLE TBL_PERSONAL_INFORMATION
	(
		USER_NO              NUMBER NOT NULL ,
		ASSENT               NUMBER(1) NOT NULL 
	);
*/	
	
	// 2) 변수 선언
	private int userNo;
	private int assent;
	
	// 3) getter and setter 생성
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getAssent() {
		return assent;
	}
	public void setAssent(int assent) {
		this.assent = assent;
	}
	
	// 4) toString() 재정의
	@Override
	public String toString() {
		return "PersonalInformationVO [userNo=" + userNo + ", assent=" + assent + "]";
	}

}

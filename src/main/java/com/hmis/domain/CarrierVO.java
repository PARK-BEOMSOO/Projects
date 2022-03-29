package com.hmis.domain;

/*--진로테이블
CREATE TABLE TBL_CARRIER
(
   CAR_NO               NUMBER NOT NULL ,
   CAR_NAME             VARCHAR2(30) NOT NULL 
);*/
public class CarrierVO
{
	private int carNo;
	private int userNo;
	private String carName;
	
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public int getCarNo() {
		return carNo;
	}
	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "CarrierVO [carNo=" + carNo + ", userNo=" + userNo + ", carName=" + carName + "]";
	}

}
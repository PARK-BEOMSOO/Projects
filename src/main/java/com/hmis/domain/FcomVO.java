package com.hmis.domain;

/*--가족기업
 * CREATE TABLE TBL_FCOM
(
	FCOM_NO              NUMBER NOT NULL ,
	FCOM_NAME            VARCHAR2(50) NOT NULL ,
	COM_TYPE             VARCHAR2(50) NOT NULL ,
	CEO                  VARCHAR2(15) NOT NULL ,
	CONTENTS             VARCHAR2(3000) NULL 
)*/
public class FcomVO {

	private int fcomNo;
	private String fcomName;
	private String comType;
	private String ceo;
	private String contents;
	private int underline;
	
	
	public int getUnderline() {
		return underline;
	}
	public void setUnderline(int underline) {
		this.underline = underline;
	}
	public int getFcomNo() {
		return fcomNo;
	}
	public void setFcomNo(int fcomNo) {
		this.fcomNo = fcomNo;
	}
	public String getFcomName() {
		return fcomName;
	}
	public void setFcomName(String fcomName) {
		this.fcomName = fcomName;
	}
	public String getComType() {
		return comType;
	}
	public void setComType(String comType) {
		this.comType = comType;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "FcomVO [fcomNo=" + fcomNo + ", fcomName=" + fcomName + ", comType=" + comType + ", ceo=" + ceo
				+ ", contents=" + contents + ", underline=" + underline + "]";
	}

	

}

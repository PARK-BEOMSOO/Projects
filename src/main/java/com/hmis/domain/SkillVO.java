package com.hmis.domain;

public class SkillVO {
	private int skillNo;
	private String skillName;
	private int userNo;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSkillNo() {
		return skillNo;
	}

	public void setSkillNo(int skillNo) {
		this.skillNo = skillNo;
	}

	public String getSkillName() {
		return skillName;
	}

	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}

	@Override
	public String toString() {
		return "SkillVO [skillNo=" + skillNo + ", skillName=" + skillName + ", userNo=" + userNo + "]";
	}
}
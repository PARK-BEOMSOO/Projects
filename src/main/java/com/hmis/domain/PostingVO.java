// 0) 패키지 및 라이브러리 임포트
package com.hmis.domain;

/**
 * @author beomsoo
 */
// 1) class 선언
public class PostingVO {
	
/*	    
  CREATE TABLE TBL_POSTING
    (
        POSTING_ID           NUMBER(7) NOT NULL ,
        JOB_NAME             VARCHAR2(1000) NOT NULL ,
        COMPANY_SIZE         VARCHAR2(100) NOT NULL ,
        COMPANY_OVERVIEW     CLOB NOT NULL ,
        JOB_DESC             CLOB NOT NULL ,
        JOB_REQUIREMENT      CLOB NOT NULL ,
        CONTENT              CLOB NULL ,
        COMPANY_NAME         VARCHAR2(300) NOT NULL ,
        SALARY		VARCHAR2(100) NULL ,
        LINK	VARCHAR2(2000) NULL
	);
*/	
	
	// 2) 변수 선언
	private int postingId;
	private String companyName;
	private String jobName;
	private String companySize;
	private String companyOverview;
	private String jobDesc;
	private String jobRequirement;
	private String content;
	private String salary;
	private String linkAddress;
	
	// 3) getter and setter 생성
	public int getPostingId() {
		return postingId;
	}
	public void setPostingId(int postingId) {
		this.postingId = postingId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getCompanySize() {
		return companySize;
	}
	public void setCompanySize(String companySize) {
		this.companySize = companySize;
	}
	public String getCompanyOverview() {
		return companyOverview;
	}
	public void setCompanyOverview(String companyOverview) {
		this.companyOverview = companyOverview;
	}
	public String getJobDesc() {
		return jobDesc;
	}
	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}
	public String getJobRequirement() {
		return jobRequirement;
	}
	public void setJobRequirement(String jobRequirement) {
		this.jobRequirement = jobRequirement;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getLinkAddress() {
		return linkAddress;
	}
	public void setLinkAddress(String linkAddress) {
		this.linkAddress = linkAddress;
	}
	
	// 4) toString() 재정의
	@Override
	public String toString() {
		return "PostingVO [postingId=" + postingId + ", companyName=" + companyName + ", jobName=" + jobName
				+ ", companySize=" + companySize + ", companyOverview=" + companyOverview + ", jobDesc=" + jobDesc
				+ ", jobRequirement=" + jobRequirement + ", content=" + content + ", salary=" + salary
				+ ", linkAddress=" + linkAddress + "]";
	}
	
}

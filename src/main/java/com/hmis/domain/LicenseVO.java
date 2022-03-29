package com.hmis.domain;

import java.util.Date;

public class LicenseVO {

   private int subNo;
   private int userNo;
   private int applyNo;
   private String serialNum;
   private Date acDate;
   private int score;
   private String subName;
   private String publication;
   private String area;

   public int getSubNo() {
      return subNo;
   }

   public void setSubNo(int subNo) {
      this.subNo = subNo;
   }

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

   public String getSubName() {
      return subName;
   }

   public void setSubName(String subName) {
      this.subName = subName;
   }

   public String getPublication() {
      return publication;
   }

   public void setPublication(String publication) {
      this.publication = publication;
   }

   public String getArea() {
      return area;
   }

   public void setArea(String area) {
      this.area = area;
   }

   @Override
   public String toString() {
      return "LicenseVO [subNo=" + subNo + ", userNo=" + userNo + ", applyNo=" + applyNo + ", serialNum=" + serialNum
            + ", acDate=" + acDate + ", score=" + score + ", subName=" + subName + ", publication=" + publication
            + ", area=" + area + "]";
   }

}
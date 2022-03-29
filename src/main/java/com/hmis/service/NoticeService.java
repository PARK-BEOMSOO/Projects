package com.hmis.service;

import java.util.List;

import com.hmis.domain.NoticeFileVO;
import com.hmis.domain.NoticeVO;
import com.hmis.domain.SearchCriteria;

public interface NoticeService {

	
	   // 1. 관리자 :: Notice 등록
	   public void register(NoticeVO vo) throws Exception;

	   // 2. 관리자 :: Notice 상세보기
	   //	  학생 :: Notice 상세보기
	   public NoticeVO read(int noticeNo) throws Exception;

	   // 3. 관리자 :: Notice 수정
	   public void modify(NoticeVO vo) throws Exception;

	   // 4. 관리자 :: Notice 삭제
	   public void remove(int noticeNo) throws Exception;
	   
	   // 5. 관리자 :: Notice 검색 가능한 목록
	   //    학생 :: Notice 검색 가능한 목록
	   public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception;

	   // 6. 관리자 :: Notice 검색 가능한 목록 ---> 페이징 , 카운트
	   //    학생 :: Notice 검색 가능한 목록 ---> 페이징 , 카운트
	   public int listSearchCount(SearchCriteria cri) throws Exception;
	
	   
	   // 7. 관리자 :: 파일 목록
	   public List<NoticeFileVO> fileList(int noticeNo) throws Exception;
		
}

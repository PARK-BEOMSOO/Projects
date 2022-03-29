<<<<<<< HEAD
// 0) 패키지 및 라이브러리 임포트
package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.PostingVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.dto.RecommandDTO;


/**
 * 
 * @author beomsoo
 *
 */
//1) interface 선언
public interface PostingDAO {
	
	// 1) 관리자 : 채용공고 등록
	public void insertPosting(PostingVO postingVO) throws Exception;
	
	// 2) 관리자 : 채용공고 상세보기
	public PostingVO readPosting(int postingId) throws Exception;
	
	// 3) 관리자 : 채용공고 수정
	public void updatePosting(PostingVO postingVO) throws Exception;

	// 4) 관리자 : 채용공고 삭제
	public void deletePosting(int postingId) throws Exception;
	
	// 5) 관리자 : 검색 가능한 채용공고 목록 페이징 처리
	public List<PostingVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	// 6) 관리자 : 검색 가능한 채용공고 목록 페이징 처리
	public int listCountSearchCriteria(SearchCriteria cri) throws Exception;
	
	// 7) 관리자 : 인재 추천
	public List<RecommandDTO> recommandStudent(RecommandDTO recommandDTO) throws Exception;
	
	// 8) 학생 : 채용공고 추천
	public List<RecommandDTO> recommandPosting(int userNo) throws Exception;
}
=======
// 0) 패키지 및 라이브러리 임포트
package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.PostingVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.dto.RecommandDTO;

/**
 * 
 * @author beomsoo
 *
 */
// 1) interface 선언
public interface PostingDAO {

	// 1) 관리자 : 채용공고 등록
	public void insertPosting(PostingVO postingVO) throws Exception;

	// 2) 관리자 : 채용공고 상세보기
	public PostingVO readPosting(int postingId) throws Exception;

	// 3) 관리자 : 채용공고 수정
	public void updatePosting(PostingVO postingVO) throws Exception;

	// 4) 관리자 : 채용공고 삭제
	public void deletePosting(int postingId) throws Exception;

	// 5) 관리자 : 검색 가능한 채용공고 목록 페이징 처리
	public List<PostingVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	// 6) 관리자 : 검색 가능한 채용공고 목록 페이징 처리
	public int listCountSearchCriteria(SearchCriteria cri) throws Exception;

	// 7) 관리자 : 인재 추천
	public List<RecommandDTO> recommandStudent(RecommandDTO recommandDTO) throws Exception;

	// 8) 학생 : 채용공고 추천
	public List<RecommandDTO> recommandPosting(RecommandDTO recommandDTO) throws Exception;

	// 인재 추천 결과 저장
	public void registerRecommand(RecommandDTO recommandDTO) throws Exception;
}
>>>>>>> branch 'master' of https://github.com/Ohsojin/HR_Matching.git

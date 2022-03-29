<<<<<<< HEAD
package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.PostingVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.dto.RecommandDTO;
import com.hmis.persistence.PostingDAO;

/**
 * @author beomsoo
 */
@Service
public class PostingServiceImpl implements PostingService{

	@Inject
	PostingDAO postingDAO;
	
	// 1) 관리자 : 채용공고 등록
	@Override
	public void registerPosting(PostingVO postingVO) throws Exception{
		postingDAO.insertPosting(postingVO);
	}
	
	// 2) 관리자 : 채용공고 상세보기
	@Override
	public PostingVO readPosting(int postingId) throws Exception{
		return postingDAO.readPosting(postingId);
	}

	// 3) 관리자 : 채용공고 수정
	@Override
	public void modifyPosting(PostingVO postingVO) throws Exception{
		postingDAO.updatePosting(postingVO);
	}

	// 4) 관리자 : 채용공고 삭제
	@Override
	public void removePosting(int postingId) throws Exception{
		postingDAO.deletePosting(postingId);
	}

	// 5) 관리자 : 검색 가능한 채용공고 목록 페이징 처리
	@Override
	public List<PostingVO> listSearchCriteria(SearchCriteria cri) throws Exception{
		return postingDAO.listSearchCriteria(cri);
	}

	// 6) 관리자 : 검색 가능한 채용공고 목록 페이징 처리
	@Override
	public int listCountSearchCriteria(SearchCriteria cri) throws Exception{
		return postingDAO.listCountSearchCriteria(cri);

	}

	// 7) 관리자 : 인재추천
	@Override
	public List<RecommandDTO> recommandStudent(RecommandDTO recommandDTO) throws Exception{
		return postingDAO.recommandStudent(recommandDTO);
	}

	// 8) 학생 : 채용공고 추천
	@Override
	public List<RecommandDTO> recommandPosting(int userNo) throws Exception{
		return postingDAO.recommandPosting(userNo);
	}

}
=======
package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.PostingVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.dto.RecommandDTO;
import com.hmis.persistence.PostingDAO;

/**
 * @author beomsoo
 */
@Service
public class PostingServiceImpl implements PostingService{

	@Inject
	PostingDAO postingDAO;
	
	// 1) 관리자 : 채용공고 등록
	@Override
	public void registerPosting(PostingVO postingVO) throws Exception{
		postingDAO.insertPosting(postingVO);
	}
	
	// 2) 관리자 : 채용공고 상세보기
	@Override
	public PostingVO readPosting(int postingId) throws Exception{
		return postingDAO.readPosting(postingId);
	}

	// 3) 관리자 : 채용공고 수정
	@Override
	public void modifyPosting(PostingVO postingVO) throws Exception{
		postingDAO.updatePosting(postingVO);
	}

	// 4) 관리자 : 채용공고 삭제
	@Override
	public void removePosting(int postingId) throws Exception{
		postingDAO.deletePosting(postingId);
	}

	// 5) 관리자 : 검색 가능한 채용공고 목록 페이징 처리
	@Override
	public List<PostingVO> listSearchCriteria(SearchCriteria cri) throws Exception{
		return postingDAO.listSearchCriteria(cri);
	}

	// 6) 관리자 : 검색 가능한 채용공고 목록 페이징 처리
	@Override
	public int listCountSearchCriteria(SearchCriteria cri) throws Exception{
		return postingDAO.listCountSearchCriteria(cri);

	}

	// 7) 관리자 : 인재추천
	@Override
	public List<RecommandDTO> recommandStudent(RecommandDTO recommandDTO) throws Exception{
		return postingDAO.recommandStudent(recommandDTO);
	}

	// 8) 학생 : 채용공고 추천
	@Override
	public List<RecommandDTO> recommandPosting(RecommandDTO recommandDTO) throws Exception{
		return postingDAO.recommandPosting(recommandDTO);
	}

	@Override
	public void registerRecommand(RecommandDTO recommandDTO) throws Exception {
		postingDAO.registerRecommand(recommandDTO);
		
	}

}
>>>>>>> branch 'master' of https://github.com/Ohsojin/HR_Matching.git

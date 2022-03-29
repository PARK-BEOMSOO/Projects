<<<<<<< HEAD
package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.PostingVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.dto.RecommandDTO;

/**
 * @author beomsoo
 */
@Repository
public class PostingDAOImpl implements PostingDAO{

	@Inject
	private SqlSession session;

	private static String namespacePosting = "com.hmis.mapper.PostingMapper";

	// 1) 관리자 : 채용공고 등록
	@Override
	public void insertPosting(PostingVO postingVO) {
		session.insert(namespacePosting + ".insert", postingVO);
	}
	
	// 2) 관리자 : 채용공고 상세보기
	@Override
	public PostingVO readPosting(int postingId) {
		return session.selectOne(namespacePosting + ".read", postingId);
		
	}
	
	// 3) 관리자 : 채용공고 수정
	@Override
	public void updatePosting(PostingVO postingVO) {
		session.update(namespacePosting + ".update", postingVO);
	}

	// 4) 관리자 : 채용공고 삭제
	@Override
	public void deletePosting(int postingId) {
		session.delete(namespacePosting + ".delete", postingId);
	}

	// 5) 관리자 : 채용공고 목록 페이징 처리(검색)
	@Override
	public List<PostingVO> listSearchCriteria(SearchCriteria cri) {
		return session.selectList(namespacePosting + ".listSearchCriteria", cri);
	}

	// 6) 관리자 : 페이징 처리를 위한 채용공고 수 가져오기(검색)
	@Override
	public int listCountSearchCriteria(SearchCriteria cri) {
		return session.selectOne(namespacePosting + ".listCountSearchCriteria", cri);
	}

	// 7) 관리자 : 인재추천
	@Override
	public List<RecommandDTO> recommandStudent(RecommandDTO recommandDTO) {
		return session.selectList(namespacePosting + ".recommand", recommandDTO);
	}

	// 8) 학생 : 채용공고 추천
	@Override
	public List<RecommandDTO> recommandPosting(int userNo) {
		return session.selectList(namespacePosting + ".recommandPosting", userNo);
	}

}
	
=======
package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.PostingVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.dto.RecommandDTO;

/**
 * @author beomsoo
 */
@Repository
public class PostingDAOImpl implements PostingDAO{

	@Inject
	private SqlSession session;

	private static String namespacePosting = "com.hmis.mapper.PostingMapper";

	// 1) 관리자 : 채용공고 등록
	@Override
	public void insertPosting(PostingVO postingVO) {
		session.insert(namespacePosting + ".insert", postingVO);
	}
	
	// 2) 관리자 : 채용공고 상세보기
	@Override
	public PostingVO readPosting(int postingId) {
		return session.selectOne(namespacePosting + ".read", postingId);
		
	}
	
	// 3) 관리자 : 채용공고 수정
	@Override
	public void updatePosting(PostingVO postingVO) {
		session.update(namespacePosting + ".update", postingVO);
	}

	// 4) 관리자 : 채용공고 삭제
	@Override
	public void deletePosting(int postingId) {
		session.delete(namespacePosting + ".delete", postingId);
	}

	// 5) 관리자 : 채용공고 목록 페이징 처리(검색)
	@Override
	public List<PostingVO> listSearchCriteria(SearchCriteria cri) {
		return session.selectList(namespacePosting + ".listSearchCriteria", cri);
	}

	// 6) 관리자 : 페이징 처리를 위한 채용공고 수 가져오기(검색)
	@Override
	public int listCountSearchCriteria(SearchCriteria cri) {
		return session.selectOne(namespacePosting + ".listCountSearchCriteria", cri);
	}

	// 7) 관리자 : 인재추천
	@Override
	public List<RecommandDTO> recommandStudent(RecommandDTO recommandDTO) {
		return session.selectList(namespacePosting + ".recommand", recommandDTO);
	}

	// 8) 학생 : 채용공고 추천
	@Override
	public List<RecommandDTO> recommandPosting(RecommandDTO recommandDTO) {
		return session.selectList(namespacePosting + ".recommandPosting", recommandDTO);
	}

	@Override
	public void registerRecommand(RecommandDTO recommandDTO) throws Exception {
		session.insert(namespacePosting + ".registerRecommand", recommandDTO);
	}

}
	
>>>>>>> branch 'master' of https://github.com/Ohsojin/HR_Matching.git

package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.PortfolioVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserVO;

public interface PortfolioDAO {

	// 관리자 포트폴리오 목록
	public List<UserVO> selectAllPortfoliosList(SearchCriteria cri);
	
	public int selectAllPortfoliosCount(SearchCriteria cri);
	
	public PortfolioVO selectOnePortfolioByUserNo(int userNo);

	public void updatePortfolio(PortfolioVO pVo);


}

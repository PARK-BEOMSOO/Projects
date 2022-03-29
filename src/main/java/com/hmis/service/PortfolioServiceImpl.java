package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.PortfolioVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserVO;
import com.hmis.persistence.PortfolioDAO;

@Service
public class PortfolioServiceImpl implements PortfolioService{
	
	@Inject
	PortfolioDAO dao;

	@Override
	public List<UserVO> selectAllPortfoliosList(SearchCriteria cri) {
		return dao.selectAllPortfoliosList(cri);
	}

	@Override
	public int selectAllPortfoliosCount(SearchCriteria cri) {
		return dao.selectAllPortfoliosCount(cri);
	}

	@Override
	public PortfolioVO selectOnePortfolioByUserNo(int userNo) {
		return dao.selectOnePortfolioByUserNo(userNo);
	}

	@Override
	public void updatePortfolio(PortfolioVO pVo) {
		dao.updatePortfolio(pVo);
		
	}
	
	

}

package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.PortfolioVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.UserVO;

@Repository
public class PortfolioDAOImpl implements PortfolioDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.hmis.mapper.PortfolioMapper";

	@Override
	public List<UserVO> selectAllPortfoliosList(SearchCriteria cri) {
		return session.selectList(namespace + ".selectAllPortfoliosList", cri);
	}

	@Override
	public int selectAllPortfoliosCount(SearchCriteria cri) {
		return session.selectOne(namespace + ".selectAllPortfoliosCount", cri);
	}

	@Override
	public PortfolioVO selectOnePortfolioByUserNo(int userNo) {
		return session.selectOne(namespace + ".selectOnePortfolioByUserNo", userNo);
	}

	@Override
	public void updatePortfolio(PortfolioVO pVo) {
		session.update(namespace + ".updatePortfolio", pVo);

	}

}

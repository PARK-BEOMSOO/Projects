package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.NonsubjectVO;

@Repository
public class NonsubjectDAOImpl implements NonsubjectDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.hmis.mapper.NonsubjectMapper";

	@Override
	public List<NonsubjectVO> selectAllNonsubject(int userNo) {
		return session.selectList(namespace + ".selectAllNonsubject", userNo);
	}

	@Override
	public void insertNonsubject(NonsubjectVO nVo) {
		session.insert(namespace + ".insertNonsubject", nVo);
	}

	@Override
	public void updateNonsubject(NonsubjectVO nVo) {
		session.update(namespace + ".updateNonsubject", nVo);
	}

	@Override
	public void deleteNonsubject(int nonsubjectNo) {
		session.delete(namespace + ".deleteNonsubject", nonsubjectNo);
	}

	@Override
	public NonsubjectVO selectOneNonsubject(int nonsubjectNo) {
		return session.selectOne(namespace + ".selectOneNonsubject", nonsubjectNo);
	}

}

package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.NonsubjectVO;
import com.hmis.persistence.NonsubjectDAO;

@Service
public class NonsubjectServiceImpl implements NonsubjectService {

	@Inject
	NonsubjectDAO dao;

	@Override
	public List<NonsubjectVO> selectAllNonsubject(int userNo) {
		return dao.selectAllNonsubject(userNo);
	}

	@Override
	public void insertNonsubject(NonsubjectVO nVo) {
		dao.insertNonsubject(nVo);
	}

	@Override
	public void updateNonsubject(NonsubjectVO nVo) {
		dao.updateNonsubject(nVo);
	}

	@Override
	public void deleteNonsubject(int nonsubjectNo) {
		dao.deleteNonsubject(nonsubjectNo);
	}

	@Override
	public NonsubjectVO selectOneNonsubject(int nonsubjectNo) {
		return dao.selectOneNonsubject(nonsubjectNo);
	}

}

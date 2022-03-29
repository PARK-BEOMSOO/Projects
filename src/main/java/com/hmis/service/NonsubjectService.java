package com.hmis.service;

import java.util.List;

import com.hmis.domain.NonsubjectVO;

public interface NonsubjectService {

	public List<NonsubjectVO> selectAllNonsubject(int userNo);

	public void insertNonsubject(NonsubjectVO nVo);

	public void updateNonsubject(NonsubjectVO nVo);

	public void deleteNonsubject(int nonsubjectNo);

	public NonsubjectVO selectOneNonsubject(int nonsubjectNo);

}

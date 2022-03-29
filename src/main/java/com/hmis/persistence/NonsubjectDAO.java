package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.NonsubjectVO;

public interface NonsubjectDAO {
	
	public List<NonsubjectVO> selectAllNonsubject(int userNo);
	
	public void insertNonsubject(NonsubjectVO nVo);
	
	public void updateNonsubject(NonsubjectVO nVo);
	
	public void deleteNonsubject(int nonsubjectNo);
	
	public NonsubjectVO selectOneNonsubject(int nonsubjectNo);
	

}

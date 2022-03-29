package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.SkillVO;
import com.hmis.persistence.SkillDAO;

@Service
public class SkillServiceImpl implements SkillService{
	

	@Inject
	SkillDAO dao;

	@Override
	public List<SkillVO> selectAllSkills(int userNo) {
		return dao.selectAllSkills(userNo);
	}

	@Override
	public void insertSkill(SkillVO sVo) {
		dao.insertSkill(sVo);
	}

	@Override
	public void deleteSkill(SkillVO sVo) {
		dao.deleteSkill(sVo);
	}

	@Override
	public List<SkillVO> selectSkill(int userNo) {
		return dao.selectSkill(userNo);
	}

}

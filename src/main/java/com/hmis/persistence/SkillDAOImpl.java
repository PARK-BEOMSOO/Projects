package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.SkillVO;

@Repository
public class SkillDAOImpl implements SkillDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.hmis.mapper.SkillMapper";

	@Override
	public List<SkillVO> selectAllSkills(int userNo) {
		return session.selectList(namespace + ".selectAllSkills", userNo);
	}

	@Override
	public void insertSkill(SkillVO sVo) {
		session.insert(namespace + ".insertSkill", sVo);
	}

	@Override
	public void deleteSkill(SkillVO sVo) {
		session.delete(namespace + ".deleteSkill", sVo);
	}

	@Override
	public List<SkillVO> selectSkill(int userNo) {
		return session.selectList(namespace + ".selectSkill", userNo);
	}

}

package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.SkillVO;

public interface SkillDAO {

	// c Read u d 기술번호(skill_no)순으로 모든 기술 리스트 출력
	public List<SkillVO> selectAllSkills(int userNo);

	// Create r u d 매개변수로 받은 VO객체를 TBL_USER_SKILL테이블에 삽입
	public void insertSkill(SkillVO sVo);

	// c r u Delete 매개변수에 해당되는 정보(기술번호-학번) TBL_USER_SKILL테이블에서 삭제
	public void deleteSkill(SkillVO sVo);

	// c Read u d 기술번호(skill_no)순으로 입력된 기술 리스트 출력
	public List<SkillVO> selectSkill(int userNo);

}

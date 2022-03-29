package com.hmis.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.ApplyVO;
import com.hmis.domain.OriginalLogVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.domain.SubjectVO;
import com.hmis.dto.LicenseDTO;
import com.hmis.dto.TotalDTO;

@Repository
public class ApplyDAOImpl implements ApplyDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.hmis.mapper.ApplyMapper";

	@Override
	public List<SubjectVO> searchSub(String subName) throws Exception {

		return session.selectList(namespace + ".searchSub", subName);
	}

	@Override
	public int insert(ApplyVO aVo) throws Exception {
		session.insert(namespace + ".insert", aVo);

		return aVo.getApplyNo();
	}

	@Override
	public List<ApplyVO> stuApplyList(int userNo) throws Exception {

		return session.selectList(namespace + ".stuApplyList", userNo);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public ApplyVO stuApplySelect(int applyNo) throws Exception {

		return session.selectOne(namespace + ".stuApplySelect", applyNo);
	}

	@Override
	public List<ApplyVO> adApplyList(SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".adApplyList", cri);
	}

	@Override
	public List<ApplyVO> waitList() throws Exception {

		return session.selectList(namespace + ".waitList");
	}

	@Override
	public ApplyVO adApplySelect(int applyNo) throws Exception {

		return session.selectOne(namespace + ".adApplySelect", applyNo);
	}

	@Override
	public void accept(int applyNo, String reason, String approver) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("applyNo", applyNo);
		paramMap.put("reason", reason);
		paramMap.put("approver", approver);

		session.update(namespace + ".accept", paramMap);

	}

	@Override
	public void deny(int applyNo, String reason, String approver) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("applyNo", applyNo);
		paramMap.put("reason", reason);
		paramMap.put("approver", approver);

		session.update(namespace + ".deny", paramMap);

	}

	@Override
	public List<SubjectVO> subList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".subList");
	}

	@Override
	public List<TotalDTO> esList(SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".esList", cri);
	}

	@Override
	public TotalDTO esSelect(int userNo) throws Exception {

		return session.selectOne(namespace + ".esSelect", userNo);
	}

	@Override
	public List<ApplyVO> acceptList(int userNo) throws Exception {

		return session.selectList(namespace + ".acceptList", userNo);
	}

	@Override
	public int esListCount(SearchCriteria cri) throws Exception {

		return session.selectOne(namespace + ".esListConut", cri);
	}

	@Override
	public List<TotalDTO> excelEsList() throws Exception {

		return session.selectList(namespace + ".excelEsList");
	}

	@Override
	public int adApplyListSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".adApplyListSearchCount", cri);
	}

	@Override
	public int exInsert(ApplyVO aVo) throws Exception {
		session.insert(namespace + ".exInsert", aVo);
		return aVo.getApplyNo();
	}

	@Override
	public int oriLogInsert(OriginalLogVO oLVo) throws Exception {
		session.insert(namespace + ".oriLogInsert", oLVo);
		return oLVo.getOriginalNo();
	}

	@Override
	public OriginalLogVO oriLogList(int applyNo) throws Exception {

		OriginalLogVO originalLogVO = null;
		List<OriginalLogVO> list = session.selectList(namespace + ".oriLogList", applyNo);

		if (list.size() > 0) {

			originalLogVO = list.get(0);
		}

		return originalLogVO;

	}

	@Override
	public void standBy(int applyNo, String approver) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("applyNo", applyNo);
		paramMap.put("approver", approver);

		session.update(namespace + ".standBy", paramMap);
	}

	@Override
	public int searchSubNo(int applyNo) throws Exception {
		return session.selectOne(namespace + ".searchSubNo", applyNo);
	}

	@Override
	public void updateSubNo(ApplyVO aVo) throws Exception {
		session.update(namespace + ".updateSubNo", aVo);

	}

	/**
	 * @author beomsoo
	 */
	// K-Digital : subNo 확인 
	@Override
	public int checkApply(int applyNo) throws Exception {
		return session.selectOne(namespace + ".checkApply", applyNo);
	}

	// K-Digital : subNo가 다를 경우 TBL_APPLY 자격증 정보 update 수행
	@Override
	public void updateApply(LicenseDTO licenseDTO) throws Exception {
		session.update(namespace + ".updateApply", licenseDTO);
	}

	// K-Digital : 자격증  - 승인
	@Override
	public void acceptApply(LicenseDTO licenseDTO) throws Exception {
		session.update(namespace + ".acceptApply", licenseDTO);
	}

	// K-Digital : 승인된 경우 e-포트폴리오 TBL_LICENSE에 데이터 insert
	@Override
	public void insertLicense(LicenseDTO licenseDTO) throws Exception {
		System.out.println(licenseDTO);
		session.insert(namespace + ".insertLicense", licenseDTO);
	}

}

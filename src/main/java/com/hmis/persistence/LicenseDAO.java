package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.LicenseVO;

public interface LicenseDAO {

	public List<LicenseVO> selectAllLicenses(int userNo);

	// 등록을 위한 (pupup) 자격증 영역 목록
	public List<LicenseVO> selectAllSubject(int userNo);

	// 자격증 승인 시 등록
	public void insertLicense(LicenseVO lVo);

	// 자격증 삭제
	public void deleteLicense(LicenseVO lVo);

	// 학생이 등록한 외국어 영역 목록
	public List<LicenseVO> selectAllLanguages(int userNo);

	// 등록을 위한 (pupup) 외국어 영역 목록
	public List<LicenseVO> selectLanguageList(int userNo);


}

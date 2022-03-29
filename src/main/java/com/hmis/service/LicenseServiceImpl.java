package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.LicenseVO;
import com.hmis.persistence.LicenseDAO;

@Service
public class LicenseServiceImpl implements LicenseService {

	@Inject
	LicenseDAO dao;

	@Override
	public List<LicenseVO> selectAllLicenses(int userNo) {
		return dao.selectAllLicenses(userNo);
	}

	@Override
	public List<LicenseVO> selectAllSubject(int userNo) {
		return dao.selectAllSubject(userNo);
	}

	@Override
	public void insertLicense(LicenseVO lVo) {
		dao.insertLicense(lVo);
	}

	@Override
	public void deleteLicense(LicenseVO lVo) {
		dao.deleteLicense(lVo);
	}

	@Override
	public List<LicenseVO> selectAllLanguages(int userNo) {
		return dao.selectAllLanguages(userNo);
	}

	@Override
	public List<LicenseVO> selectLanguageList(int userNo) {
		return dao.selectLanguageList(userNo);
	}


}

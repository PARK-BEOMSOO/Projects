package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.LicenseVO;

@Repository
public class LicenseDAOImpl implements LicenseDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.hmis.mapper.LicenseMapper";

	@Override
	public List<LicenseVO> selectAllLicenses(int userNo) {
		return session.selectList(namespace + ".selectAllLicenses", userNo);
	}

	@Override
	public List<LicenseVO> selectAllSubject(int userNo) {
		return session.selectList(namespace + ".selectAllSubject", userNo);
	}

	@Override
	public void insertLicense(LicenseVO lVo) {
		session.insert(namespace + ".insertLicense", lVo);
	}

	@Override
	public void deleteLicense(LicenseVO lVo) {
		session.delete(namespace + ".deleteLicense", lVo);
	}

	@Override
	public List<LicenseVO> selectAllLanguages(int userNo) {
		return session.selectList(namespace + ".selectAllLanguages", userNo);
	}

	@Override
	public List<LicenseVO> selectLanguageList(int userNo) {
		return session.selectList(namespace + ".selectLanguageList", userNo);
	}

}

package com.hmis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hmis.domain.AnnouncementVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.persistence.AnnouncementDAO;

@Service
public class AnnouncementServiceImpl implements AnnouncementService{
	
	@Inject
	AnnouncementDAO dao;

	@Override
	public List<AnnouncementVO> selectAllAnnouncements(SearchCriteria cri) {
		return dao.selectAllAnnouncements(cri);
	}

	@Override
	public int selectAllAnnouncementsCount(SearchCriteria cri) {
		return dao.selectAllAnnouncementsCount(cri);
	}

	@Override
	public void insertAnnouncement(AnnouncementVO aVo) {
		dao.insertAnnouncement(aVo);
	}

	@Override
	public void updateViewCount(int annNo) {
		dao.updateViewCount(annNo);
	}

	@Override
	public AnnouncementVO selectOneAnnouncementByNum(int annNo) {
		return dao.selectOneAnnouncementByNum(annNo);
	}

	@Override
	public void updateAnnouncement(AnnouncementVO aVo) {
		dao.updateAnnouncement(aVo);
	}

	@Override
	public void deleteAnnouncement(int annNo) {
		dao.deleteAnnouncement(annNo);
	}

}

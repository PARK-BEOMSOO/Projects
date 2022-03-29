package com.hmis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hmis.domain.AnnouncementVO;
import com.hmis.domain.SearchCriteria;

@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.hmis.mapper.AnnouncementMapper";

	@Override
	public List<AnnouncementVO> selectAllAnnouncements(SearchCriteria cri) {
		return session.selectList(namespace + ".selectAllAnnouncements", cri);
	}

	@Override
	public int selectAllAnnouncementsCount(SearchCriteria cri) {
		return session.selectOne(namespace + ".selectAllAnnouncementsCount", cri);
	}

	@Override
	public void insertAnnouncement(AnnouncementVO aVo) {
		session.insert(namespace + ".insertAnnouncement", aVo);
	}

	@Override
	public void updateViewCount(int annNo) {
		session.update(namespace + ".updateViewCount", annNo);
	}

	@Override
	public AnnouncementVO selectOneAnnouncementByNum(int annNo) {
		return session.selectOne(namespace + ".selectOneAnnouncementByNum", annNo);
	}

	@Override
	public void updateAnnouncement(AnnouncementVO aVo) {
		session.update(namespace + ".updateAnnouncement", aVo);
	}

	@Override
	public void deleteAnnouncement(int annNo) {
		session.delete(namespace + ".deleteAnnouncement", annNo);
	}

}

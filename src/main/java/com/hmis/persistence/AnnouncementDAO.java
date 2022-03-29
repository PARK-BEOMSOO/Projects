package com.hmis.persistence;

import java.util.List;

import com.hmis.domain.AnnouncementVO;
import com.hmis.domain.SearchCriteria;

public interface AnnouncementDAO {

	public List<AnnouncementVO> selectAllAnnouncements(SearchCriteria cri);

	public int selectAllAnnouncementsCount(SearchCriteria cri);

	public void insertAnnouncement(AnnouncementVO aVo);

	public void updateViewCount(int annNo);

	// 게시판 글 상세 내용 보기 : 글번호로 찾아온다. : 실패 null
	public AnnouncementVO selectOneAnnouncementByNum(int annNo);

	public void updateAnnouncement(AnnouncementVO aVo);

	public void deleteAnnouncement(int annNo);

}

package com.hmis.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.service.AnnouncementService;

@Controller
@RequestMapping("user/announcement/*")
public class UserAnnouncementController {

	@Inject
	private AnnouncementService service;

	private static Logger logger = LoggerFactory.getLogger(UserAnnouncementController.class);

	// 사용자 :: 졸업인증신청 관리 - 신청 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("Admin Announcement List Form.....");
		logger.info(cri.toString());

		model.addAttribute("list", service.selectAllAnnouncements(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.selectAllAnnouncementsCount(cri));
		model.addAttribute("pageMaker", pageMaker);

	}
	
	   //2. 사용자 :: 상세보기
	   @RequestMapping(value = "/read", method = RequestMethod.GET)
	   public void read(@RequestParam("annNo") int annNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		   logger.info("readPage.........");
		   //취업공고 조회수
		  service.updateViewCount(annNo);
	      model.addAttribute("aVo", service.selectOneAnnouncementByNum(annNo));
	   }
	   

}

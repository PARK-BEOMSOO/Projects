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
import com.hmis.service.NoticeService;

@Controller
@RequestMapping("/user/notice/*")
public class UserNoticeController {

	@Inject
	private NoticeService service;

	private static Logger logger = LoggerFactory.getLogger(UserNoticeController.class);

	// 1. 학생 :: 리스트 띄우기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info("Notice listGET...");

		model.addAttribute("list", service.listSearch(cri));
		logger.info("list size: " + service.listSearch(cri).size());

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);

	}

	// 2. 학생::상세보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("readPage.........");

		// 공지사항 내용
		model.addAttribute(service.read(noticeNo));

		// 업로드한 파일 리스트
		logger.info("readPage.NoticeFileVO: " + service.fileList(noticeNo).size());
		model.addAttribute("noticeFileVO", service.fileList(noticeNo));

		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

}

package com.hmis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hmis.domain.NoticeVO;
import com.hmis.domain.PageMaker;
import com.hmis.domain.SearchCriteria;
import com.hmis.service.NoticeService;

@Controller
@RequestMapping("/admin/notice/*")
public class AdminNoticeController {

	@Inject
	private NoticeService service;

	private static Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);

	// 1. 관리자:: 리스트 띄우기
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

	// 2. 관리자 :: 상세보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		logger.info("readPage.........");

		// 프로그램 내용
		model.addAttribute(service.read(noticeNo));

		// 업로드한 파일 리스트
		logger.info("readPage.FileVO: " + service.fileList(noticeNo).size());
		model.addAttribute("noticeFileVO", service.fileList(noticeNo));
		
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());
	}

	// 3. 관리자 :: 공지사항 등록 화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(HttpServletRequest request) throws Exception {
		logger.info("Admin notice register get..");

	}

	// 4. 관리자 :: 공지사항 등록
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(NoticeVO vo, RedirectAttributes rttr) throws Exception {

		logger.info("Admin notice Register POST .......");
		logger.info("vo : " + vo);

		service.register(vo);
		logger.info("vo : " + vo);
		rttr.addFlashAttribute("msg", "register");

		return "redirect:/admin/notice/list";
	}

	// 5. 관리자 :: 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception {

		logger.info("Admin notice modifyGET....");
		model.addAttribute(service.read(noticeNo));
		model.addAttribute("noticeFileVO", service.fileList(noticeNo));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(NoticeVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		logger.info("Admin notice modifyPOST.....");
		logger.info(cri.toString());

		service.modify(vo);

		rttr.addFlashAttribute("msg", "MODIFY");
		rttr.addFlashAttribute("vo", vo);

		logger.info(rttr.toString());

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/admin/notice/list";
	}

	// 6. 관리자 :: 공지사항 관리 - 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String adremove(@RequestParam("noticeNo") int noticeNo, SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.remove(noticeNo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "REMOVE");
		return "redirect:/admin/notice/list";

	}

}

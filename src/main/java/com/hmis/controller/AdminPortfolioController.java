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
import com.hmis.service.LicenseService;
import com.hmis.service.NonsubjectService;
import com.hmis.service.PortfolioService;
import com.hmis.service.SkillService;
import com.hmis.service.UscarService;
import com.hmis.service.UserMajorService;
import com.hmis.service.UserProgramService;

@Controller
@RequestMapping("admin/portfolio/*")
public class AdminPortfolioController {

	@Inject
	private PortfolioService service;

	@Inject
	private LicenseService licenseService;

	@Inject
	private UscarService uscarService;

	@Inject
	private NonsubjectService nonSubjectService;

	@Inject
	private UserProgramService userProgramService;

	@Inject
	private SkillService skillService;

	@Inject
	private UserMajorService userMajorService;

	private static Logger logger = LoggerFactory.getLogger(AdminPortfolioController.class);

	// 1. 관리자 :: 학생 e-포트폴리오 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info("Admin portfolio List.....");

		model.addAttribute("list", service.selectAllPortfoliosList(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.selectAllPortfoliosCount(cri));
		model.addAttribute("pageMaker", pageMaker);

	}

	// 2. 관리자 :: 학생 e-포트폴리오 상세보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void info(@RequestParam("userNo") int userNo, @RequestParam("userName") String userName,
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info("Admin portfolio read .....");
		model.addAttribute("userName", userName);

		// 1.포트폴리오 기본 정보
		model.addAttribute("pVo", service.selectOnePortfolioByUserNo(userNo));

		// 2.자격증 정보
		model.addAttribute("licenseList", licenseService.selectAllLicenses(userNo));

		// 3.외국어 정보
		model.addAttribute("languageList", licenseService.selectAllLanguages(userNo));

		// 4.보유기술
		model.addAttribute("SkillList", skillService.selectSkill(userNo));

		// 5.수강 전공
		model.addAttribute("majorList", userMajorService.listAll(userNo));

		// 6.진로분야
		model.addAttribute("carrierList", uscarService.everyUscarList(userNo));

		// 7. 프로그램
		model.addAttribute("programList", userProgramService.acceptProList(userNo));

		// 8.비교과 프로그램
		model.addAttribute("nonsubList", nonSubjectService.selectAllNonsubject(userNo));
		
		System.out.println(cri);

		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

}

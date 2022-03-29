package com.hmis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hmis.domain.PortfolioVO;
import com.hmis.domain.UserVO;
import com.hmis.service.LicenseService;
import com.hmis.service.NonsubjectService;
import com.hmis.service.PortfolioService;
import com.hmis.service.SkillService;
import com.hmis.service.UscarService;
import com.hmis.service.UserMajorService;
import com.hmis.service.UserProgramService;

@Controller
@RequestMapping("user/portfolio/*")
public class UserPortfolioController {

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

	private static Logger logger = LoggerFactory.getLogger(UserPortfolioController.class);

	// 1. 사용자 :: 포트폴리오 기초 정보 - 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(HttpServletRequest request, Model model) throws Exception {
		logger.info("User portfolio List Form.....");

		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");

		model.addAttribute("list", service.selectOnePortfolioByUserNo(uVo.getUserNo()));

	}

	// 2-1. 사용자 :: 포트폴리오 기초 정보 수정 화면 ->list 화면에서 아이콘 클릭하여 삭제 GET 방식으로 요청
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("userNo") int userNo, Model model) throws Exception {
		logger.info("User portfolio modifyGET....");
		model.addAttribute("pVo", service.selectOnePortfolioByUserNo(userNo));
	}

	// 2-2. 사용자 :: 포트폴리오 기초 정보 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(PortfolioVO pVo, RedirectAttributes rttr) throws Exception {

		logger.info("User portfolio modifyPOST.....");
		service.updatePortfolio(pVo);
		rttr.addFlashAttribute("msg", "수정되었습니다.");
		logger.info(rttr.toString());

		return "redirect:/user/portfolio/list";
	}

	// 3. 사용자 :: e-포트폴리오
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void info(HttpServletRequest request, Model model) throws Exception {
		logger.info("User portfolio info Form.....");

		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");
		int userNo = uVo.getUserNo();

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
		

	}

}

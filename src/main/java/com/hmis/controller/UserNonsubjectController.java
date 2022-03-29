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

import com.hmis.domain.NonsubjectVO;
import com.hmis.domain.UserVO;
import com.hmis.service.NonsubjectService;

@Controller
@RequestMapping("user/nonsubject/*")
public class UserNonsubjectController {

	@Inject
	private NonsubjectService service;

	private static Logger logger = LoggerFactory.getLogger(UserNonsubjectController.class);

	// 1. 사용자 :: 비교과 - 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(HttpServletRequest request, Model model) throws Exception {
		logger.info("User nonsubject List Form.....");

		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");

		model.addAttribute("list", service.selectAllNonsubject(uVo.getUserNo()));

	}

	// 2-1. 사용자 :: 비교과 등록화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(HttpServletRequest request) throws Exception {
		logger.info("User nonsubject register get..");

	}

	// 2-2. 사용자 :: 비교과 등록
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(NonsubjectVO nVo, RedirectAttributes rttr) throws Exception {

		logger.info("User nonsubject Register POST .......");
		logger.info("vo : " + nVo);

		service.insertNonsubject(nVo);
		rttr.addFlashAttribute("msg", "등록되었습니다.");

		return "redirect:/user/nonsubject/list";
	}

	// 3-1. 사용자 :: 비교과 수정 화면 ->list 화면에서 아이콘 클릭하여 삭제 GET 방식으로 요청
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("nonsubjectNo") int nonsubjectNo, Model model)
			throws Exception {
		logger.info("User nonsubject modifyGET....");
		model.addAttribute("nVo", service.selectOneNonsubject(nonsubjectNo));
	}

	// 3-2. 사용자 :: 비교과 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(NonsubjectVO nVo, RedirectAttributes rttr)
			throws Exception {

		logger.info("User nonsubject modifyPOST.....");

		service.updateNonsubject(nVo);

		rttr.addFlashAttribute("msg", "수정되었습니다.");

		logger.info(rttr.toString());

		return "redirect:/user/nonsubject/list";
	}

	// 4. 사용자 :: 비교과 삭제 ->list 화면에서 아이콘 클릭하여 삭제 GET 방식으로 요청
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String adremove(@RequestParam("nonsubjectNo") int nonsubjectNo, RedirectAttributes rttr) throws Exception {

		service.deleteNonsubject(nonsubjectNo);

		rttr.addFlashAttribute("msg", "삭제되었습니다.");

		return "redirect:/user/nonsubject/list";

	}

}

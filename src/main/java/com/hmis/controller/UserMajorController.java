package com.hmis.controller;

import java.util.List;

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

import com.hmis.domain.UserMajorVO;
import com.hmis.domain.UserVO;
import com.hmis.service.UserMajorService;

@Controller
@RequestMapping("user/major/*")
public class UserMajorController {

	private static final Logger logger = LoggerFactory.getLogger(UserMajorController.class);

	@Inject
	private UserMajorService service;

	// e-포트폴리오 수강전공 분야 - 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");
		model.addAttribute("listAll", service.listAll(uVo.getUserNo()));
	}

	// e-포트폴리오 수강한 전공목록 - 등록 페이지로 이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void read(HttpServletRequest request, Model model) throws Exception {

		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");
		int userNo = uVo.getUserNo();

		logger.info("read..... userNo : " + userNo);

		// 리스트 & 수정 페이지
		model.addAttribute("listAll", service.listAll(userNo));
		model.addAttribute("userNo", userNo);
		model.addAttribute("otherList", service.otherList(userNo));// 제외된 학생 LIST

	}

	// e-포트폴리오 수강한 전공목록 - 등록하기
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String updatePOST(@RequestParam("userNo") int userNo, RedirectAttributes rttr,
			@RequestParam(value = "arrayMajor", required = true) List<Integer> majorNos) throws Exception {

		// 기존 리스트 삭제 - 먼저 실행
		service.umremove(userNo);

		// 새로운 리스트 등록 - 리스트 삭제 실행 후 실행
		for (int i = 0; i < majorNos.size(); i++) {

			UserMajorVO umVo = new UserMajorVO();
			umVo.setUserNo(userNo);
			umVo.setMajorNo(majorNos.get(i));

			logger.info("usermajor majorNos: " + umVo.getMajorNo());
			service.register(umVo);
		}

		rttr.addFlashAttribute("msg", "MODIFY");

		return "redirect:/user/major/list";

	}

}
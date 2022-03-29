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

import com.hmis.domain.CarrierVO;
import com.hmis.domain.UscarVO;
import com.hmis.domain.UserVO;
import com.hmis.service.UscarService;

@Controller
@RequestMapping("user/carrier/*")
public class UserCarrierController {

	private static final Logger logger = LoggerFactory.getLogger(UserCarrierController.class);

	@Inject
	private UscarService service;

	// 1. 학생 :: carrier/register -> 진로 분야 목록 팝업창
	@RequestMapping(value = "/searchPopup", method = RequestMethod.GET)
	public void searchPopup(@RequestParam("userNo") int userNo, Model model) throws Exception {
		logger.info("saerchPopup......");
		List<CarrierVO> carList = service.carList(userNo);
		model.addAttribute("carList", carList);

	}

	// 2. 학생 :: 진로 분야 등록 화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("register get ......");
	}

	// 3. 학생 :: 진로 분야 등록 POST
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UscarVO uscar, RedirectAttributes rttr) throws Exception {

		logger.info("Uscar Register POST .......");
		logger.info("uscar : " + uscar);
		service.register(uscar);
		rttr.addFlashAttribute("msg", "등록 되었습니다.");

		return "redirect:/user/carrier/list";
	}

	// e-포트폴리오 진로분야 - 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");
		model.addAttribute("list", service.everyUscarList(uVo.getUserNo()));
	}

	// e-포트폴리오 진로분야 - 삭제하기
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String uscarremove(@RequestParam("uscarNo") int uscarNo, RedirectAttributes rttr)
			throws Exception {

		logger.info("uscarremove get.................");
		service.remove(uscarNo);

		rttr.addFlashAttribute("msg", "삭제되었습니다.");
		return "redirect:/user/carrier/list";

	}

}
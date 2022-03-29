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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hmis.domain.SkillVO;
import com.hmis.domain.UserVO;
import com.hmis.service.SkillService;

@Controller
@RequestMapping("user/skill/*")
public class UserSkillController {

	@Inject
	private SkillService service;

	private static Logger logger = LoggerFactory.getLogger(UserSkillController.class);

	// 1. 사용자 ::보유기술 관리 - 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(HttpServletRequest request, Model model) throws Exception {
		logger.info("User skill List Form.....");

		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");

		model.addAttribute("list", service.selectSkill(uVo.getUserNo()));

	}

	// 2-1. 사용자 :: 보유기술 등록화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(HttpServletRequest request) throws Exception {
		logger.info("User skill register get..");

	}

	// 2-2. 사용자 :: 보유기술 등록
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(SkillVO sVo, RedirectAttributes rttr) throws Exception {

		logger.info("User (skill Register POST .......");
		logger.info("vo : " + sVo);

		service.insertSkill(sVo);
		rttr.addFlashAttribute("msg", "등록되었습니다.");

		return "redirect:/user/skill/list";
	}

	// 3. 사용자 :: 보유기술 선택 팝업
	@RequestMapping(value = "/searchPopup", method = RequestMethod.GET)
	public void search(HttpServletRequest request, Model model) throws Exception {
		logger.info("User skill search Form.....");

		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");

		model.addAttribute("list", service.selectAllSkills(uVo.getUserNo()));

	}

	// 4. 사용자 :: 보유기술 삭제 ->list 화면에서 아이콘 클릭하여 삭제 GET 방식으로 요청
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String adremove(SkillVO sVo, RedirectAttributes rttr) throws Exception {

		service.deleteSkill(sVo);

		rttr.addFlashAttribute("msg", "삭제되었습니다.");

		return "redirect:/user/skill/list";

	}

}

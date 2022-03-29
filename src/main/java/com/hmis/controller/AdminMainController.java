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

import com.hmis.domain.UserVO;
import com.hmis.service.StatisticsService;
import com.hmis.service.UserService;

@Controller
@RequestMapping("/admin/*")
public class AdminMainController {

	@Inject
	private UserService service;
	
	@Inject StatisticsService sService;
	
	private static Logger logger = LoggerFactory.getLogger(AdminApplyController.class);
	
	
	// 1. 관리자 메인보드
	@RequestMapping("/main")
	public void main(Model model) throws Exception {
		logger.info("Admin Main.......");
		model.addAttribute("applyCount", service.applyCount());
		model.addAttribute("graduateCount", service.graduateCount());
		model.addAttribute("graduateToBeCount", service.graduateToBeCount());
		
		model.addAttribute("misList", service.misInfo());
		
		model.addAttribute("certList", sService.mainList());
		
		
	}
	
	   // 2. 내정보확인 페이지
	   @RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	   public void myInfoGET(HttpServletRequest request, Model model) throws Exception {

	     // logger.info("user myPageGET..............");

	      HttpSession session = request.getSession();

	      UserVO uVo = (UserVO) session.getAttribute("login");

	      int userNo = uVo.getUserNo();
	     

	      model.addAttribute(service.myInfo(userNo));

	   }

	   // 3. 내정보 수정폼으로 이동
	   @RequestMapping(value = "/myInfoUpdate", method = RequestMethod.GET)
	   public void myInfoUpdateGET(@RequestParam("userNo") int userNo, Model model) throws Exception {


	      model.addAttribute(service.myInfo(userNo));
	   }

	   // 4. 내정보 수정
	   @RequestMapping(value = "/myInfoUpdate", method = RequestMethod.POST)
	   public String myInfoUpdatePOST(UserVO uVo, RedirectAttributes rttr, Model model) throws Exception {


	      service.myInfoModify(uVo);

	      rttr.addFlashAttribute("user", "SUCCESS");

	      return "redirect:/";
	   }

	
}

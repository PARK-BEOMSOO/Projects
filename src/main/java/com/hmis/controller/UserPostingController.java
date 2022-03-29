<<<<<<< HEAD
// 패키지 및 라이브러리 임포트
package com.hmis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.hmis.domain.UserVO;
import com.hmis.dto.RecommandDTO;
import com.hmis.service.PostingService;
import com.hmis.service.UserService;

/**
 * @author beomsoo
 */
// Controller 선언
@Controller
@RequestMapping("/user/posting/*")
public class UserPostingController {

	private static Logger logger = LoggerFactory.getLogger(UserPostingController.class);
	
	@Inject
	private UserService userService;
	
	// 채용공고
	@Inject
	private PostingService postingService;
	
	/**
	* 맵핑 주소 : /read
	* 리턴 타입 : void
	* 메소드명  : readPostingGET
	* 매개 변수 : @RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri
	*/
	// 1) 학생 : 채용공고 상세보기 GET
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readPostingGET(@RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		logger.info("User readPosting GET.........");
		
		// 1-1) read.jsp 로 이동하면서 채용공고 상세 정보를 같이 전달
		model.addAttribute("postingVO", postingService.readPosting(postingId));
		
		// 1-2) 검색한 정보 리스트 화면으로 전달
		model.addAttribute("list", postingService.listSearchCriteria(cri));
		
		// 1-3) model로 페이징 정보를 전달
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

	/**
	* 맵핑 주소 : /list
	* 리턴 타입 : void
	* 메소드명  : postingListGET
	* 매개 변수 : @ModelAttribute("cri") SearchCriteria cri, Model model
	*/
	// 2) 학생 : 채용공고 목록 (검색 + 페이징)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void postingListGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		logger.info("User postingList GET");

		// 2-1) (페이징된) 검색한 정보 리스트 화면으로 전달
		model.addAttribute("list", postingService.listSearchCriteria(cri));
		
		// 2-2) 검색한 정보 담아서 페이징 만들기
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		// 2-3) 검색한 정보의 전체 게시글 수 설정
		pageMaker.setTotalCount(postingService.listCountSearchCriteria(cri));
		
		// 2-4) 페이징 정보를 화면으로 전달
		model.addAttribute("pageMaker", pageMaker);
	}
	
	/**
	* 맵핑 주소 : /recommandlist
	* 리턴 타입 : void
	* 메소드명  : recommandListGET
	* 매개 변수 : @RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri
	*/
	// 3) 학생 : 추전채용공고 상세보기
	@RequestMapping(value = "/recommandlist", method = RequestMethod.GET)
	public void recommandListGET(HttpServletRequest request, RecommandDTO recommandDTO, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		logger.info("User recommandList GET");
		
		// 3-0) 로그인시 session 에 저장되어 있는 userNo를 변수에 저장
		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");
		int userNo = uVo.getUserNo();
		
		// 3-1) recommandlist.jsp 로 이동하면서 학생 상세 정보를 같이 전달
		model.addAttribute("userVO", userService.read(userNo));
		logger.info("학번 : "+userNo);
		
		// 3-2) recommandlist.jsp 로 이동하면서 추천 채용공고  정보를 같이 전달
		model.addAttribute("recommandDTO", postingService.recommandPosting(userNo));
		logger.info("채용공고를 전달하였습니다.");
		
		// 3-3) model로 페이징 정보를 전달
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

	

}
=======
// 패키지 및 라이브러리 임포트
package com.hmis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.hmis.domain.UserVO;
import com.hmis.dto.RecommandDTO;
import com.hmis.service.PostingService;
import com.hmis.service.UserService;

/**
 * @author beomsoo
 */
// Controller 선언
@Controller
@RequestMapping("/user/posting/*")
public class UserPostingController {

	private static Logger logger = LoggerFactory.getLogger(UserPostingController.class);
	
	@Inject
	private UserService userService;
	
	// 채용공고
	@Inject
	private PostingService postingService;
	
	/**
	* 맵핑 주소 : /read
	* 리턴 타입 : void
	* 메소드명  : readPostingGET
	* 매개 변수 : @RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri
	*/
	// 1) 학생 : 채용공고 상세보기 GET
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readPostingGET(@RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		logger.info("User readPosting GET.........");
		
		// 1-1) read.jsp 로 이동하면서 채용공고 상세 정보를 같이 전달
		model.addAttribute("postingVO", postingService.readPosting(postingId));
		
		// 1-2) 검색한 정보 리스트 화면으로 전달
		model.addAttribute("list", postingService.listSearchCriteria(cri));
		
		// 1-3) model로 페이징 정보를 전달
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

	/**
	* 맵핑 주소 : /list
	* 리턴 타입 : void
	* 메소드명  : postingListGET
	* 매개 변수 : @ModelAttribute("cri") SearchCriteria cri, Model model
	*/
	// 2) 학생 : 채용공고 목록 (검색 + 페이징)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void postingListGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		logger.info("User postingList GET");

		// 2-1) (페이징된) 검색한 정보 리스트 화면으로 전달
		model.addAttribute("list", postingService.listSearchCriteria(cri));
		
		// 2-2) 검색한 정보 담아서 페이징 만들기
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		// 2-3) 검색한 정보의 전체 게시글 수 설정
		pageMaker.setTotalCount(postingService.listCountSearchCriteria(cri));
		
		// 2-4) 페이징 정보를 화면으로 전달
		model.addAttribute("pageMaker", pageMaker);
	}
	
	/**
	* 맵핑 주소 : /recommandlist
	* 리턴 타입 : void
	* 메소드명  : recommandListGET
	* 매개 변수 : @RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri
	*/
	// 3) 학생 : 추전채용공고 상세보기
	@RequestMapping(value = "/recommandlist", method = RequestMethod.GET)
	public void recommandListGET(HttpServletRequest request, RecommandDTO recommandDTO, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		logger.info("User recommandList GET");
		
		// 3-0) 로그인시 session 에 저장되어 있는 userNo를 변수에 저장
		HttpSession session = request.getSession();
		UserVO uVo = (UserVO) session.getAttribute("login");
		int userNo = uVo.getUserNo();
		
		// 3-1) recommandlist.jsp 로 이동하면서 학생 상세 정보를 같이 전달
		model.addAttribute("userVO", userService.read(userNo));
		
		// 3-2) recommandlist.jsp 로 이동하면서 추천인재  정보를 같이 전달
		model.addAttribute("recommandDTO", postingService.recommandPosting(recommandDTO));
		
		// 3-3) model로 페이징 정보를 전달
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

	

}
>>>>>>> branch 'master' of https://github.com/Ohsojin/HR_Matching.git

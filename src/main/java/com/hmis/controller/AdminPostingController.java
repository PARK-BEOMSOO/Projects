// 패키지 및 라이브러리 임포트
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hmis.domain.PageMaker;
import com.hmis.domain.PostingVO;
import com.hmis.domain.SearchCriteria;
import com.hmis.dto.RecommandDTO;
import com.hmis.service.PostingService;

/**
 * @author beomsoo
 */
// Controller 선언
@Controller
@RequestMapping("/admin/posting/*")
public class AdminPostingController {

	private static Logger logger = LoggerFactory.getLogger(AdminAnnouncementController.class);
	
	// 채용공고
	@Inject
	private PostingService postingService;

	/**
	* 맵핑 주소 : /register
	* 리턴 타입 : void
	* 메소드명  : registerPostingGET
	* 매개 변수 : -
	*/
	// 1) 관리자 : 채용공고 등록 GET
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerPostingGET() throws Exception {
		
		logger.info("Admin registerPosting GET");

	}

	/**
	* 맵핑 주소 : /register
	* 리턴 타입 : String
	* 메소드명  : registerPostingPOST
	* 매개 변수 : PostingVO postingVO
	*/
	// 1) 관리자 : 채용공고 등록 POST
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPostingPOST(PostingVO postingVO) throws Exception {

		logger.info("Admin registerPosting POST");
		
		// 1-1) 채용공고 DB에 저장
		postingService.registerPosting(postingVO);

		// 1-2) 채용공고 목록 페이지로 강제 이동
		return "redirect:/admin/posting/list";
	}
	
	/**
	* 맵핑 주소 : /read
	* 리턴 타입 : void
	* 메소드명  : readPostingGET
	* 매개 변수 : @RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri
	*/
	// 2) 관리자 : 채용공고 상세보기 GET
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readPostingGET(RecommandDTO recommandDTO, @RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		logger.info("readPosting GET.........");
		
		// 2-1) read.jsp 로 이동하면서 채용공고 상세 정보를 같이 전달
		model.addAttribute("postingVO", postingService.readPosting(postingId));
		
		// 2-2) read.jsp 로 이동하면서 추천인재 상세 정보를 같이 전달
		model.addAttribute("recommandDTO", postingService.recommandStudent(recommandDTO));
	
		// 2-3) read.jsp 로 검색한 정보 리스트 화면으로 전달
		model.addAttribute("list", postingService.listSearchCriteria(cri));
		
		// 2-4) model로 페이징 정보를 전달
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

	
	/**
	* 맵핑 주소 : /modify
	* 리턴 타입 : void
	* 메소드명  : modifyPostingGET
	* 매개 변수 : @RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri
	*/
	// 3) 관리자 : 채용공고 수정 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyPostingGET(@RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		logger.info("Admin modifyPosting GET");
		
		// 3-1) modify.jsp 로 이동하면서 채용공고 상세 정보를 같이 전달
		model.addAttribute("postingVO", postingService.readPosting(postingId));
		
		// 3-2) model로 페이징 정보를 전달
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());
		
	}
	
	/**
	* 맵핑 주소 : /modify
	* 리턴 타입 : String
	* 메소드명  : modifyPostingPOST
	* 매개 변수 : PostingVO postingVO, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr
	*/
	// 3) 관리자 : 채용공고 수정 POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPostingPOST(PostingVO postingVO, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		logger.info("Admin modifyPosting POST");

		// 3-1) 수정된 채용공고를 DB에 저장
		postingService.modifyPosting(postingVO);

		// <<modify.jsp에서 read.jsp로 이동할 때 사용>>
		// 3-2) redirect로 강제 이동할 페이제에 rttr로 채용공고 정보를 전달 
		rttr.addFlashAttribute("postingVO", postingVO);

		// 3-3) redirect로 강제 이동할 페이제에 rttr로 페이징 정보를 전달
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		// 3-4) 채용공고 목록 페이지로 강제 이동
		return "redirect:/admin/posting/list";
	}
	
	/**
	* 맵핑 주소 : /remove
	* 리턴 타입 : String
	* 메소드명  : removePostingPOST
	* 매개 변수 : @RequestParam("postingId") int postingId, SearchCriteria cri, RedirectAttributes rttr
	*/
	// 4) 관리자 : 채용공고 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePostingPOST(@RequestParam("postingId") int postingId, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		logger.info("Admin removePosting POST");
		
		// 4-1) 채용공고를 DB에서 삭제
		postingService.removePosting(postingId);

		// 4-2) redirect로 강제 이동할 페이제에 rttr로 페이징 정보를 전달
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		// 4-3) 채용공고 목록 페이지로 강제 이동
		return "redirect:/admin/posting/list";

	}
	
	/**
	* 맵핑 주소 : /list
	* 리턴 타입 : void
	* 메소드명  : postingListGET
	* 매개 변수 : @ModelAttribute("cri") SearchCriteria cri, Model model
	*/
	// 5) 관리자 : 채용공고 목록 (검색 + 페이징)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void postingListGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		logger.info("Admin postingList GET");

		// 5-1) (페이징된) 검색한 정보 리스트 화면으로 전달
		model.addAttribute("list", postingService.listSearchCriteria(cri));
		
		// 5-2) 검색한 정보 담아서 페이징 만들기
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		// 5-3) 검색한 정보의 전체 게시글 수 설정
		pageMaker.setTotalCount(postingService.listCountSearchCriteria(cri));
		
		// 5-4) 페이징 정보를 화면으로 전달
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	/**
	* 맵핑 주소 : /recommandlist
	* 리턴 타입 : void
	* 메소드명  : recommandListGET
	* 매개 변수 : @RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri
	*/
	// 6) 관리자 : 추전인재 상세보기
	@RequestMapping(value = "/recommandlist", method = RequestMethod.GET)
	public void recommandListGET(RecommandDTO recommandDTO, @RequestParam("postingId") int postingId, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		logger.info("Admin recommandList GET");

		// 6-1) recommandlist.jsp 로 이동하면서 채용공고 상세 정보를 같이 전달
		model.addAttribute("postingVO", postingService.readPosting(postingId));
		
		// 6-2) recommandlist.jsp 로 이동하면서 추천인재 상세 정보를 같이 전달
		model.addAttribute("recommandDTO", postingService.recommandStudent(recommandDTO));
		
		// 6-3) model로 페이징 정보를 전달
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

}

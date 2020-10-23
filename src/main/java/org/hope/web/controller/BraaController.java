package org.hope.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hope.web.domain.BraaVO;
import org.hope.web.service.BraaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/braa")
public class BraaController {

	@Autowired
	BraaService braaService;

	private static final Logger logger = LoggerFactory.getLogger(BraaController.class);

	
		////////////////////////////////////////////////////////
		////              BraaList 문의 게시판 메인화면                          ////
		////////////////////////////////////////////////////////
		//문의 게시판 목록 이동 
		@RequestMapping(value = "/braa.do", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
			return "BraaList";
		} 
		//온라인 문의글 목록 조회
		@RequestMapping("/Braa1000_select.do")
		@ResponseBody 
		public Map<String, Object> braaSelect(@RequestParam HashMap<String, Object> paramMap) {	
			Map<String, Object> map = braaService.selectBraa(paramMap);
			return map;
		}
		
		//온라인 문의글 관리자 페이지 호출
		@RequestMapping(value = "Braa1000_adminPageCall.do", method = RequestMethod.GET)
		public String braaAdminPageCall(@RequestParam String bordNum, Model model) {
			return "redirect:/admin/adminBraaPage.do?bordNum="+bordNum;
		}
		
		
		////////////////////////////////////////////////////////
		////    BraaPage 문의 게시판 상세화면(조회, 작성, 수정, 삭제)   ////
		////////////////////////////////////////////////////////
		//문의 게시판 상세화면 (작성 모드)
		@RequestMapping(value = "/Braa1000_write.do", method = RequestMethod.GET)
		public String braaWrite() {
			return "BraaPage";
		} 
		//온라인 문의글 작성
		@RequestMapping("/Braa1000_insert.do")
		public String braaInsert(@ModelAttribute BraaVO braaVO, Model model) throws Exception {
			braaService.insertBraa(braaVO);
			return "redirect:/braa/braa.do";
		}
				
		//문의 게시판 상세화면 (조회 모드)
		@RequestMapping("/Braa1000_detailSelect.do")
		public String braaDetailSelect(@RequestParam HashMap<String, String> paramMap, HttpSession session, Model model) {
			String updMode = paramMap.get("updMode");
			BraaVO braa = braaService.selectDetailBraa(paramMap.get("bordNum"));
			braa = braaService.encrypBraa(braa, updMode, session);
			model.addAttribute("braa", braa);
			return "BraaPage";
		}
		//온라인 문의글 상세 조회 (이메일, 연락처)
		@RequestMapping("/Braa1000_detailSelectUpd.do")
		@ResponseBody
		public BraaVO braaDetailSelectUpd(@RequestParam String bordNum, Model model) {
			BraaVO braa = braaService.selectDetailBraa(bordNum);
			model.addAttribute("braa", braa);
			return braa;
		}
		
		//온라인 문의글 수정
		@RequestMapping("/Braa1000_update.do")
		public String braaUpdate(@ModelAttribute BraaVO braaVO, Model model) {
			braaService.updateBraa(braaVO);
			return "redirect:/braa/braa.do";
		}
		
		//온라인 문의글 삭제
		@RequestMapping("/Braa1000_delete.do")
		public String braaDelete(@ModelAttribute BraaVO braaVO) {
			braaService.deleteBraa(braaVO);
			return "redirect:/braa/braa.do";
		}
		
		
		////////////////////////////////////////////////////////
		////       BraaConfirmPassWd 문의글 조회 비밀번호 팝업                 /// 
		////////////////////////////////////////////////////////
		//온라인 문의글 비밀번호 입력 팝업
		@RequestMapping(value = "Braa1000_confirmPasswdWindow.do", method = RequestMethod.GET)
		public String braaConfirmPasswdWindow(@RequestParam String bordNum, Model model) {
			model.addAttribute("bordNum", bordNum);
			return "BraaConfirmPassWd";
		}
		//온라인 문의글 비밀번호 체크
		@RequestMapping("Braa1000_confirmPasswd.do")
		@ResponseBody
		public Boolean braaConfirmPasswd(@RequestBody HashMap<String, String> data) throws Exception {
			return braaService.confirmPasswd(data);
		}
		
		
		
		
		

}

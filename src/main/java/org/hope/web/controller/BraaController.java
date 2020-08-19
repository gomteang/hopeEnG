package org.hope.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hope.web.domain.BraaVO;
import org.hope.web.service.BraaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
		//문의 게시판 목록 이동 
		@RequestMapping(value = "/braa.do", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {

			return "BraaList";
		} 
		
		//문의 게시판 작성하기
		@RequestMapping(value = "/Braa1000_write.do", method = RequestMethod.GET)
		public String braaWrite() {
			logger.info("들어옴");
			return "BraaPage";
		} 

		//온라인 문의글 목록 조회
		@RequestMapping("/Braa1000_select.do")
		@ResponseBody 
		public Map<String, List<BraaVO>> braaSelect(@RequestParam HashMap<String, String> paramMap) {
			paramMap.forEach((key,value) -> logger.info(key+":"+value));
			
			Map<String, List<BraaVO>> map = new HashMap<String, List<BraaVO>>();
			List<BraaVO> braaList = braaService.selectBraa(paramMap);
			map.put("braaList", braaList);
			
			return map;
		}
		
		//온라인 문의글 상세 조회 
		@RequestMapping("/Braa1000_detailSelect.do")
	//	@ResponseBody 
		public String braaDetailSelect(@RequestParam String bordNum, Model model) {
			BraaVO braa = braaService.selectDetailBraa(bordNum);
			model.addAttribute("braa", braa);
			return "BraaPage";
		}
		
		//온라인 문의글 작성
		@RequestMapping("/Braa1000_insert.do")
//		@ResponseBody
		public String braaInsert(@ModelAttribute BraaVO braaVO, Model model) {
			braaService.insertBraa(braaVO);
			return "redirect:/braa/braa.do";
		}
		
		//온라인 문의글 작성
		@RequestMapping("/Braa1000_update.do")
		public String braaUpdate(@ModelAttribute BraaVO braaVO, Model model) {
			braaService.updateBraa(braaVO);
			return "redirect:/braa/braa.do";
		}

}

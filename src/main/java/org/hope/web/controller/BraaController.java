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
	
		//메인에서 들어오는 화면 
		@RequestMapping(value = "/braa.do", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {

//			model.addAttribute("pageName", "BraaPage");	  
//			return "home";
//			return "BraaPage"; 
//			return "redirect:/braa/Braa1000_select.do";
			return "BraaList";
		} 

		//온라인 문의글 목록 조회
		@RequestMapping("/Braa1000_select.do")
		@ResponseBody 
		public Map<String, List<BraaVO>> BraaSelect(@RequestParam HashMap<String, String> paramMap) {
			//paramMap.forEach((key,value) -> logger.info(key+":"+value));
			Map<String, List<BraaVO>> map = new HashMap<String, List<BraaVO>>();
			List<BraaVO> braaList = braaService.selectBraa(paramMap);
			map.put("braaList", braaList);

			return map;
		}
		
		//온라인 문의글 작성
		@RequestMapping("/Braa1000_insert.do")
		@ResponseBody
		public String BraaInsert(@ModelAttribute BraaVO braaVO, Model model) {
			braaService.insertBraa(braaVO);
			//List<BraaVO> braaList = braaService.selectBraa(braaVO);
			//model.addAttribute("BraaList", braaList);
			return "BraaList";
		}

}

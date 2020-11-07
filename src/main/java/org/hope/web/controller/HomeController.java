package org.hope.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hope.web.domain.GlaaVO;
import org.hope.web.domain.HomeVO;
import org.hope.web.service.GlaaService;
import org.hope.web.service.HomeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	HomeService homeService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	  @RequestMapping(value = "/", method = RequestMethod.GET) 
	  public String home(Locale locale, Model model) {
		  logger.info("Welcome home! The client locale is {}.", locale);
		  
		  Date date = new Date(); DateFormat dateFormat =
		  DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		  
		  String formattedDate = dateFormat.format(date);
		  
		  model.addAttribute("serverTime", formattedDate );
		  
		  return "home";
	  }
	  
	  @RequestMapping("/Home1000_select.do")
	  @ResponseBody 
	  public Map<String, List<HomeVO>> HomeSelectFile(@RequestParam HashMap<String, String> paramMap) throws Exception {
		  Map<String, List<HomeVO>> map = new HashMap<String, List<HomeVO>>();
		  List<HomeVO> HomeTopList = homeService.selectHomeTop(paramMap);
		  List<HomeVO> HomeBottmList = homeService.selectHomeBottm(paramMap);
		
		  map.put("HomeTopList",HomeTopList); 
		  map.put("HomeBottmList",HomeBottmList);
		  
		  return map; 
	  }
	  
	  @RequestMapping("/test.do")
	  public String test(Locale locale, Model model) {
		  logger.info("Welcome home! The client locale is {}.", locale);
		  
		  Date date = new Date(); DateFormat dateFormat =
		  DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		  
		  String formattedDate = dateFormat.format(date);
		  
		  model.addAttribute("serverTime", formattedDate );
		  
		  return "test";
	  }
	  
}

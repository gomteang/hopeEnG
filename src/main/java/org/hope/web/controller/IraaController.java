package org.hope.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
@RequestMapping("/Iraa")
public class IraaController {


	private static final Logger logger = LoggerFactory.getLogger(IraaController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
		//문의 게시판 목록 이동 
		@RequestMapping(value = "/Iraa.do", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {

			return "IraaList";
		} 
		

}

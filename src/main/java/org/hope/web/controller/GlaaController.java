package org.hope.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import org.hope.web.domain.BraaVO;
import org.hope.web.domain.GlaaVO;
import org.hope.web.service.GlaaService;
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
import org.springframework.web.multipart.MultipartFile;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/glaa")
public class GlaaController {
	
	  @Autowired GlaaService glaaService;
	  
	  private static final Logger logger = LoggerFactory.getLogger(GlaaController.class);
	  
	  
		@RequestMapping(value = "/glaa.do", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {


			return "GlaaList";
		} 
	  
		//갤러리 글 목록 조회
		@RequestMapping("/Glaa1000_select.do")
		@ResponseBody 
		public Map<String, List<GlaaVO>> GlaaSelect(@RequestParam HashMap<String, String> paramMap) {
			//paramMap.forEach((key,value) -> logger.info(key+":"+value));
			Map<String, List<GlaaVO>> map = new HashMap<String, List<GlaaVO>>();
			List<GlaaVO> glaaList = glaaService.selectGlaa(paramMap);
			map.put("glaaList", glaaList);

			return map;
		}
		
		
	  //갤러리 글 작성
	  @RequestMapping("/Glaa1000_insert.do")
	  @ResponseBody public String GlaaInsert(@ModelAttribute GlaaVO glaaVO, Model model) {
		  glaaService.insertGlaa(glaaVO); //List<BraaVO> braaList =
		  //glaaService.selectGlaa(glaaVO); //model.addAttribute("BraaList", braaList);
	  return "GlaaList"; }
	 
	  
	  @RequestMapping(value = "/fileupload",method = RequestMethod.POST)
	  public void upload(MultipartFile uploadfile){
	      logger.info("upload() POST 호출");
	      logger.info("파일 이름: {}", uploadfile.getOriginalFilename());
	      logger.info("파일 크기: {}", uploadfile.getSize());

	      saveFile(uploadfile);

	  }
	  private static final String UPLOAD_PATH = "/home/meta/imgArea";
	  private String saveFile(MultipartFile file){
		    // 파일 이름 변경
		    UUID uuid = UUID.randomUUID();
		    String saveName = uuid + "_" + file.getOriginalFilename();
		   
		    logger.info("saveName: {}",saveName);

		    // 저장할 File 객체를 생성(껍데기 파일)ㄴ
		    File saveFile = new File(UPLOAD_PATH,saveName); // 저장할 폴더 이름, 저장할 파일 이름
		    
		    try {
		        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		    } catch (IOException e) {
		        e.printStackTrace();
		        return null;
		    }

		    return saveName;
		}
	  
}

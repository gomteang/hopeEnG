
package org.hope.web.controller;

import java.io.File;
import java.io.IOException;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hope.web.domain.GlaaVO;
import org.hope.web.service.GlaaService;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/glaa")
public class GlaaController {

	@Autowired
	GlaaService glaaService;
	
	
	
	////////////////////////////////////////////////////////
	////                GlaaList 갤러리 메인화면                             ////
	////////////////////////////////////////////////////////
	//갤러리 리스트 페이지 이동
	@RequestMapping(value = "/glaa.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "GlaaList";
	} 
	// 갤러리 목록 조회
	@RequestMapping("/Glaa1000_select.do")
	@ResponseBody 
	public Map<String, Object> glaaSelect(@RequestParam HashMap<String, Object> paramMap) {
		Map<String, Object> map = glaaService.selectGlaa(paramMap);
		return map; 

	}

	
	////////////////////////////////////////////////////////  
	////             GlaaUploadForm 갤러리 등록                            ////
	////////////////////////////////////////////////////////
	//갤러리 작성 페이지 이동
	@RequestMapping(value="/uploadForm.do", method=RequestMethod.GET) 
	public String showUploadForm() { 
		return "GlaaUploadForm"; 
	}
	//갤러리 등록
	@RequestMapping(value = "/Glaa1000_insert.do", method = RequestMethod.POST)
	@ResponseBody 
	public String glaaInsert(@ModelAttribute GlaaVO glaaVO, Model model, MultipartHttpServletRequest multi, HttpServletRequest request) throws Exception{
		
		try {
			String root = request.getSession().getServletContext().getRealPath("/");
			glaaVO.setFilePath(root);
			glaaVO.setFiles(multi.getFiles("files[0]"));
			glaaService.insertGlaa(glaaVO);
			return "SUCCESS";
		} catch (Exception e) {
			e.printStackTrace();
			return "FALSE";
		}
		
	}
	
	
	
	////////////////////////////////////////////////////////
	////              GlaaPage 갤러리 상세 회면                               ////
	////////////////////////////////////////////////////////
	//갤러리 상세 페이지 이동
	@RequestMapping("/Glaa1000_moveDetailPage.do")
	public String glaaMoveDetailpage(@RequestParam String gllyNo, Model model) throws Exception{
		return "GlaaPage";
	}
	// 갤러리 첨부파일  조회
    @RequestMapping(value = "/Glaa1000_getGlaaDetail")
    @ResponseBody
    public GlaaVO getGllyDetail(HttpServletRequest request, HttpServletResponse response, String gllyNo) throws Exception {
    	MDC.put("TRANSACTION_ID", gllyNo);
        GlaaVO glaa = glaaService.selectDetailGlaa(gllyNo);    
        MDC.remove("TRANSACTION_ID");
        return glaa;
    }
    
    
	////////////////////////////////////////////////////////
	////            GlaaUpdatePage 갤러리 수정 화면                       ////
	////////////////////////////////////////////////////////
	// 갤러리 수정화면 이동
	@RequestMapping(value = "/Glaa1000_moveUpdateGlaaPage")
	public String glaaUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "GlaaUpdatePage";
	}

	// 갤러리 수정
	@RequestMapping(value="/Glaa1000_updateGlaa", method = RequestMethod.POST)
	@ResponseBody
	public String updateGlaa(HttpServletRequest request, HttpServletResponse response, GlaaVO glaa) throws Exception{
		try {
			glaaService.updateGlaa(glaa);
			return "SUCCESS";
		} catch (Exception e) {
			return "FALSE";
		}
	}
	
	// 갤러리 삭제
	@RequestMapping("/Glaa1000_delete.do")
	@ResponseBody
	public String glaaDelete(String gllyNo) throws Exception  {
		try {
			glaaService.deleteGlaa(gllyNo);
			return "SUCCESS";
		} catch (Exception e) {
			return "FALSE";
		}
	}
	
	// 프로젝트 루트 찾기
	@RequestMapping(value="/Glaa1000_getRootPath")
	public String getRootPath(HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("/");
		return root;
	}
}


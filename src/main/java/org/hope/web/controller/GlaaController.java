package org.hope.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.UUID;

import org.hope.web.domain.GlaaVO;
import org.hope.web.service.GlaaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/glaa")
public class GlaaController {

	@Autowired
	GlaaService glaaService;

	//문의 게시판 목록 이동 
			@RequestMapping(value = "/glaa.do", method = RequestMethod.GET)
			public String home(Locale locale, Model model) {

				return "GlaaList";
			} 
			
	  @RequestMapping(value="/uploadForm", method=RequestMethod.GET) public String
	  showUploadForm() { return "uploadForm"; }
	 

	// 갤러리 게시물 작성
	@RequestMapping("/Glaa1000_insert.do")
	public String glaaInsert(@ModelAttribute GlaaVO glaaVO, Model model) throws Exception{
		
		
		System.out.println(model.toString());
		System.out.println("Here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(glaaVO.toString());
		
		/*
		 * System.out.println(glaaVO.toString()); glaaService.insertGlaa(glaaVO);
		 * System.out.println("HEllo insert function");
		 */
		glaaService.insertGlaa(glaaVO);
		return "GlaaList";
	}

	@RequestMapping(path = "/uploadFile", method = RequestMethod.POST)
	public ModelAndView handleFileUpload(@RequestParam("myFileField") MultipartFile file) throws IOException {
		// 업로드된 파일을 식별할 수 있는 MultipartFile 타입 인수를 받음

		// 파일명
		String originalFile = file.getOriginalFilename();

		// 파일명 중 확장자만 추출
		String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));

		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		System.out.println(storedFileName);
		System.out.println(originalFile + "은 업로드한 파일이다.");
		System.out.println(storedFileName + "라는 이름으로 업로드 됐다.");
		System.out.println("파일사이즈는 " + file.getSize());
		// 파일을 저장하기 위한 파일 객체 생성
		// File stFile = new File("C:\\".concat(storedFileName));

		// 파일 저장
		file.transferTo(new File("C:\\Users\\HAHA\\Documents\\" + storedFileName));
		// file.transferTo(new File("C:\\"));

		ModelMap modelData = new ModelMap();

		if (!file.isEmpty()) {
			// -- 업로드한 파일을 파일시스템에 저장
			String successMessage = "File successfully uploaded";
			System.out.println("here");
			modelData.put("uploadMessage", successMessage);
			return new ModelAndView("uploadForm", modelData);
		}
		String failureMessage = "File couldn't be uploaded.";
		modelData.put("uploadMessage", failureMessage);
		return new ModelAndView("uploadForm", modelData);

	}

	// 파일 업로드 중 예외발생하면 @ExceptionHandler 메서드가 오류 메시지 보여줌
	@ExceptionHandler(value = Exception.class)
	public ModelAndView handleException(Exception e) {
		e.printStackTrace();
		ModelMap modelData = new ModelMap();
		String failureMessage = "Exception occurred during upload.";
		modelData.put("uploadMessage", failureMessage);
		return new ModelAndView("uploadForm", modelData);
	}

}

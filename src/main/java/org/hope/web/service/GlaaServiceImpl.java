package org.hope.web.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.hope.web.controller.GlaaController;
import org.hope.web.dao.GlaaDAO;
import org.hope.web.domain.GlaaFileVO;
import org.hope.web.domain.GlaaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class GlaaServiceImpl implements GlaaService{

	@Autowired
	GlaaDAO glaaDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(GlaaController.class);
	
	@Override
	public void insertGlaa(GlaaVO glaaVO) throws Exception {
		// TODO Auto-generated method stub
		
		List<GlaaFileVO> glaaFileList = getGlaaFileInfo(glaaVO);
		
		glaaDAO.insert(glaaVO);
		
		for(GlaaFileVO glaaFileVO : glaaFileList) {
			glaaDAO.insertGlaaFile(glaaFileVO);
		}
		
	}

	@Override
	public List<GlaaVO> selectGlaa(Map<String, String> map) {
		// TODO Auto-generated method stub
		return glaaDAO.select(map);
	}

	@Override
	public GlaaVO selectDetailGlaa(String bordNum) {
		// TODO Auto-generated method stub
		return glaaDAO.selectDetail(bordNum);
	}

	@Override
	public void updateGlaa(GlaaVO glaaVO) {
		// TODO Auto-generated method stub
		int num = glaaDAO.update(glaaVO);
		logger.debug("num:"+num);
	}
	
	public List<GlaaFileVO> getGlaaFileInfo(GlaaVO glaaVO) throws Exception{
		List<MultipartFile> files = glaaVO.getFiles();
		List<GlaaFileVO> glaaFileList = new ArrayList<GlaaFileVO>();
		GlaaFileVO glaaFileVO = new GlaaFileVO();
		System.out.println("This is getGlaaFileInfo");
		int gllyNo = glaaVO.getgllyNo();
		String fileName = null;
		String fileNameKey = null;
		String filePath = "C:\\board\\file";
		String fileSize = null;
		String fileExt = null;
		if(files == null ) {
			System.out.println("file is empty");
		}
		if(files != null && files.size() > 0) {
			File file = new File(filePath);
			
			// Create Directory
			if(file.exists() == false) {
				file.mkdirs();
			}
			
			for(MultipartFile multipartFile : files) {
				
				fileName = multipartFile.getOriginalFilename();
				fileExt = fileName.substring(fileName.lastIndexOf("."));
				fileNameKey = getRandomString() + fileExt;
				fileSize = String.valueOf(multipartFile.getSize());
				
				System.out.println(fileName);
				System.out.println(fileExt);
				System.out.println(fileNameKey);
				System.out.println(fileSize);
				// Save File
				file = new File(filePath + "/" + fileNameKey);
				multipartFile.transferTo(file);
				
				glaaFileVO = new GlaaFileVO();
				glaaFileVO.setGllyNo(gllyNo);
				glaaFileVO.setFileNameKey(fileNameKey);
				glaaFileVO.setFilePath(filePath);
				glaaFileVO.setFileSize(fileSize);
				glaaFileList.add(glaaFileVO);

			}
		}
		return glaaFileList;
	}
		
    /** 32글자의 랜덤한 문자열(숫자포함) 생성 */
    public static String getRandomString() {
 
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

	/*
	 * @Override public void insertBoardFile(GlaaFileVO glaaFileVO) {
	 * glaaDAO.insertGlaaFile(glaaFileVO); }
	 */

}

package org.hope.web.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.hope.web.controller.GlaaController;
import org.hope.web.dao.GlaaDAO;
import org.hope.web.domain.GlaaFileVO;
import org.hope.web.domain.GlaaVO;
import org.hope.web.domain.PagingVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

@Service
public class GlaaServiceImpl implements GlaaService{

	@Autowired
	GlaaDAO glaaDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(GlaaController.class);
	

	////////////////////////////////////////////////////////
	////               GlaaList 갤러리 메인 조회                              ////
	////////////////////////////////////////////////////////
	//갤러리 메인 글 조회
	@Override
	public Map<String, Object> selectGlaa(Map<String, Object> map) {
		int cnt = glaaDAO.selectTotalCnt(map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//페이징 처리
		PagingVO paging = new PagingVO(cnt, Integer.parseInt((String)map.get("pageNum")), Integer.parseInt((String)map.get("cntPerPage")));
		map.put("start", paging.getStart()-1);
		//페이징 정보도 함께 전달
		resultMap.put("paging", paging);
		resultMap.put("glaaList", glaaDAO.select(map));
		return resultMap;
	}

	//갤러리 메인 첨부 파일 조회
	@Override
	public GlaaVO selectDetailGlaa(String gllyNo) {
		GlaaVO detailData = glaaDAO.selectDetail(gllyNo);
		List<GlaaFileVO> fileData = glaaDAO.selectImagePath(gllyNo);
		detailData.setGlaaFileVO(fileData);
		return detailData;
	}
	
	
	////////////////////////////////////////////////////////  
	////             GlaaUploadForm 갤러리 등록                            ////
	////////////////////////////////////////////////////////
	//갤러리 등록
	@Override
	public void insertGlaa(GlaaVO glaaVO) throws Exception {

		List<GlaaFileVO> glaaFileList = getGlaaFileInfo(glaaVO);
		glaaVO.setFilePath(glaaFileList.get(0).getFileNameKey());
		
		int gllyNo = glaaDAO.selectGllyNo(glaaVO);
		glaaVO.setgllyNo(gllyNo);
		glaaDAO.insert(glaaVO);
		
		int i = 1;
		for(GlaaFileVO glaaFileVO : glaaFileList) {
			glaaFileVO.setGllyNo(gllyNo);
			glaaFileVO.setFileSeq(i++);
			System.out.println(glaaFileVO);
			glaaDAO.insertGlaaFile(glaaFileVO);
		}
		
	}

	// 첨부 파일 정보 설정
	@Override
	public List<GlaaFileVO> getGlaaFileInfo(GlaaVO glaaVO) throws Exception{
		List<MultipartFile> files = glaaVO.getFiles();
		List<GlaaFileVO> glaaFileList = new ArrayList<GlaaFileVO>();
		GlaaFileVO glaaFileVO = new GlaaFileVO();
		System.out.println("This is getGlaaFileInfo");
		int gllyNo = glaaVO.getgllyNo();
		String fileName = null;
		String fileNameKey = null;
		String rootPath = glaaVO.getFilePath();
		String filePath = rootPath+"resources/image/gallery";
		
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
			int i=1;
			
			for(MultipartFile multipartFile : files) {
				
				fileName = multipartFile.getOriginalFilename();
				fileExt = fileName.substring(fileName.lastIndexOf("."));
				fileNameKey = getRandomString() + fileExt;
				fileSize = String.valueOf(multipartFile.getSize());
				
				
				// Save File
				file = new File(filePath + "/" + fileNameKey);
				multipartFile.transferTo(file);
				
				glaaFileVO = new GlaaFileVO();
				glaaFileVO.setGllyNo(gllyNo);
				glaaFileVO.setFileNameKey(fileNameKey);
				glaaFileVO.setFilePath(filePath + "/" + fileNameKey);
				glaaFileVO.setFileSize(fileSize);
				glaaFileList.add(glaaFileVO);
			}
		}
		return glaaFileList;
	}
	

	////////////////////////////////////////////////////////
	////            GlaaUpdatePage 갤러리 수정 화면                       ////
	////////////////////////////////////////////////////////
	@Override
	public void updateGlaa(GlaaVO glaa) {
		glaaDAO.updateGlaa(glaa);
	}
	
	
    /** 32글자의 랜덤한 문자열(숫자포함) 생성 */
    public static String getRandomString() {
 
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
    // 삭제
    @Override
    public void deleteGlaa(String gllyNo) {
    	glaaDAO.deleteGlaa(gllyNo);
    }

}

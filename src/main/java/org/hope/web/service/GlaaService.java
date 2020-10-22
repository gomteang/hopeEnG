package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.GlaaFileVO;
import org.hope.web.domain.GlaaVO;
import org.springframework.ui.Model;

public interface GlaaService {
	
	//갤러리 등록
	public void insertGlaa(GlaaVO glaaVO) throws Exception;
	public List<GlaaFileVO> getGlaaFileInfo(GlaaVO glaaVO) throws Exception;
	
	//갤러리 조회
	public Map<String, Object> selectGlaa(Map<String, Object> map);
	public GlaaVO selectDetailGlaa(String bordNum);
	
	//갤러리 수정
	public void updateGlaa(GlaaVO glaa);
	public void deleteGlaa(String gllyNo);
}

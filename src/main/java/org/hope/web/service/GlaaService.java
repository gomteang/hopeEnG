package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.GlaaFileVO;
import org.hope.web.domain.GlaaVO;

public interface GlaaService {
	public void insertGlaa(GlaaVO glaaVO) throws Exception;


	public List<GlaaFileVO> getGlaaFileInfo(GlaaVO glaaVO) throws Exception;
	public List<GlaaVO> selectGlaa(Map<String, String> map);
	
	public GlaaVO selectDetailGlaa(String bordNum);
	
	public void updateGlaa(GlaaVO glaaVO);

	
}

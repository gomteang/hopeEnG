package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.GlaaVO;


public interface GlaaService {
	// 갤러리 글 작성
	public void insertGlaa(GlaaVO glaaVO);
	// 갤러리 목록 출력
	public List<GlaaVO> selectGlaa(Map<String, String> map);

}

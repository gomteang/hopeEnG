package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.HomeVO;

public interface HomeService {
	
	//메인화면 상단 이미지 조회
	public List<HomeVO> selectHomeTop(Map<String, String> map)throws Exception;
	//메인화면 하단 이미지 조회
	public List<HomeVO> selectHomeBottm(Map<String, String> map)throws Exception;
}

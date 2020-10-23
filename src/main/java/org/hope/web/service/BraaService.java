package org.hope.web.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hope.web.domain.BraaVO;

public interface BraaService {
	
	//온라인 문의글 메인 화면
	public Map<String, Object> selectBraa(Map<String, Object> map);
	
	
	//온라인 문의글 상세 화면
	public void insertBraa(BraaVO braaVO) throws Exception;
	public BraaVO selectDetailBraa(String bordNum);
	public int increViewsBraa(String bordNum);
	public void updateBraa(BraaVO braaVO);
	public int deleteBraa(BraaVO braaVO);
	
	
	//온라인 문의글 비밀번호 체크
	public Boolean confirmPasswd(Map<String, String> map) throws Exception;
	
	public BraaVO encrypBraa(BraaVO braaVO, String updMode, HttpSession session);
	
}

package org.hope.web.service;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hope.web.controller.BraaController;
import org.hope.web.dao.BraaDAO;
import org.hope.web.domain.BraaVO;
import org.hope.web.domain.PagingVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BraaServiceImpl implements BraaService{
	@Autowired
	BraaDAO braaDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(BraaController.class);
	
	////////////////////////////////////////////////////////
	////             BraaList 문의 게시판 메인화면                            ////
	////////////////////////////////////////////////////////
	//온라인 문의글 목록 조회 및 총 게시글 조회
	@Override
	public Map<String, Object> selectBraa(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = braaDAO.selectTotalCnt(map);
		//페이징 처리
		PagingVO paging = new PagingVO(cnt, Integer.parseInt((String)map.get("pageNum")), Integer.parseInt((String)map.get("cntPerPage")));
		map.put("start", paging.getStart()-1);
		// 페이징 정보도 함께 넘겨줘야함 ! 화면단에 
		resultMap.put("paging", paging);
		resultMap.put("braaList", braaDAO.select(map));
		return resultMap;
	}

	
	////////////////////////////////////////////////////////
	////    BraaPage 문의 게시판 상세화면(조회, 작성, 수정, 삭제)   ////
	////////////////////////////////////////////////////////
	//온라인 문의글 상세 조회 
	@Override
	public BraaVO selectDetailBraa(String bordNum) {
		int num = increViewsBraa(bordNum);
		return braaDAO.selectDetail(bordNum);
	}
	//온라인 문의글 조횟수 증가  ??????????????????왜 굳이 분리
	@Override
	public int increViewsBraa(String bordNum) {
		return braaDAO.updateIncreViewsBraa(bordNum);
	}
	
	//온라인 문의글 작성
	@Override
	public void insertBraa(BraaVO braaVO) throws Exception {
		braaVO.setUserPw(sha256(braaVO.getUserPw())); //sha256 공통으로 빼면 애 controller로 빼기
		braaDAO.insert(braaVO);
	}
	
	//온라인 문의글 수정
	@Override
	public void updateBraa(BraaVO braaVO) {
		int num = braaDAO.update(braaVO);
		logger.debug("num:"+num);
		
	}
	
	//온라인 문의글 삭제
	@Override
	public int deleteBraa(BraaVO braaVO) {
		return braaDAO.delete(braaVO);
	}
	
	////////////////////////////////////////////////////////
	////     BraaConfirmPassWd 문의 게시판 조회 비밀번호 팝업              /// 
	////////////////////////////////////////////////////////
	//온라인 문의글 조회 체크 팝업
	@Override
	public Boolean confirmPasswd(Map<String, String> map) throws Exception {
		String newPw = map.get("pw");
		String savPw = braaDAO.selectPassWd(map.get("bordNum"));
		return comparePw(sha256(newPw), savPw);
	}
	
	public String sha256(String value) throws Exception{
		//SHA 해싱
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(value.getBytes("utf-8"));
		byte[] bytes = md.digest();
		
		//byte를 Hex 값으로변환
		StringBuilder builder = new StringBuilder();
		for(byte b : bytes){
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}
	
	public Boolean comparePw(String newPw, String orinPw){
		if(newPw.equals(orinPw)){
			return true;
		}
		return false;
	}

	//지울예정
	public void temp() throws Exception{
		List<BraaVO> list = braaDAO.hexTemp();
		String str = "";
		for(BraaVO val : list){
			str = sha256(val.getUserPw());
		}
	}

	@Override
	public BraaVO encrypBraa(BraaVO braaVO, String updMode, HttpSession session) {
		String sessionChk = (String) session.getAttribute("name");
		String email = "";
		String tel = "";
		//세션이 없고 공개글일 때 이메일/연락처 보여주면 안됨
		if(sessionChk == null || sessionChk.equals("")){
			if(updMode == null || "".equals(updMode)){
				if(braaVO.getBordRelease().equals("Y")){ //공개글 일 때
					email = braaVO.getUserEmail();
					tel = braaVO.getUserPhone();
	
					braaVO.setUserEmail(email.replaceAll(email, "******"));
					braaVO.setUserPhone(tel.replaceAll(tel, "******"));
				}
			}
		}
		return braaVO;
	}

}

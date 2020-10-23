package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.controller.HomeController;
import org.hope.web.dao.HomeDAO;
import org.hope.web.domain.HomeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	HomeDAO HomeDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	//메인화면 상단 이미지 조회
	@Override
	public List<HomeVO> selectHomeTop(Map<String, String> map) {
		return HomeDAO.selectTop(map);
	}
	
	//메인화면 하단 이미지 조회
	@Override
	public List<HomeVO> selectHomeBottm(Map<String, String> map) {
		return HomeDAO.selectBottm(map);
	}


}

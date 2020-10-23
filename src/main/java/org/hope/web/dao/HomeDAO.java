package org.hope.web.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.hope.web.controller.HomeController;
import org.hope.web.domain.HomeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class HomeDAO {
	
	@Autowired
	private SqlSession sqlSession; //상위클래스로 빼기 -> 상위클래스에서 필요한 부분 오버라이드 해서 자식클래스는 불러서 사용
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//메인화면 상단 이미지 조회
	public List<HomeVO> selectTop(Map<String, String> map) throws DataAccessException{ 
		List<HomeVO> tmp = sqlSession.selectList("HomeMapper.Home1000_selectTop", map);
		return tmp;
	}
	
	//메인화면 하단 이미지 조회
	public List<HomeVO> selectBottm(Map<String, String> map) throws DataAccessException{ 
		List<HomeVO> tmp = sqlSession.selectList("HomeMapper.Home1000_selectBottm", map);
		return tmp;
	}
	
	
	
	

}

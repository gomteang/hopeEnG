package org.hope.web.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.hope.web.controller.BraaController;
import org.hope.web.domain.BraaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class BraaDAO {
	
	@Autowired
	private SqlSession sqlSession; //상위클래스로 빼기 -> 상위클래스에서 필요한 부분 오버라이드 해서 자식클래스는 불러서 사용
	
	private static final Logger logger = LoggerFactory.getLogger(BraaController.class);
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void insert(BraaVO braaVO) throws DataAccessException{ 
		// TODO Auto-generated method stub
		sqlSession.insert("BraaMapper.Braa1000_insert", braaVO);
	}
	
	public List<BraaVO> select(Map<String, String> map) throws DataAccessException{ 
		// TODO Auto-generated method stub
		return sqlSession.selectList("BraaMapper.Braa1000_select", map);
	}
	
	public BraaVO selectDetail(String bordNum) throws DataAccessException{ 
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BraaMapper.Braa1000_selectDetail", bordNum);
	}
	
	public int update(BraaVO braaVO) throws DataAccessException{
		return sqlSession.update("BraaMapper.Braa1000_update", braaVO);
	}

}

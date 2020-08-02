package org.hope.web.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.hope.web.controller.GlaaController;
import org.hope.web.domain.GlaaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class GlaaDAO {
	
	@Autowired
	private SqlSession sqlSession; //상위클래스로 빼는거 고려 
	
	private static final Logger logger = LoggerFactory.getLogger(GlaaController.class);
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void insert(GlaaVO glaaVO) throws DataAccessException{ 
		// TODO Auto-generated method stub
		sqlSession.insert("GlaaMapper.Glaa1000_insert", glaaVO);
	}
	
	public List<GlaaVO> select(Map<String, String> map) throws DataAccessException{ 
		// TODO Auto-generated method stub
		return sqlSession.selectList("GlaaMapper.Glaa1000_select", map);
	}
	

}

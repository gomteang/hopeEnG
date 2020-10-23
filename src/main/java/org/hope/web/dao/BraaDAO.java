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
	
	////////////////////////////////////////////////////////
	////                GlaaList 갤러리 메인화면                             ////
	////////////////////////////////////////////////////////
	//온라인 문의글 목록 조회
	public List<BraaVO> select(Map<String, Object> map) throws DataAccessException{ 
		// TODO Auto-generated method stub
		return sqlSession.selectList("BraaMapper.Braa1000_select", map);
	}
	//온라인 문의글 총 수
	public int selectTotalCnt(Map<String, Object> map) throws DataAccessException{
		return sqlSession.selectOne("BraaMapper.Braa1000_totalCnt", map);
	}
	
	
	////////////////////////////////////////////////////////
	////                GlaaPage 갤러리 상세화면                             ////
	////////////////////////////////////////////////////////
	//온라인 문의글 상세 조회
	public BraaVO selectDetail(String bordNum) throws DataAccessException{ 
		return sqlSession.selectOne("BraaMapper.Braa1000_selectDetail", bordNum);
	}
	//온라인 문의글 조횟수 증가
	public int updateIncreViewsBraa(String bordNum) throws DataAccessException{
		return sqlSession.update("BraaMapper.Braa1000_updateIncreViews", bordNum);
	}
	//온라인 문의글 작성
	public void insert(BraaVO braaVO) throws DataAccessException{ 
		sqlSession.insert("BraaMapper.Braa1000_insert", braaVO);
	}
	//온라인 문의글 수정
	public int update(BraaVO braaVO) throws DataAccessException{
		return sqlSession.update("BraaMapper.Braa1000_update", braaVO);
	}
	//온라인 문의글 삭제
	public int delete(BraaVO braaVO) throws DataAccessException{
		return sqlSession.update("BraaMapper.Braa1000_delete", braaVO);
	}
	
	
	////////////////////////////////////////////////////////
	////       BraaConfirmPassWd 문의글 조회 비밀번호 팝업                 /// 
	////////////////////////////////////////////////////////
	//온라인 문의글 비밀번호 체크 
	public String selectPassWd(String bordNum) throws DataAccessException{
		return sqlSession.selectOne("BraaMapper.Braa1000_selectPassWd", bordNum);
	}
	
	
	//지울예정
	public List<BraaVO> hexTemp(){
		return sqlSession.selectList("BraaMapper.Braa1000_temp");
	}

}

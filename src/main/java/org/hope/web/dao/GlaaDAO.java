package org.hope.web.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.hope.web.controller.GlaaController;
import org.hope.web.domain.GlaaFileVO;
import org.hope.web.domain.GlaaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class GlaaDAO {
	
	@Autowired
	private SqlSession sqlSession; //상위클래스로 빼기 -> 상위클래스에서 필요한 부분 오버라이드 해서 자식클래스는 불러서 사용
	
	private static final Logger logger = LoggerFactory.getLogger(GlaaController.class);
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	////////////////////////////////////////////////////////
	////              GlaaList 갤러리 메인 조회                                ////
	////////////////////////////////////////////////////////
	//갤러리 메인 글 리스트 조회
	public List<GlaaVO> select(Map<String, Object> map) throws DataAccessException{ 
		List<GlaaVO> tmp = sqlSession.selectList("GlaaMapper.Glaa1000_select", map);
		return tmp;
	}
	// 게시물 수 조회
	public int selectTotalCnt(Map<String, Object> map) throws DataAccessException{
		return sqlSession.selectOne("GlaaMapper.Glaa1000_totalCnt", map);
	}
	
		
	////////////////////////////////////////////////////////
	////              GlaaPage 갤러리 상세 조회                                ////
	////////////////////////////////////////////////////////
	public GlaaVO selectDetail(String gllyNo) throws DataAccessException{ 
		GlaaVO tmp = sqlSession.selectOne("GlaaMapper.Glaa1000_selectDetail", gllyNo);
		return tmp;
	}
	//갤러리 메인 첨부 파일 조회
	public List<GlaaFileVO> selectImagePath(String gllyNo){
		return sqlSession.selectList("GlaaMapper.Glaa1000_selectFileList", gllyNo);
	}
	////////////////////////////////////////////////////////  
	////             GlaaUploadForm 갤러리 등록                            ////
	////////////////////////////////////////////////////////
	//glly_no 조회//
	public int selectGllyNo(GlaaVO glaaVO)throws DataAccessException {
		return sqlSession.selectOne("GlaaMapper.Glaa1000_selectGllyNo",glaaVO);
	}
	//갤러리 글 등록
	public void insert(GlaaVO glaaVO) throws DataAccessException{ 
		sqlSession.insert("GlaaMapper.Glaa1000_insert", glaaVO);
	}
	//갤러리 첨부파일 등록
	public void insertGlaaFile(GlaaFileVO glaaFileVO) throws DataAccessException{
		sqlSession.insert("GlaaMapper.Glaa1000_insertFile", glaaFileVO);
	}
	
	
	////////////////////////////////////////////////////////
	////            GlaaUpdatePage 갤러리 수정 화면                       ////
	////////////////////////////////////////////////////////
	// 갤러리 글 수정
	public void updateGlaa(GlaaVO glaa) throws DataAccessException{
		sqlSession.update("GlaaMapper.Glaa1000_update", glaa);
	}
	
	// 삭제
	public void deleteGlaa(String gllyNo) throws DataAccessException{
		//갤러리 글 삭제
		sqlSession.delete("GlaaMapper.Glaa1000_delete", gllyNo);
		// 갤러리 파일 삭제
		sqlSession.delete("GlaaMapper.Glaa1000_delete_file", gllyNo);
	}

}

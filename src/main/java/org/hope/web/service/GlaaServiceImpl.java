package org.hope.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hope.web.controller.GlaaController;
import org.hope.web.dao.GlaaDAO;
import org.hope.web.domain.GlaaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GlaaServiceImpl implements GlaaService{
	@Autowired
	GlaaDAO glaaDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(GlaaController.class);
	
	@Override
	public void insertGlaa(GlaaVO glaaVO) {
		// TODO Auto-generated method stub
		glaaDAO.insert(glaaVO);
	}

	@Override
	public List<GlaaVO> selectGlaa(Map<String, String> map) {
		// TODO Auto-generated method stub
		return glaaDAO.select(map);
	}

}

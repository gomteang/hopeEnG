package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.controller.BraaController;
import org.hope.web.dao.BraaDAO;
import org.hope.web.domain.BraaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BraaServiceImpl implements BraaService{
	@Autowired
	BraaDAO braaDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(BraaController.class);
	
	@Override
	public void insertBraa(BraaVO braaVO) {
		// TODO Auto-generated method stub
		braaDAO.insert(braaVO);
	}

	@Override
	public List<BraaVO> selectBraa(Map<String, String> map) {
		// TODO Auto-generated method stub
		return braaDAO.select(map);
	}

	@Override
	public BraaVO selectDetailBraa(String bordNum) {
		// TODO Auto-generated method stub
		return braaDAO.selectDetail(bordNum);
	}

	@Override
	public void updateBraa(BraaVO braaVO) {
		// TODO Auto-generated method stub
		int num = braaDAO.update(braaVO);
		logger.debug("num:"+num);
		
	}

}

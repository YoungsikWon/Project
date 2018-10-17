package com.cufflink.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainDao {

	
	Logger logger = Logger.getLogger(MainDao.class);
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;

	public List<Map<String,Object>> MainProject() {
		// TODO Auto-generated method stub
		List<Map<String,Object>> pMap = null;
		pMap = sqlSessionTemplate.selectList("MainProject");
		return pMap;
	}
	
}

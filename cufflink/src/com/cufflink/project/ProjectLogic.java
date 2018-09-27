package com.cufflink.project;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectLogic {
	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	ProjectDao projectDao;
	
	List<Map<String, Object>>list;
	Map<String, Map> map;
	int result;
	
	//프로젝트 찾기 : 카테고리 분류
	public Map<String, Map> getProjectFind(Map<String, Object> pMap){
		logger.info("ProjectFind 호출 성공");
		map = projectDao.getProjectFind(pMap);
		logger.info(map);
		return map;
	}
}

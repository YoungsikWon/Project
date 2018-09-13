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
	
	public List<String> getProejct(){
		List<String> pro = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectList();
		logger.info(list);
		for(Map<String, Object>map : list) {
			pro.add((String)map.get("S_PW"));
		}
		logger.info("pro 호출 성공"+pro);
		return pro;
	}
}

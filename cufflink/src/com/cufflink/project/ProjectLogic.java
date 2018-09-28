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
	public List<String> getProjectFind(){
		logger.info("ProjectFind 호출 성공");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectFind();
		logger.info(list);
		for (Map<String, Object> map : list) {
			ProjectFind.add((String)map.get("cate_main"));
		}
		logger.info(ProjectFind);
		return ProjectFind;
	}
}

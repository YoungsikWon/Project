package com.cufflink.project;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
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
	
	
	//프로젝트 전체목록
	public List<Map<String, Object>> getProject(){
		logger.info("Project 호출 성공");
		List<String> Project = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProject();
		logger.info(list);
		for (Map<String, Object> map : list) {
			Project.add((String)map.get("PRO_NAME"));
		}
		logger.info("프로젝트가 호출을성공했습니다."+ list);
		return list;
	}
	
	
	//프로젝트 찾기 : 카테고리 분류
	//프로젝트 찾기 : 개발
	public List<Map<String, Object>> getProjectFind1(){
		logger.info("ProjectFind 호출 성공");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectFind1();
		logger.info(list);
		for (Map<String, Object> map : list) {
			ProjectFind.add((String)map.get("CATE_SUB"));
		}
		logger.info("list1 호출이 성공했습니다."+ list);
		return list;
	}
	//프로젝트 찾기 : 디자인
	public List<Map<String, Object>> getProjectFind2(){
		logger.info("ProjectFind 호출 성공");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectFind2();
		logger.info(list);
		for (Map<String, Object> map : list) {
			ProjectFind.add((String)map.get("CATE_SUB"));
		}
		logger.info("list2 호출이 성공했습니다."+ list);
		return list;
	}

}

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

	List<Map<String, Object>> list;
	Map<String, Map> map;
	int result;

	// 프로젝트 전체목록
	public List<Map<String, Object>> getProject() {
		logger.info("Project 호출 성공");
		List<String> Project = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProject();
		for (Map<String, Object> map : list) {
			Project.add((String) map.get("PRO_NAME"));
		}
		return list;
	}

	///////////////////////////////
	// 프로젝트 찾기 : 카테고리 분류
	///////////////////////////////
	// 프로젝트 찾기 : 개발
	public List<Map<String, Object>> getProjectFind1() {
		logger.info("ProjectFind 호출 성공");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectFind1();
		for (Map<String, Object> map : list) {
			ProjectFind.add((String) map.get("CATE_SUB"));
		}
		return list;
	}

	// 프로젝트 찾기 : 디자인
	public List<Map<String, Object>> getProjectFind2() {
		logger.info("ProjectFind 호출 성공");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectFind2();
		for (Map<String, Object> map : list) {
			ProjectFind.add((String) map.get("CATE_SUB"));
		}
		return list;
	}

	// 프로젝트 찾기 : 전체 리스트
	public List<Map<String, Object>> getProject_cateALL() {
		logger.info("getProject_cateALL 호출 성공");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProject_CATE();
		for (Map<String, Object> map : list) {
			ProjectFind.add((String) map.get("CATE_MAIN"));
		}
		return list;
	}

	// 프로젝트 찾기 페이지 네이션
	public Map<String, Object> getProAll(int pagenum) {
		logger.info("getProAll 호출 성공");
		Map<String,Object> map = projectDao.getProAll(pagenum);
		return map;
	}
	
}

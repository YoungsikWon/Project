package com.cufflink.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

@Service
public class ProjectLogic {
	Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	ProjectDao projectDao;

	List<Map<String, Object>> list;
	Map<String, Map> map;
	int result;

	// 프로젝트 찾기  전체목록을 담아줄 것입니다.
	public Map<String,Map> Project(Map<String, Object> pMap){
		logger.info("Project 호출성공");
		map = projectDao.Project_1(pMap);
		logger.info(map);
		return map;
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
	public List<Map<String, Object>> P_Enrollment() {
		logger.info("P_Enrollment 호출 성공");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectFind1();
		for (Map<String, Object> map : list) {
			ProjectFind.add((String) map.get("P_NO"));
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
	// 프로젝트 찾기 : 전체 리스트
	public List<Map<String, Object>> getProjectseach() {
		logger.info("getProject_cateALL 호출 성공");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectseach();
		for (Map<String, Object> map : list) {
			ProjectFind.add((String) map.get("PRO_NAME"));
		}
		return list;
	}

	// 프로젝트 찾기 페이지 네이션
	public Map<String, Object> getProAll(int pagenum) {
		logger.info("getProAll 호출 성공");
		Map<String,Object> map = projectDao.getProAll(pagenum);
		return map;
	}
	
	public List<Map<String,Object>> getState (String s_email, String state){
		Map<String,Object> map = new HashMap<>();
		map.put("s_email", s_email);
		map.put("su_state", state);
		list = projectDao.getState(map);
		return list;
	}
	// 프로젝트 상세보기
	   public Map<String, Object> ProjectView(int pro_no) {
	      logger.info("ProjectView");
	      
	      Map<String, Object> map = projectDao.ProjectView(pro_no);
	      logger.info(pro_no);
	      return map;
	   }
	   
	   public List<Map<String,Object>> projectList(Map<String,Object> pMap){
		   List<Map<String,Object>> list = new ArrayList<>();
		   Gson gson = new Gson();
		   System.out.println(pMap.get("categoryList"));
		   if(pMap.get("categoryList").equals("[]")) {
			   list = projectDao.projectList(pMap);
		   }else {
			   String categoryList = (String)pMap.get("categoryList");
				List<Map<String,Object>> category = gson.fromJson(categoryList, List.class);
				for (Map<String, Object> cate : category) {
					List<Map<String,Object>> lists = new ArrayList<>();
					pMap.put("cate_main", cate.get("cate_main"));
					pMap.put("cate_sub", cate.get("cate_sub"));
					lists = projectDao.projectList(pMap);
					for (Map<String, Object> map : lists) {
						list.add(map);
					}
				}
		   }
		   return list;
	   }
}

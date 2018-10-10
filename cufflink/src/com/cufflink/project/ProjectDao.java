package com.cufflink.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cufflink.partners.PartnersDao;

@Service
public class ProjectDao {
	Logger logger = Logger.getLogger(ProjectDao.class);

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	List<Map<String, Object>> list; //
	Map<String, Map> map;// 맵에 담아줄 것입니다.

	/*******************************************************************
	 * @Name : 원영식
	 * @return : list
	 * @Context : 프로젝트 찾기 : 카테고리 디자인 / 개발 및 프로젝트 등 삽입 / 프로젝트 찾기 / 프로젝트 상세보기 : 평가, 평가 점수, 클라이언트 소개
	 ******************************************************************/

	// Page : 프로젝트 상세보기 
	public Map<String, Map> Project_1(Map<String, Object> pMap) {
		logger.info("Project 호출성공");
		Map<String, Map> rMap = new HashMap<>();
		
		//전체 프로젝트 목록 뿌리기
		map = sqlSessionTemplate.selectOne("Project",map);
		rMap.put("Project", map);
		
		//프로젝트 상세보기 / 클라이언트 프로젝트 계약률 및 현재 진행상태를  넣어주기
		map = sqlSessionTemplate.selectOne("P_Project",map);
		rMap.put("P_Project", map);
	
		/********************************************************
		 * 파트너스 히스토리                                                                                           *
		 ********************************************************/
		// 파트너스 히스토리  프로젝트 현황표 넣기
		map = sqlSessionTemplate.selectOne("Partners_history",map);
		rMap.put("Partners_history", map);
		
		// 파트너스 전문성, 사전 준비, 의사 소통, 일정 준수, 적극성 평균 값
		map = sqlSessionTemplate.selectOne("Partners_AVG",map);
		rMap.put("Partners_AVG", map);
		
		// 파트너스 평균평점 / 평가 0개
		map = sqlSessionTemplate.selectOne("Partners_AllAVG",map);
		rMap.put("Partners_AllAVG", map);
		
		// 클라이언트 소개
		map = sqlSessionTemplate.selectOne("Partners_aboutme",map);
		rMap.put("Partners_aboutme", map);
		
	    return rMap;
	    
	}
	// 프로젝트 찾기 : 전체 카테고리
		public List<Map<String, Object>> getProject_CATE() {
			List<Map<String, Object>> list = new ArrayList<>();
			List<Object> lists = new ArrayList<Object>();
			list = sqlSessionTemplate.selectList("getProject_CATE"); // 개발
			lists.add(list);
			// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //디자인
			return list;
		}
	// 프로젝트 찾기 : 카테고리 개발 
	public List<Map<String, Object>> getProjectFind1() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<Object> lists = new ArrayList<Object>();
		list = sqlSessionTemplate.selectList("ProjectCate_sub1"); // 개발
		lists.add(list);
		// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //디자인
		return list;
	}
	// 프로젝트 찾기 : 카테고리 디자인
	public List<Map<String, Object>> getProjectFind2() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<Object> lists = new ArrayList<Object>();
		list = sqlSessionTemplate.selectList("ProjectCate_sub2"); // 개발
		lists.add(list);
		// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //디자인
		return list;
	}
		// 프로젝트 찾기 : 페이지 네이션
		public Map<String, Object> getProAll(int pagenum) {
			Map<String,Object> map1 = new HashMap<>();
			map1.put("pagenumber", pagenum);
			map1.put("pagecount", 10);
			sqlSessionTemplate.selectOne("test",map1); // 개발
			logger.info(map1);
			// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //디자인
			return map1;
	}
		// 프로젝트 상세보기
		public Map<String, Object>  ProjectView(int pro_no) {
			Map<String, Object> map = new HashMap<>();
			map.put("pro_no", pro_no);
			map = sqlSessionTemplate.selectOne("ProjectView", map);
			return map;
		
			
			
	
		
		}

}

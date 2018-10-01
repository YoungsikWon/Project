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
	 * @Context : 프로젝트 찾기 : 카테고리 디자인 / 개발 및 프로젝트 등 삽입
	 ******************************************************************/

	// 프로젝트 전체목록 호출하고자 합니다.
	public List<Map<String, Object>> getProject() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<Object> lists = new ArrayList<Object>();
		list = sqlSessionTemplate.selectList("Project"); // 프로젝트 전체 목록
		lists.add(list);
		logger.info("Project Dao 호출" + list);
		return list;
	}

	// 프로젝트 찾기 : 카테고리 개발 / 디자인
	public List<Map<String, Object>> getProjectFind1() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<Object> lists = new ArrayList<Object>();
		list = sqlSessionTemplate.selectList("ProjectCate_sub1"); // 개발
		lists.add(list);
		// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //디자인
		return list;
	}

	public List<Map<String, Object>> getProjectFind2() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<Object> lists = new ArrayList<Object>();
		list = sqlSessionTemplate.selectList("ProjectCate_sub2"); // 개발
		lists.add(list);
		// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //디자인
		return list;
	}

}

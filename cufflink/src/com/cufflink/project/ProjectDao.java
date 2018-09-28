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
	
		
		
		//프로젝트 찾기  : 카테고리  개발 / 디자인
		public List<Map<String, Object>> getProjectFind(){
			
			List<Map<String, Object>> list = new ArrayList<>();
			list = sqlSessionTemplate.selectList("ProjectCategory"); //개발
			//list = sqlSessionTemplate.selectList("ProjectCate_main2"); //디자인
			logger.info("DAO"+list);
			return list;
		}
	
		
}

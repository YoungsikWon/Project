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
		
		int result;
		List<Map<String, Object>> list;
		Map<String, Map> map;
		
		//프로젝트 찾기  : 카테고리
		public Map<String, Map> getProjectFind(Map<String, Object>pMap){
			logger.info("getProjectFind호출 성공");
			Map<String, Map> rMap = new HashMap<>();
			
			map = sqlSessionTemplate.selectOne("ProjectCategory", map);
			rMap.put("ProjectCategory", map);
			logger.info("ProjectCategory 호출 성공"+pMap);
			return rMap;
		}
}

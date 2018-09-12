package com.cufflink.project;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectDao {
		Logger logger = Logger.getLogger(this.getClass());
		
		@Autowired
		SqlSessionTemplate sqlSessionTemplate;
		List<Map<String, Object>> list;
		
		public List<Map<String, Object>> getProjectList(){
			
			list = sqlSessionTemplate.selectList("Project_A");
			return list;
			
		}
		
		
	
}
	
	

package com.cufflink.project;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectDao {

		@Autowired
		SqlSessionTemplate sqlSessionTemplate;
		
		public List<Map<String, Object>> getProjectList(){
			List<Map<String, Object>> list = new ArrayList<>();
			list = sqlSessionTemplate.selectList("SelectTest");
			return list;
		}
}

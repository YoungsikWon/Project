package com.cufflink.android;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AndroidDao {

	Logger logger = Logger.getLogger(AndroidDao.class);
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	
	//아이디가 존제하면 1 없으면 0
		public int IdExit(Map<String,Object> pMap) {
			
		    return sqlSessionTemplate.selectOne("idExit",pMap);
		}
		
		public int EmailExit(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			return sqlSessionTemplate.selectOne("EmailExit",pMap);
		}
		
		public int join(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			int result = 0;
		
			result = sqlSessionTemplate.insert("AJoin",pMap);
			
			return result;
		}

		public Map<String,Object> login(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			
			Map<String,Object> hMap = null;
		
			
			hMap = sqlSessionTemplate.selectOne("ALogin",(String)pMap.get("j_id"));

		
			
			if(hMap.get("S_PW").equals(pMap.get("j_pw"))) {
			
				return hMap;
			}
			
			
			return null;
			
		}

		public List<Map<String, Object>> GooggleMap() {
			// TODO Auto-generated method stub
			
			List<Map<String,Object>> list = sqlSessionTemplate.selectList("GooggleMap");
			logger.info(list.size());
			
			return list;
		}

		public List<Map<String, Object>> List() {
			// TODO Auto-generated method stub
			logger.info("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD1");
			List<Map<String,Object>> list = sqlSessionTemplate.selectList("AprojectList");
			logger.info("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD2");
			logger.info(list.size());
			
			return list;
		}

		public java.util.List<Map<String, Object>> MainPage() {
			// TODO Auto-generated method stub
			List<Map<String,Object>> list = sqlSessionTemplate.selectList("AMainProject");
			logger.info(list.size());
			
			return list;
		}

		public Map<String, Object> ProjectInfo(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			
			Map<String,Object> list = sqlSessionTemplate.selectOne("ProjectInfo",pMap);
		
			
			return list;
		}

		public java.util.List<Map<String, Object>> Search(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			List<Map<String,Object>> list = sqlSessionTemplate.selectList("SearchList",pMap);
			logger.info(list);
			return list;
		}

		public java.util.List<Map<String, Object>> ProjectAttention(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			
			List<Map<String,Object>> list = sqlSessionTemplate.selectList("ProjectAttention",pMap);
			logger.info(list);
			return list;
		}
		public void projectAttention(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			sqlSessionTemplate.insert("projectsupport", pMap);
		}

		public void projectcancel(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			sqlSessionTemplate.delete("projectsupportDelete1", pMap);
		}
		
	
}

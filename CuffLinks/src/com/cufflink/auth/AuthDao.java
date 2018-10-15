package com.cufflink.auth;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	List<Map<String,Object>> list = new ArrayList<>();
	
	public List<Map<String,Object>> projectList(String email) {
		list = sqlSessionTemplate.selectList("auth.projectList",email);
		return list;
	}
	
	public List<Map<String,Object>> emailList(int pro_no) {
		list = sqlSessionTemplate.selectList("auth.emailList", pro_no);
		return list;
	}
}

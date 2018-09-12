package com.cufflink.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // mapperMapping 처리를 
	
	public List<Map<String,Object>> getClientList(){
		List<Map<String,Object>> list = new ArrayList<>();
		list = sqlSessionTemplate.selectList("cli_select");
		return list;
	}
}

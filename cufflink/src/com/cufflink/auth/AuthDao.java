package com.cufflink.auth;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthDao {
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate;
	
	
}

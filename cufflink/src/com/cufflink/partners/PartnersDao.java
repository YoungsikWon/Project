package com.cufflink.partners;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartnersDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	int result;
	List<Map<String, Object>> list;

	public int insert() {
		// insert 부분 로직처리
		result = sqlSessionTemplate.insert("insert");
		return result;
	}

	public int update() {
		// update 부분 처리
		result = sqlSessionTemplate.update("update");
		return result;
	}

	public List<Map<String, Object>> list() {
		list = sqlSessionTemplate.selectList("mapper.select");
		return list;
	}

	public int delete() {
		// delete 부분 처리
		result = sqlSessionTemplate.delete("delete");
		return result;
	}
}

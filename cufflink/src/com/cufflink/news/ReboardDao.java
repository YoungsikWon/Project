package com.cufflink.news;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReboardDao {

 

      @Autowired private SqlSessionTemplate sqlSessionTemplate;
      
      public List getListCmt(String no) {
            return sqlSessionTemplate.selectList("reboard.listCmt", no);
      }

      public void createCmt(ReboardDto dto) {
    	  sqlSessionTemplate.insert("reboard.createCmt", dto);
      }
      public void deleteCmt(ReboardDto dto) {
    	  sqlSessionTemplate.delete("reboard.deleteCmt", dto);

      }

}





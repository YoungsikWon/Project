package com.cufflink.partners;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PartnersDao {
	Logger logger = Logger.getLogger(PartnersDao.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	int result;
	List<Map<String, Object>> list;
	Map<String, Map> map ;
	
	
	//파트너스 전체보기@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	public Map<String, Map> partnersMyprofileMain(Map<String, Object> pMap) {
		logger.info("partnersMyprofileMain호출성공");
		Map<String, Map> rMap = new HashMap<>();
		//파트너스 평가 - 
		///map = sqlSessionTemplate.selectOne("partnersMyprofileMain",pMap);
		//map.put("partnersMyprofileMain", map);
		//파트너스 평가 -활동요약 정보
	    map = sqlSessionTemplate.selectOne("partnersEvaluation_grade",map);
	    rMap.put("partnersEvaluation_grade", map);
	    logger.info("partnersEvaluation_grade 호출성공"+map);
	    
	    map = sqlSessionTemplate.selectOne("partnersEvaluation_pro",map);
	    rMap.put("partnersEvaluation_pro", map);
	    logger.info("partnersEvaluation_pro 호출성공"+map);
	    
	    map = sqlSessionTemplate.selectOne("partnersEvaluation_port",map);
	    rMap.put("partnersEvaluation_port", map);
	    logger.info("partnersEvaluation_port 호출성공"+map);
	    
	    //파트너스 평가 -세부항목 평가
	    map = sqlSessionTemplate.selectOne("partnersEvaluation_avg",map);
	    rMap.put("partnersEvaluation_avg", map);
	    logger.info("partnersEvaluation_avg 호출성공"+map);
	    
	    //파트너스 평가 -진행한 카테고리
	    map = sqlSessionTemplate.selectOne("partnersEvaluation_cate",map);
	    rMap.put("partnersEvaluation_cate", map);
	    logger.info("partnersEvaluation_cate 호출성공"+map);	
		logger.info(map);
		
		//파트너스 경력,학력,자격증
		map = sqlSessionTemplate.selectOne("partnersBackground",map);
		rMap.put("partnersBackground", map);
		logger.info("partnersBackground 호출성공"+map);
		
		//파트너스 자기 소개
		map = sqlSessionTemplate.selectOne("partnersIntroduction",map);
		rMap.put("partnersIntroduction", map);
		logger.info("partnersIntroduction 호출성공"+map);
		
		//파트너스 보유 기술
		map = sqlSessionTemplate.selectOne("partnersSkill",map);
		rMap.put("partnersSkill", map);
		logger.info(map);
		
		//파트너스 포트폴리오
		map = sqlSessionTemplate.selectOne("partnersPortfolio",map);
		rMap.put("partnersPortfolio", map);
		logger.info("partnersPortfolio"+map);
		logger.info("Main에 담긴 내용: "+map);
		return rMap;
	}

}

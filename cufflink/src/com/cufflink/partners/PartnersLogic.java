package com.cufflink.partners;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartnersLogic {
	Logger logger = Logger.getLogger(PartnersLogic.class);
	
	@Autowired
	PartnersDao partnersDao;
	
	List<Map<String,Object>> list;
	Map<String,Map> map;
	int result;
	
	//파트너스 목록 전체보기
	public Map<String,Map> partnersMyprofileMain(Map<String, Object> pMap){
		logger.info("partnersMyprofileMain 호출성공");
		map = partnersDao.partnersMyprofileMain(pMap);
		logger.info(map);
		return map;
	}
	/*//파트너스 경력,학력, 자격증
	public Map<String,Map> partnersBackground(Map<String, Object> pMap) {
		logger.info("partnersBackground 호출성공");
		map = partnersDao.partnersBackground(pMap);
		logger.info(map);
		return map;
	}
	//파트너스 평가
	public Map<String,Map> partnersEvaluation(Map<String, Object> pMap) {
		logger.info("partnersEvaluation 호출성공");
		map = partnersDao.partnersEvaluation(pMap);
		logger.info(map);
		return map;
	}
	//파트너스  자기 소개
	public Map<String,Map> partnersIntroduction(Map<String, Object> pMap) {
		logger.info("partnersIntroduction 호출성공");
		map = partnersDao.partnersIntroduction(pMap);
		logger.info(map);
		return map;
	}
	//파트너스 포트폴리오
	public Map<String,Map> partnersPortfolio(Map<String, Object> pMap) {
		logger.info("partnersPortfolio 호출성공");
		map = partnersDao.partnersPortfolio(pMap);
		logger.info(map);
		return map;
	}
	//파트너스 보유 기술
	public Map<String,Map> partnersSkill(Map<String, Object> pMap) {
		logger.info("partnersSkill 호출성공");
		map = partnersDao.partnersSkill(pMap);
		logger.info(map);
		return map;
	}
	*/
	
}

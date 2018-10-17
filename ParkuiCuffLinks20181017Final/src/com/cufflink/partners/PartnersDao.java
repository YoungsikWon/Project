package com.cufflink.partners;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;



@Service
public class PartnersDao {
	Logger logger = Logger.getLogger(PartnersDao.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	int result;
	List<Map<String, Object>> list;
	Map<String, Object> map = new HashMap<>();
	
	public List<Map<String, Object>> partnersMyprofileMain(int pno) {
		logger.info("partnersMyprofileMain호출성공");
		list = new ArrayList<>();
		return list;
	}
	
	//s_email로 p_no가져옴
	public int getUserP_no(String s_email) {
		System.out.println(s_email+","+sqlSessionTemplate);
		int result = 0;
		try {
			result = sqlSessionTemplate.selectOne("getUserP_no",s_email);
		} catch (Exception e) {
			System.out.println("exception:"+e.getMessage());
		}
		return result;
	}
		
/*******************************************************************************************************************************
 * 
 * @param pno
 * @return
 *********************************************************************************************************************************/
	// 내 프로필 - 평가 - 평균,평점, 진행한 카테고리(프로시저)
	public Map<String, Object> proc_partners_eval(int pno) {
		logger.info("proc_partners_eval호출성공");
		list = new ArrayList<>();
		map.put("e_no", pno);
		sqlSessionTemplate.selectList("proc_partners_eval", map);
		// map.put("proc_partners_eval", pno);
		// System.out.println(map.get("proc_partners_eval"));
		
		return map;
	}
	// list.get(0).get("노비아줌마바보").toString();

	// 내 프로필 - 포트폴리오, 경력,학력, 자격증, 보유기술(프로시저)
	public Map<String, Object> proc_partners_back(int pno) {
		logger.info("proc_partners_back호출성공");
		list = new ArrayList<>();
		map.put("e_no", pno);
		sqlSessionTemplate.selectList("proc_partners_back", map);
		// map.put("proc_partners_back", pno);
		return map;
	}

	//내프로필 - 클라이언트 평가 - 디테일 (프로시저)
	public Map<String, Object> proc_c_eval(int pno) {
		logger.info("proc_c_eval호출성공");
		list = new ArrayList<>();
		map.put("e_no", pno);
		sqlSessionTemplate.selectList("proc_c_eval", map);
		// map.put("proc_c_eval", pno);
		return map;
	}
	
	//파트너스목록에 필요힌 정보가져오기 위한 p_no
	public List<Integer> getP_no() {
		// TODO Auto-generated method stub
		List<Integer> result = sqlSessionTemplate.selectList("getP_no");
		logger.info(result);
		return result;
	}
	
	public List<Map<String, Object>> getStateProject(Map<String,Object> pMap) {
		list = sqlSessionTemplate.selectList("getState", pMap);
		return list;
	}
	//파트너스 마이 위시켓
/*	public List<Map<String,Object>> partnersMyWishket(int pno) {
		list = sqlSessionTemplate.selectList("partnersInterestProject", map );
		return list;
	}*/
	/*//파트너스 관심 프로젝트
	public List<Map<String,Object>> partnersInterestProject(int pno){
		return  sqlSessionTemplate.selectList("partnersInterestProject",map); 
	}
	//파트너스 지원내역
	public List<Map<String,Object>> partnersSupportHistory(int pno){
		return  sqlSessionTemplate.selectList("partnersSupportHistory",map); 
	}
	//파트너스 진행중인 프로젝트
	public List<Map<String,Object>> partnersProject_ing(int pno){
		return sqlSessionTemplate.selectList("partnersProject_ing");
	}*/
		
}

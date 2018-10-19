package com.cufflink.partners;

import java.util.ArrayList;
import java.util.HashMap;
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
	Map<String,Object> map;
	int result;
	
	//파트너스 목록 전체보기
	public List<Map<String,Object>> partnersMyprofileMain(int pno){
		logger.info("partnersMyprofileMain 호출성공");
		//partnersDao.test();
		list = partnersDao.partnersMyprofileMain(pno);
		return list;
	}
//@@proc_partners_eval@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	public List<Map<String,Object>> e_grade(int pno) {
		logger.info("e_grade 호출성공");
		map = partnersDao.proc_partners_eval(pno);
		list = (List<Map<String, Object>>) map.get("e_grade");
		return list;
	}
	public List<Map<String,Object>> e_pro(int pno) {
		logger.info("e_pro 호출성공");
		map = partnersDao.proc_partners_eval(pno);
		list = (List<Map<String, Object>>) map.get("e_pro");
		return list;
	}
	public List<Map<String,Object>> e_avg(int pno) {
		logger.info("e_avg 호출성공");
		map = partnersDao.proc_partners_eval(pno);
		list = (List<Map<String, Object>>) map.get("e_avg");
		return list;
	}
	public List<Map<String,Object>> e_cate(int pno) {
		logger.info("e_cate 호출성공");
		map = partnersDao.proc_partners_eval(pno);
		list = (List<Map<String, Object>>) map.get("e_cate");
		return list;
	}
	public List<Map<String,Object>> e_intro(int pno) {
		logger.info("e_intro 호출성공");
		map = partnersDao.proc_partners_eval(pno);
		list = (List<Map<String, Object>>) map.get("e_intro");
		return list;
	}
//@@proc_partners_back@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
	public List<Map<String,Object>> e_port(int pno) {
		logger.info("e_port 호출성공");
		map = partnersDao.proc_partners_back(pno);
		list = (List<Map<String, Object>>) map.get("e_port");
		return list;
	}
	public List<Map<String,Object>> e_back_car(int pno) {
		logger.info("e_back_car 호출성공");
		map = partnersDao.proc_partners_back(pno);
		list = (List<Map<String, Object>>) map.get("e_back_car");
		return list;
	}
	public List<Map<String,Object>> e_back_lic(int pno) {
		logger.info("e_back_lic 호출성공");
		map = partnersDao.proc_partners_back(pno);
		list = (List<Map<String, Object>>) map.get("e_back_lic");
		return list;
	}
	public List<Map<String,Object>> e_back_edu(int pno) {
		logger.info("e_back_edu 호출성공");
		map = partnersDao.proc_partners_back(pno);
		list = (List<Map<String, Object>>) map.get("e_back_edu");
		return list;
	}
	public List<Map<String,Object>> e_skill(int pno) {
		logger.info("e_skill 호출성공");
		map = partnersDao.proc_partners_back(pno);
		list = (List<Map<String, Object>>) map.get("e_skill");
		return list;
	}
	//@@@proc_c_eval@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
	public List<Map<String,Object>> c_eval_grade(int pno) {
		logger.info("c_eval_grade 호출성공");
		map = partnersDao.proc_c_eval(pno);
		list = (List<Map<String, Object>>) map.get("c_eval_grade");
		return list;
	}
	public List<Map<String,Object>> c_eval_cate(int pno) {
		logger.info("c_eval_cate 호출성공");
		map = partnersDao.proc_c_eval(pno);
		list = (List<Map<String, Object>>) map.get("c_eval_cate");
		return list;
	}
	public List<Map<String,Object>> c_eval_pro(int pno) {
		logger.info("c_eval_pro 호출성공");
		map = partnersDao.proc_c_eval(pno);
		list = (List<Map<String, Object>>) map.get("c_eval_pro");
		return list;
	}
	public List<Map<String,Object>> c_eval_info(int pno) {
		logger.info("c_eval_info 호출성공");
		map = partnersDao.proc_c_eval(pno);
		list = (List<Map<String, Object>>) map.get("c_eval_info");
		return list;
	}
	//
	public int getUserP_no(String s_email) {
		// TODO Auto-generated method stub
		int userEmail = partnersDao.getUserP_no(s_email);
		logger.info("getUserP_no: "+userEmail);
		return userEmail;
	}
	//파트너스 목록에 필요한 셀렉문만 따로 담음
	public List<Map<String, Object>> partnersList(){
		List<Map<String,Object>> getPartnersList = new ArrayList<>();
		List<Integer> pnos = new ArrayList<>();
		pnos = partnersDao.getP_no();
		for(Integer pno : pnos) {
			Map<String,Object> map = new HashMap<String,Object>();
			list = e_intro(pno);
			map.put("intro", list);
			list = e_pro(pno);
			map.put("pro", list);
			list = e_cate(pno);
			map.put("cate", list);
			list = e_port(pno);
			map.put("port", list);
			list = e_skill(pno);
			map.put("skill",list);
			list = e_grade(pno);
			map.put("grade", list);
			getPartnersList.add(map);
		}
		return getPartnersList;
	}
	
	public List<Map<String,Object>> getStateProject(String state, int pno){
		map = new HashMap<>();
		map.put("su_state", state);
		map.put("p_no", pno);
		list = partnersDao.getStateProject(map);
		return list;
	}
	
	/*public List<Map<String, Object>> partnersMyWishket(int pno){
		logger.info("partnersMyWishket호출성공");
		list = partnersDao.partnersMyWishket(pno);
		return list;
	}*/
	//파트너스 나의 위시켓 - 관심 프로젝트,지원내역, 진행중인 프로젝트  따로 담기
	/*public List<Map<String,Object>> partnersMyWishket(int pno) {
		logger.info("partnersMyWishket호출성공");
		 List<Map<String,Object>> partnersMyWishket = new ArrayList<>();
		 list = c_eval_grade(pno);
		 map.put("c_eval_garde",list);
		 list = c_eval_pro(pno);
		 map.put("c_eval_pro",list);
		 partnersMyWishket.add(map);
		return partnersMyWishket;
	}*/
	
	/*public List<Map<String,Object>> partnersProject_ing(int pno){
		logger.info("partnersProject_ing호출성공");
		List<Map<String,Object>> p_partnersProject_ing = new ArrayList<>();
		list = partnersProject(pno);
		for(int i=0;i<list.size();i++) {
			list = (List<Map<String, Object>>) list.get(i).get("partnersProject_ing");
			map.put("partnersProject_ing",list);
			p_partnersProject_ing.add(map);
		}
		return p_partnersProject_ing;
	}
	
	
	public List<Map<String,Object>> partnersProject(int pno){
		logger.info("partnersProject");
		List<Map<String, Object>> projectList = new ArrayList<>();
		list = c_eval_pro(pno);
		
		for(int i =0; i<list.size();i++) {
			if("진행 ".equals(list.get(i).get("SU_STATE"))) {
				map.put("partnersProject_ing", list);
			}
			else if("관심 ".equals(c_eval_pro(pno).get(i).get("SU_STATE"))) {
				map.put("partnersInterestProject", list);
			}
			else if("완료 ".equals(c_eval_pro(pno).get(i).get("SU_STATE"))) {
				map.put("partnersCompleteProject", list);
			}
			else if("지원 ".equals(c_eval_pro(pno).get(i).get("SU_STATE"))) {
				map.put("projectSupport", list);
			}
			projectList.add(map);
		}
		System.out.println("projectList:"+projectList);
		logger.info(projectList);
		return projectList;
		
	}
	*/
}

package com.cufflink.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

@Service
public class ProjectLogic {
	Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	ProjectDao projectDao;

	List<Map<String, Object>> list;
	Map<String, Map> map;
	int result;

	// ������Ʈ ã��  ��ü����� ����� ���Դϴ�.
	public Map<String,Map> Project(Map<String, Object> pMap){
		logger.info("Project ȣ�⼺��");
		map = projectDao.Project_1(pMap);
		logger.info(map);
		return map;
	}

	///////////////////////////////
	// ������Ʈ ã�� : ī�װ� �з�
	///////////////////////////////
	// ������Ʈ ã�� : ����
	public List<Map<String, Object>> getProjectFind1() {
		logger.info("ProjectFind ȣ�� ����");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectFind1();
		for (Map<String, Object> map : list) {
			ProjectFind.add((String) map.get("CATE_SUB"));
		}
		return list;
	}
	public List<Map<String, Object>> P_Enrollment() {
		logger.info("P_Enrollment ȣ�� ����");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectFind1();
		for (Map<String, Object> map : list) {
			ProjectFind.add((String) map.get("P_NO"));
		}
		return list;
	}

	// ������Ʈ ã�� : ������
	public List<Map<String, Object>> getProjectFind2() {
		logger.info("ProjectFind ȣ�� ����");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectFind2();
		for (Map<String, Object> map : list) {
			ProjectFind.add((String) map.get("CATE_SUB"));
		}
		return list;
	}

	// ������Ʈ ã�� : ��ü ����Ʈ
	public List<Map<String, Object>> getProject_cateALL() {
		logger.info("getProject_cateALL ȣ�� ����");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProject_CATE();
		for (Map<String, Object> map : list) {
			ProjectFind.add((String) map.get("CATE_MAIN"));
		}
		return list;
	}
	// ������Ʈ ã�� : ��ü ����Ʈ
	public List<Map<String, Object>> getProjectseach() {
		logger.info("getProject_cateALL ȣ�� ����");
		List<String> ProjectFind = new ArrayList<>();
		List<Map<String, Object>> list = projectDao.getProjectseach();
		for (Map<String, Object> map : list) {
			ProjectFind.add((String) map.get("PRO_NAME"));
		}
		return list;
	}

	// ������Ʈ ã�� ������ ���̼�
	public Map<String, Object> getProAll(int pagenum) {
		logger.info("getProAll ȣ�� ����");
		Map<String,Object> map = projectDao.getProAll(pagenum);
		return map;
	}
	
	public List<Map<String,Object>> getState (String s_email, String state){
		Map<String,Object> map = new HashMap<>();
		map.put("s_email", s_email);
		map.put("su_state", state);
		list = projectDao.getState(map);
		return list;
	}
	// ������Ʈ �󼼺���
	   public Map<String, Object> ProjectView(int pro_no) {
	      logger.info("ProjectView");
	      
	      Map<String, Object> map = projectDao.ProjectView(pro_no);
	      logger.info(pro_no);
	      return map;
	   }
	   
	   public List<Map<String,Object>> projectList(Map<String,Object> pMap){
		   List<Map<String,Object>> list = new ArrayList<>();
		   Gson gson = new Gson();
		   System.out.println(pMap.get("categoryList"));
		   if(pMap.get("categoryList").equals("[]")) {
			   list = projectDao.projectList(pMap);
		   }else {
			   String categoryList = (String)pMap.get("categoryList");
				List<Map<String,Object>> category = gson.fromJson(categoryList, List.class);
				for (Map<String, Object> cate : category) {
					List<Map<String,Object>> lists = new ArrayList<>();
					pMap.put("cate_main", cate.get("cate_main"));
					pMap.put("cate_sub", cate.get("cate_sub"));
					lists = projectDao.projectList(pMap);
					for (Map<String, Object> map : lists) {
						list.add(map);
					}
				}
		   }
		   return list;
	   }

	public void projectAttention(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		projectDao.projectAttention(pMap);
		
	}

	public void projectcancel(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		projectDao.projectcancel(pMap);
	}
	
	/**********수정 20181017 시작*******/
	public void deleteProject(int pro_no) {
		projectDao.deleteProject(pro_no);
	}
    
    public List<Map<String,Object>> projectSupportUser(int c_no){
    	list = projectDao.projectSupportUser(c_no);
    	return list;
    }
    
    public void stateChange(Map<String,Object> pMap) {
 	   projectDao.stateChange(pMap);
    }
    /**********수정 20181017 끝*******/
    
    /**********수정 20181018 시작*******/
    public Map<String,Object> getHistory(int c_no){
 	  Map<String,Object> map = new HashMap<>();
 	  map = projectDao.getHistory(c_no);
 	  return map;
    }
    /**********수정 20181018 끝*******/
}

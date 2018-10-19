package com.cufflink.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cufflink.partners.PartnersDao;

@Service
public class ProjectDao {
	Logger logger = Logger.getLogger(ProjectDao.class);

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	List<Map<String, Object>> list; //
	Map<String, Map> map;// �ʿ� ����� ���Դϴ�.

	/*******************************************************************
	 * @Name : ������
	 * @return : list
	 * @Context : ������Ʈ ã�� : ī�װ� ������ / ���� �� ������Ʈ �� ���� / ������Ʈ ã�� / ������Ʈ �󼼺��� : ��, ��
	 *          ����, Ŭ���̾�Ʈ �Ұ�
	 ******************************************************************/

	// Page : ������Ʈ �󼼺���
	public Map<String, Map> Project_1(Map<String, Object> pMap) {
		logger.info("Project ȣ�⼺��");
		Map<String, Map> rMap = new HashMap<>();
		map = sqlSessionTemplate.selectOne("Project", map);
		rMap.put("Project", map);

		// ������Ʈ �󼼺��� / Ŭ���̾�Ʈ ������Ʈ ���� �� ���� ������¸� �־��ֱ�
		map = sqlSessionTemplate.selectOne("P_Project", map);
		rMap.put("P_Project", map);

		/********************************************************
		 * ��Ʈ�ʽ� �����丮 *
		 ********************************************************/
		// ��Ʈ�ʽ� �����丮 ������Ʈ ��Ȳǥ �ֱ�
		map = sqlSessionTemplate.selectOne("Partners_history", map);
		rMap.put("Partners_history", map);

		// ��Ʈ�ʽ� ������, ���� �غ�, �ǻ� ����, ���� �ؼ�, ���ؼ� ��� ��
		map = sqlSessionTemplate.selectOne("Partners_AVG", map);
		rMap.put("Partners_AVG", map);

		// ��Ʈ�ʽ� ������� / �� 0��
		map = sqlSessionTemplate.selectOne("Partners_AllAVG", map);
		rMap.put("Partners_AllAVG", map);

		// Ŭ���̾�Ʈ �Ұ�
		map = sqlSessionTemplate.selectOne("Partners_aboutme", map);
		rMap.put("Partners_aboutme", map);

		return rMap;

	}

	// ������Ʈ ã�� : ��ü ī�װ�
	public List<Map<String, Object>> getProject_CATE() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<Object> lists = new ArrayList<Object>();
		list = sqlSessionTemplate.selectList("getProject_CATE"); // ����
		lists.add(list);
		// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //������
		return list;
	}

	// ������Ʈ ã�� : ī�װ� ����
	public List<Map<String, Object>> getProjectFind1() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<Object> lists = new ArrayList<Object>();
		list = sqlSessionTemplate.selectList("ProjectCate_sub1"); // ����
		lists.add(list);
		// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //������
		return list;
	}

	// ������Ʈ ã�� : ī�װ� ������
	public List<Map<String, Object>> getProjectFind2() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<Object> lists = new ArrayList<Object>();
		list = sqlSessionTemplate.selectList("ProjectCate_sub2"); // ����
		lists.add(list);
		// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //������
		return list;
	}

	// ������Ʈ ã�� : �˻����
	public List<Map<String, Object>> getProjectseach() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<Object> lists = new ArrayList<Object>();
		list = sqlSessionTemplate.selectList("Pro_seach"); // ����
		lists.add(list);
		// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //������
		return list;
	}

	// ������Ʈ ã�� : ī�װ� ������
	public Map<String, Object> getProAll(int pagenum) {
		Map<String, Object> map1 = new HashMap<>();
		map1.put("pagenumber", pagenum);
		map1.put("pagecount", 10);
		sqlSessionTemplate.selectOne("test", map1); // ����
		logger.info(map1);
		// list = sqlSessionTemplate.selectList("ProjectCate_main2"); //������
		return map1;
	}
	
	public List<Map<String,Object>> getState (Map<String,Object> pMap){
		list = sqlSessionTemplate.selectList("getStateProjectClient", pMap);
		return list;
	}
	// ������Ʈ �󼼺���
    public Map<String, Object>  ProjectView(int pro_no) {
       Map<String, Object> map = new HashMap<>();
       map.put("pro_no", pro_no);
       map = sqlSessionTemplate.selectOne("ProjectView", map);
       return map;
    }
    
    public List<Map<String,Object>> projectList(Map<String,Object> pMap){
    	list = sqlSessionTemplate.selectList("ProjectPagination", pMap);
    	return list;
    }

	public void projectAttention(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("projectsupport", pMap);
	}

	public void projectcancel(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("projectsupportDelete", pMap);
	}

	public void deleteProject(int pro_no) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("deleteProject", pro_no);
	}
	 /***************************************
     * @author 지원 목록 및 지원명단
     ***************************************/
    //지원 목록
    public List<Map<String, Object>> Project_JList() {
      List<Map<String, Object>> list = new ArrayList<>();
      List<Object> lists = new ArrayList<Object>();
      //list = sqlSessionTemplate.selectList("Project_JList"); // 지원목록
      lists.add(list);
      return list;
   }
    /**********수정 20181017 시작*******/
   public List<Map<String,Object>> projectSupportUser(int c_no){
	   list = sqlSessionTemplate.selectList("projectSupportUser", c_no);
	   return list;
   }
   
   public void stateChange(Map<String,Object> pMap) {
	   logger.info(pMap);
	   sqlSessionTemplate.update("stateChange", pMap);
   }
   /**********수정 20181017 끝*******/
   
   /**********수정 20181018 시작*******/
   public Map<String,Object> getHistory(int c_no){
	  Map<String,Object> map = new HashMap<>();
	  map = sqlSessionTemplate.selectOne("getHistory", c_no);
	  return map;
   }
   /**********수정 20181018 끝*******/
   
}

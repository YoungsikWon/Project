package com.java.finish;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class InsertDAO {
	DBConnection dbcon = new DBConnection();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public int userInsert(HashMap<String,Object> userInfo) {
		System.out.println("insert문 호출");
		int result = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO users VALUES (seq_users_code.nextval,?,?,?,?)");
		try {
			con = dbcon.getConnection();
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++i, (String)userInfo.get("id"));
			pstmt.setString(++i, (String)userInfo.get("pw"));
			pstmt.setString(++i, (String)userInfo.get("name"));
			pstmt.setString(++i, (String)userInfo.get("msg"));
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLIntegrityConstraintViolationException e) {
			JOptionPane.showMessageDialog(new JFrame(), e.toString(), "ERROR", JOptionPane.ERROR_MESSAGE);
		} catch (Exception e){
			JOptionPane.showMessageDialog(new JFrame(), e.toString(), "ERROR", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
	public static void main(String[] args) {
		HashMap<String, Object> userInfo = new HashMap<>();
		userInfo.put("code", 7);
		userInfo.put("id", "a");
		userInfo.put("pw", "b");
		userInfo.put("name", "c");
		userInfo.put("msg", "d");
		new InsertDAO().userInsert(userInfo);
	}
}

package com.java.finish;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class UpdateDAO{
	DBConnection dbcon = new DBConnection();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public int userUpdate(HashMap<String, Object> userInfo) {
		System.out.println("update문 호출");
		int result = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE users SET id=?, pw=?, name=?, msg=?  WHERE code =?");
		try {
			int i =0;
			con = dbcon.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++i, (String)userInfo.get("id"));
			pstmt.setString(++i, (String)userInfo.get("pw"));
			pstmt.setString(++i, (String)userInfo.get("name"));
			pstmt.setString(++i, (String)userInfo.get("msg"));
			pstmt.setInt(++i, (int)userInfo.get("code"));
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(new JFrame(), e.toString(), "ERROR", JOptionPane.ERROR_MESSAGE);
		} catch (Exception e) {
			JOptionPane.showMessageDialog(new JFrame(), e.toString(), "ERROR", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
  /*public static void main(String[] args) {
		HashMap<String, Object> userInfo = new HashMap<>();
		userInfo.put("code", 1);
		userInfo.put("id", "a");
		userInfo.put("pw", "a");
		userInfo.put("name", "a");
		userInfo.put("msg", "a");
		new UpdateDAO().userUpdate(userInfo);
	}*/
}

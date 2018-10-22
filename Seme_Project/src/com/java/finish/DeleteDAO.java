package com.java.finish;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class DeleteDAO {
	DBConnection dbcon = new DBConnection();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	public int userDelete(ArrayList<Integer> rows) {
		System.out.println("delete문 호출 성공");
		int result = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM users WHERE code IN (");
		for (int i = 0; i < rows.size(); i++) {
			sql.append(rows.get(i));
			if(i == rows.size() -1) {
				sql.append(")");
				break;
			}
			sql.append(",");
		}
		try {
			con = dbcon.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			JOptionPane.showMessageDialog(new JFrame(), e.toString(), "ERROR", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}
	/*public static void main(String[] args) {
		ArrayList<Integer> rows = new ArrayList<>();
		rows.add(1);
		rows.add(2);
		rows.add(3);
		new DeleteDAO().userDelete(rows);
	}*/
}

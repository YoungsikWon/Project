package com.java.finish;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SelectDAO {
	DBConnection dbcon = new DBConnection();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	ArrayList<HashMap<String, Object>> rows;
	HashMap<String, Object> row;

	public ArrayList<HashMap<String, Object>> selectALL() {
		try {
			rows = new ArrayList<HashMap<String, Object>>();
			con = dbcon.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM users");
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				row = new HashMap<String, Object>();
				row.put("code", rs.getString(1));
				row.put("id", rs.getString(2));
				row.put("pw", rs.getString(3));
				row.put("name", rs.getString(4));
				row.put("msg", rs.getString(5));
				rows.add(row);
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(new JFrame(), e.toString(), "ERROR", JOptionPane.ERROR_MESSAGE);
		}
		return rows;
	}

	public HashMap<String, Object> selectOne(int code) {
		try {
			row = new HashMap<String, Object>();
			con = dbcon.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM users WHERE code=" + code);
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				row.put("code", rs.getString(1));
				row.put("id", rs.getString(2));
				row.put("pw", rs.getString(3));
				row.put("name", rs.getString(4));
				row.put("msg", rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(new JFrame(), e.toString(), "ERROR", JOptionPane.ERROR_MESSAGE);
		}
		return row;
	}

	public int selectOneCode(String id, String pw) {
		int result = 0;
		try {
			row = new HashMap<String, Object>();
			con = dbcon.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM users WHERE id=? AND pw=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				row.put("code", rs.getString(1));
				row.put("id", rs.getString(2));
				row.put("pw", rs.getString(3));
				row.put("name", rs.getString(4));
				row.put("msg", rs.getString(5));
			}
			result = Integer.parseInt((String) row.get("code"));
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(new JFrame(), e.toString(), "ERROR", JOptionPane.ERROR_MESSAGE);
		}
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectNames(String name) {
		ArrayList<HashMap<String, Object>> rows = new ArrayList<>();
		HashMap<String, Object> row = new HashMap<>();
		try {
			con = dbcon.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM users WHERE name LIKE '%" + name + "%'");
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				row = new HashMap<String, Object>();
				row.put("code", rs.getString(1));
				row.put("id", rs.getString(2));
				row.put("pw", rs.getString(3));
				row.put("name", rs.getString(4));
				row.put("msg", rs.getString(5));
				rows.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(new JFrame(), e.toString(), "ERROR", JOptionPane.ERROR_MESSAGE);
		}
		return rows;
	}
	/*
	 * public static void main(String[] args) { new SelectDAO().selectOne(1); }
	 */
}

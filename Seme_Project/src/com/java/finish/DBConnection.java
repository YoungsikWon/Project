package com.java.finish;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public final String _URL  = "jdbc:oracle:thin:@192.168.0.221:1521:ORCL11";
	public final String _USER = "king";
	public final String _PW   = "1111";
	Connection con;	
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(_URL, _USER, _PW);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
			System.out.println("드라이버 클래스를 찾을 수 없습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("오라클 서버에 커넥션 실패!!!!!!!");
		}
		return con;
	}
}

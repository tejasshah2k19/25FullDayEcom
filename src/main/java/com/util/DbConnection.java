package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	public static Connection getConnection() {

		String url = "jdbc:mysql://localhost:3306/25fulldayecom";
		String userName = "root";
		String password = "root";
		// db connection
		Connection con = null;

		try {
			// step 1
			Class.forName("com.mysql.cj.jdbc.Driver");
			// step 2
			con = DriverManager.getConnection(url, userName, password);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
}

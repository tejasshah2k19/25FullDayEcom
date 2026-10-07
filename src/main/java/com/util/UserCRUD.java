package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class UserCRUD {

	Connection getConnection() {

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

	void addUser(String firstName,String lastName,String email,String password,String role) {
		// insert
		String insertQuery = "insert into users (firstName,lastName,email,password,role) values (?,?,?,?,?)";


		// insert into users (
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(insertQuery);

			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, email);
			pstmt.setString(4, password);
			pstmt.setString(5, role);

			int record = pstmt.executeUpdate(); // return int value

			System.out.println(record + " record inserted.....");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	void deleteUser(int userId) {
		String deleteQuery = "delete from users where userId = ?";
		try {

			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(deleteQuery);
			pstmt.setInt(1, userId);
			int record = pstmt.executeUpdate();
			System.out.println(record + " deleted....");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	void updateUser(int userId, String firstName, String lastName) {

		try {
			String updateQuery = "update users set firstName = ? , lastName = ? where userId = ? ";
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(updateQuery);
			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setInt(3, userId);

			int record = pstmt.executeUpdate();
			System.out.println(record + " updated......");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		Scanner scr = new Scanner(System.in);

		UserCRUD crud = new UserCRUD();
		// menu
		
		String firstName ,lastName,email,password,role;
		int userId; 

		while (true) {
			System.out.println("1 For Add New User\n2 For Delete User\n3 For Modify User");
			System.out.println("0 For Exit");
			System.out.println("Enter Your choice");

			int choice = scr.nextInt();

			switch (choice) {
			case 1:
				System.out.println("Enter FirstName");
				firstName = scr.next();
				System.out.println("Enter LastName");
				lastName = scr.next();
				System.out.println("Enter Email and Password");
				email =scr.next();
				password =scr.next() ; 
				role = "USER";
				
				crud.addUser(firstName,lastName,email,password,role);
				break;
			case 2:
				System.out.println("Enter  the userID ");
				userId = scr.nextInt();
				crud.deleteUser(userId);
				break;
			case 3:
				System.out.println("Enter  the userID ");
				userId = scr.nextInt();
				System.out.println("Enter FirstName");
				firstName = scr.next();
				System.out.println("Enter LastName");
				lastName = scr.next();
				crud.updateUser(userId,firstName, lastName);
				break;
			case 0:
				System.exit(0);
			default:
				System.out.println("Invalid Choice PTA !! ");

			}
		}

	}
}

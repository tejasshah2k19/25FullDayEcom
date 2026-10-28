package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from users where email = ? and password = ?");
			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				//success 
				String role = rs.getString("role");
				int userId = rs.getInt("userId"); 
				
				HttpSession session =  request.getSession();
				session.setAttribute("userId", userId);
				
				if(role.equals("ADMIN")) {
					//admin 
				}else if(role.equals("USER")) {
					//user
					//
				}else {
					//login 
					//	
				}
				System.out.println("success");
			}else {
				//
				System.out.println("fail");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

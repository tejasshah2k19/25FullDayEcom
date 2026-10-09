package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DbConnection;

@WebServlet("/DeleteUserController")
public class DeleteUserController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String deleteQuery = "delete from users where userId = ?";

		int userId = Integer.parseInt(request.getParameter("userId"));
	
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(deleteQuery);
			pstmt.setInt(1, userId);
			int records = pstmt.executeUpdate();
			System.out.println(records+" are deleted....");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("ListUserController");
		
	}

}

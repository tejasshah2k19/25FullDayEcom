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

@WebServlet("/UpdateUserController")
public class UpdateUserController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userId = Integer.parseInt(request.getParameter("userId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");

		try {
				String updateQuery = "update users set firstName = ? , lastName = ? where userId = ? ";
				Connection con = DbConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(updateQuery); 
				pstmt.setString(1, firstName);
				pstmt.setString(2, lastName);
				pstmt.setInt(3, userId);
				
				int record = pstmt.executeUpdate();
				System.out.println(record+" are updated....");
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("index.jsp");
	}
}

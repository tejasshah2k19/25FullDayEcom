package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DbConnection;

@WebServlet("/EditUserController")
public class EditUserController  extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId = Integer.parseInt( request.getParameter("userId"));
		
		//select * from users where userId = ? 
		
		try {
				Connection con = DbConnection.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement("select * from users where userId = ?");
				pstmt.setInt(1, userId);
				
				//executeUpdate() -> insert update delete
				//executeQuery()  -> select 
				ResultSet rs = pstmt.executeQuery(); 
				
				rs.next(); 
				
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName"); 
				
				request.setAttribute("firstName", firstName);
				request.setAttribute("lastName", lastName);
				request.setAttribute("userId", userId);
				
				
		}catch (Exception e) {
			e.printStackTrace();
		}

		
		RequestDispatcher rd = request.getRequestDispatcher("UpdateUser.jsp");
		rd.forward(request, response);
		
		
	}
}

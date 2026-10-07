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

@WebServlet("/AddUserController")
public class AddUserController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// read -> getParameter
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		// validation

		String insertQuery = "insert into users (firstName,lastName,email,password,role) values (?,?,?,?,?)";

		// insert into users (
		try {
			Connection con = DbConnection.getConnection();

			PreparedStatement pstmt = con.prepareStatement(insertQuery);

			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, email);
			pstmt.setString(4, password);
			pstmt.setString(5, role);

			int record = pstmt.executeUpdate(); // return int value

			System.out.println(record + " record inserted.....");

			// redirect
		} catch (Exception e) {
			e.printStackTrace();
		}

		// redirect
		response.sendRedirect("index.jsp");
	}
}

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

import com.util.DbConnection;

@WebServlet("/ListUserController")
public class ListUserController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from users");

			// db state -> executeUpdate();
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) { // jump to the first record

				int userId = rs.getInt("userId");
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				String email = rs.getString("email");
				String role = rs.getString("role");
				System.out.println(userId + " " + firstName + " " + lastName + " " + email + " " + role);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

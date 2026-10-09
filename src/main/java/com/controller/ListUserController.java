package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.UserBean;
import com.util.DbConnection;

@WebServlet("/ListUserController")
public class ListUserController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<UserBean> users = new ArrayList<UserBean>();

		try {

			Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from users");

			// db state -> executeUpdate();
			ResultSet rs = pstmt.executeQuery();
			//select -> 5 row -> 5 col 
			//25 records -> data 

			while (rs.next()) { // jump to the first record

				int userId = rs.getInt("userId");
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				String email = rs.getString("email");
				String role = rs.getString("role");
				System.out.println(userId + " " + firstName + " " + lastName + " " + email + " " + role);
		
				UserBean userBean = new UserBean();
				userBean.setUserId(userId);
				userBean.setFirstName(firstName);
				userBean.setLastName(lastName);
				userBean.setEmail(email);
				userBean.setRole(role);
		
				users.add(userBean);
			
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("users", users);
		RequestDispatcher rd = request.getRequestDispatcher("ListUser.jsp");
		rd.forward(request, response);
	}
}

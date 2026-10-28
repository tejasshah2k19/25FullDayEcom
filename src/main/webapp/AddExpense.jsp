<%@page import="com.bean.AccountBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	AccountDao dao = new AccountDao();
	ArrayList<AccountBean> listOfAccounts = dao.getAllAccounts();
	%>

	<form>
		Title : <input type="text" name="title" /><br>
		<Br> Amount : <input type="text" name="amount" /><br>
		<Br> Account : <select name="account">
			<option>Select Account</option>
			<%for(AccountBean bean:listOfAccounts) {%>
				<option><%=bean.getAccountName()%></option>
			<%} %>		
			
		</select><br>
		<BR> Vendor : <select name="vendor">
			<option>Select Vendor</option>
		</select> <br>
		<br>Date : <input type="date" name="date" /><br>
		<br> Description :
		<textarea name="description"></textarea>
		<br>
		<br> <input type="submit" value="Add Expense" />

	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="UpdateUserController" method="post">
	
	UserId: <input type="Text" name="userId" /><br><br> 
	FirstName: <input type="Text" name="firstName" /><br><br>
	LastName: 	<input type="Text" name="lastName" /><br><br>

	<input type="submit" value="Update"/>

</form>

</body>
</html>
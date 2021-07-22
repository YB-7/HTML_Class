<%@page import="co.yedam.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="co.yedam.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userList.jsp</title>
</head>
<body>
	<%
		UserDAO dao = new UserDAO();
		List<UserVO> list = dao.getUsers();
		// id, name, gen, hobby, birth
		out.println("<table border='1'>");
		out.println("<caption>회원목록</caption>");
		out.println("<tr>");
		out.println("<th>ID</th>");
		out.println("<th>Name</th>");
		out.println("<th>Gender</th>");
		out.println("<th>Hobby</th>");
		out.println("<th>Birth</th>");
		out.println("</tr>");
	
		for (UserVO vo : list) {
			out.println("<tr>");
			out.println("<td>" + vo.getUserId() + "</td>");
			out.println("<td>" + vo.getUserName() + "</td>");
			out.println("<td>" + vo.getUserGen() + "</td>");
			out.println("<td>" + vo.getUserHobby() + "</td>");
			out.println("<td><input type='date' value='" + vo.getUserBirth() + "'></td>");
			out.println("</tr>");
		}
		out.println("</table>");
	%>
</body>
</html>
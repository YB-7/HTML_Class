<%@page import="co.yedam.UserVO"%>
<%@page import="co.yedam.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register.jsp</title>
</head>
<body>
	<%
		String uId = request.getParameter("user_id");
		String uPw = request.getParameter("user_pw");
		String uName = request.getParameter("user_name");
		String uGen = request.getParameter("user_gen");
		String uHobby = request.getParameter("user_hobby");
		String uBirth = request.getParameter("user_birth");
	
		UserVO vo = new UserVO();
		vo.setUserId(uId);
		vo.setUserPw(uPw);
		vo.setUserName(uName);
		vo.setUserGen(uGen);
		vo.setUserHobby(uHobby);
		vo.setUserBirth(uBirth);
	
		UserDAO dao = new UserDAO();
		dao.insertUser(vo);
	%>
</body>
</html>
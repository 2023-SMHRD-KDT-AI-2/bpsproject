<%@page import="java.util.ArrayList"%>
<%@page import="com.moon.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="assetsBoard/css/main.css" />
		<link rel="stylesheet" href="assetsBoard/css/board.css" />
		
</head>
<body>		
	
			<div id="message">
			<%	
				messageDAO dao = new messageDAO();
				ArrayList<message> msger = new ArrayList<>();
				msger = dao.msglist("name");
				
				// jstl 방식
				session.setAttribute("msger", msger);   
			%>
			
				<table id = "msglist">
					<tr>
						
						<td>제목</td>
						<td>작성자</td>
						<td>시간</td>
					</tr>
					
				<c:forEach var="msger" items="${msger}" varStatus="string">
					<tr>
						
						<td>${msger.sender}</td>
						<td>${msger.receiver}</td>
						<td>${msger.content}</td>
					</tr>
				</c:forEach>	
				
			</div>


			<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>
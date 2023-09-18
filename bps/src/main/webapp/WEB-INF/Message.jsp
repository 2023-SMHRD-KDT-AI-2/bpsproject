<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.lang.ProcessHandle.Info"%>
<%@page import="com.moon.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
</head>
<body>

<% String name = (String) session.getAttribute("name"); %>

	<div>
		<form action="SendMessage" method="POST">
			<input type="hidden" name="sender"
				id="sender" placeholder="보내는 사람 이름" value="<%= name %>"/>
	</div>
	<div>
		<label for="name">받는사람</label> <input type="text"
				name="receiver" id="receiver" placeholder="받는 사람 이름" />
	</div>
	<div>
		<label for="message">Message</label>
			<textarea name="content" id="content" rows="6"></textarea>
	</div>
	<input type="submit" value="보내기" class="btn btn-primary">
	</form>



	<%
	messageDAO dao = new messageDAO();

	// 로그인 된 회원의 정보를 가져오기 위한 작업!
	userInfo info = (userInfo) session.getAttribute("info");
	ArrayList<message> list = new ArrayList<>();

	// 로그인이 되어있는 상태인지 확인하기
	if (info != null) {
		// 회원의 정보를 토대로 입력된 메세지 내용 가져오기!
		list = dao.msglist(name);
		session.setAttribute("msglist", list);
	}
	%>
	<table>
	메세지목록
		<tr>
			<td>번호</td>
			<td>보낸사람</td>
			<td>내용</td>
			<td>날짜</td>
		</tr>

		<%-- 	<% // 로그인 된 회원의 정보를 가져오기 위한 작업!
									for(int i=0; i<list.size(); i++){%>
										<tr>
											<td><%=i+1 %></td>
											<td><%=list.get(i).getSendName() %></td>
											<td><%=list.get(i).getMessage() %></td>
											<td><%=list.get(i).getM_date() %></td>
										</tr>
									<%}%>--%>
		<c:forEach var="msg" items="${msglist}" varStatus="status">
			<tr>
				<td>${msg.sender}</td>
				<!-- 보낸 사람 -->
				<td>${msg.receiver}</td>
				<!-- 내용 -->
				<td>${msg.content}</td>
				<!-- 날짜 -->
				<td><button></button> </td>
				<!-- 눌렀을때, - sender or reciever가 입력된 id인경우의 전체 채팅 목록이 나오고 메세지 보낼 수 있어야함 -->
				<!-- 창 열고 보여주기? -->
				
				
			</tr>
		</c:forEach>
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>
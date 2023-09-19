<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.moon.model.carInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.moon.model.*"%>
<%@ page import="com.moon.model.carInfo"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<title>내 차량 대여 현황</title>
<style>
body {
	text-align: center;
}

.center {
	display: flex;
	justify-content: center;
	float: right;
	margin-bottom: 3%;
}

img {
	width: 100px;
}

.textbox {
	width: 240px;
	height: 40px;
	border-top: 0.1px solid #fff;
	border-left: 0.1px solid #fff;
	border-bottom: 0.1px solid #213573;
}

.sub {
	width: 50px;
	background-color: #213573;
	color: #fff;
	font-weight: bold;
	border: #213573;
}

div {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
}

table {
	width: 700px;
}

td {
	border-bottom: 0.1px solid #e3e6f0;
}

.last {
	border-bottom: #fff;
	text-align: center;
}

.boad {
	border-right: 0.1px solid #e3e6f0;
}

.ta {
	border-right: #fff;
}

.font {
	font-size: 20px;
	font-weight: bold;
}

.high {
	height: 36px;
}
</style>
</head>
<body>
<%
			request.setCharacterEncoding("UTF-8");
				
			String searchParameter = (String) request.getParameter("car");
			String company = (String) request.getParameter("company");
			String name = (String) request.getParameter("name");
			
%>
	<div class="center">
		<div>
	<form action="GoCompCarList?company=<%=company %>&car=<%=searchParameter %>" method="get">
			<input class="textbox" type="text" name="car"
				placeholder="검색어 입력">
			<button class="sub">
				<i class="fa fa-search" aria-hidden="true"></i>
			</button>
	</form>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	<table>
		<%
			request.setCharacterEncoding("UTF-8");
				
			
		
	
			
			carInfoDAO cdao = new carInfoDAO();
			carInfo info = new carInfo();
			ArrayList<carInfo> list = new ArrayList<>();
		
				
			if (searchParameter == null){
				info.setCompNum(company);
				info.setName(name);
				list = cdao.show_usingcar(info);
				
			} else {
			
				info.setCompNum(company);
				info.setCarName(searchParameter);

				list = cdao.search_comcar(info);
			}
		
				
			session.setAttribute("list", list);
		%>


			<tr class="font">
			<td>차량명</td>
			<td>회사명</td>
			<td>차량번호</td>
		</tr>

		<c:forEach var="list" items="${list}" varStatus="status">

			<tr>
				<td>${list.carName}</td>
				<td class="boad">${list.manufac}</td>
				<td>${list.carNum}</td>
				<td>
					<button onclick="setParentText()"
						id="dInput${status.index+1}" class="select sub high put"
						value="${list.carNum}">
						선택
					</button>
				</td>
			</tr>
		</c:forEach>


	</table>

	<script src="vendor/jquery/jquery.js"></script>
	
	<script>
		const select = $(".select").length;
		
		for (let i = 1; i <= select; i++){
			$("#dInput"+i).click(function() {
				opener.document.getElementById("dInput").value = document
						.getElementById("dInput"+i).value
			window.close();
			})
		}

	
	</script>
</body>
</html>
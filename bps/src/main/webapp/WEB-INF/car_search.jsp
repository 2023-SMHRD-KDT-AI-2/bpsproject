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

<title>회사 정보 검색</title>
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
	<div class="center">
		<div>
	<form action="goCarList" method="get">
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
				
			String searchParameter = request.getParameter("car");
				
			carInfoDAO cdao = new carInfoDAO();
				
			ArrayList<carInfo> list = new ArrayList<>();
			if (searchParameter == null){
				list = cdao.showcar();
			} else {
				list = cdao.searchcar(searchParameter);
				list.addAll(cdao.searchManufacturer(searchParameter));
			}
				
			session.setAttribute("list", list);
		%>


		<tr class="font">
			<td>차량명</td>
			<td>회사명</td>
			<td></td>
		</tr>

		<c:forEach var="list" items="${list}" varStatus="status">

			<tr>
				<td>${list.carName}</td>
				<td class="boad">${list.manufac}</td>
				<td>
					<button onclick="setParentText()"
						id="cInput2${status.index+1}" class="select sub high put"
						value="${list.manufac}§${list.carName}">
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
			$("#cInput2"+i).click(function() {
				opener.document.getElementById("pInput1").value = document.getElementById("cInput2"+i).value.split("§")[0];
				opener.document.getElementById("pInput2").value = document.getElementById("cInput2"+i).value.split("§")[1];
			
			window.close();
			})
		}

	
	</script>
</body>
</html>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.moon.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin 회원관리</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<style>
.bold {
	font-weight: bold;
	font-size: large;
}
</style>
</head>

<body>
	<div class="container-xxl position-relative bg-white d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<!-- Sidebar Start -->

		<!--작은창-->
		<%
		String name = (String) session.getAttribute("name");
		String admin = (String) session.getAttribute("admin");
		String logo = (String) session.getAttribute("logo");
		String compName = (String) session.getAttribute("compName");
		String email = (String) session.getAttribute("email");
		String phone = (String) session.getAttribute("phone");
		String date = (String) session.getAttribute("date");
		String pass = (String) session.getAttribute("pass");
		String compNum = (String) session.getAttribute("compNum");
		String depart = (String) session.getAttribute("depart");
		String position = (String) session.getAttribute("position");

		//	PrintWriter out1 = response.getWriter();
		//	out1.print(date);
		//	out1.print(name);
		%>
		<!--작은창-->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-light navbar-light">
				 <a href="goMain" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><%=compName %></h3>
                </a>
				<div class="d-flex align-items-center ms-4 mb-4">
 				
					<%
					if (admin != null) {
					%>


					<div class="position-relative">
						<img class="rounded-circle" src="file/<%=logo%>" alt=""
							style="width: 40px; height: 40px;">
						<div
							class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
						</div>
					</div>
					<div class="ms-3">
						<h6 class="mb-0"><%=name%></h6>
						<span>admin</span>
					</div>
					<%
					} else {
					%>
					<div class="position-relative">
						<img class="rounded-circle" src="file/<%=logo%>" alt=""
							style="width: 40px; height: 40px;">
						<div
							class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
						</div>
					</div>
					<div class="ms-3">
						<h6 class="mb-0"><%=name%></h6>
						<span><%=depart%></span> <span><%=position%></span>
					</div>
					<%
					}
					%>
				</div>
				<div class="navbar-nav w-100">
					<a href="goMain" class="nav-item nav-link "><i
						class="fa fa-tachometer-alt me-2"></i>Dashboard</a> <a
						href="goAttendStatus" class="nav-item nav-link "><i
						class="fa fa-tachometer-alt me-2"></i>근태 관리</a>
<a href="goFileDrive" class="nav-item nav-link "><i
                            class="fa fa-tachometer-alt me-2"></i>FILE-DRIVE</a>
                    <a href="goCarReserv" class="nav-item nav-link"><i
                            class="fa fa-tachometer-alt me-2"></i>차량신청</a>            
					<%
					if (admin != null) {
					%>
					<a href="goAdmin" class="nav-item nav-link"><i
						class="fa fa-tachometer-alt me-2 "></i>관리자 페이지</a>
					<%
					}
					%>


				</div>
			</nav>
		</div>
		<!-- Sidebar End -->


		<!-- Content Start -->
		<div class="content">
			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
				<h2 class="text-primary mb-0">
					<a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
						<i class="fa fa-hashtag"></i>

					</a>
				</h2>
				<a href="#" class="sidebar-toggler flex-shrink-0"> <i
					class="fa fa-bars"></i>
				</a>
				<form class="d-none d-md-flex ms-4">
					<input class="form-control border-0" type="search"
						placeholder="Search">
				</form>
				<div class="navbar-nav align-items-center ms-auto">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa fa-envelope me-lg-2"></i>
							<span class="d-none d-lg-inline-flex">Message</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item"> </a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item"> </a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item"> </a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item text-center">See all message</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa fa-bell me-lg-2"></i>
							<span class="d-none d-lg-inline-flex">Notificatin</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">Profile updated</h6> <small>15
									minutes ago</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">New user added</h6> <small>15
									minutes ago</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">Password changed</h6> <small>15
									minutes ago</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item text-center">See all
								notifications</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <img
							class="rounded-circle me-lg-2" src="img/user.jpg" alt=""
							style="width: 40px; height: 40px;"> <span
							class="d-none d-lg-inline-flex"><%=name%></span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item">My Profile</a> <a href="#"
								class="dropdown-item">Settings</a> <a href="#"
								class="dropdown-item">Log Out</a>
						</div>
					</div>
				</div>
			</nav>
			<!-- Navbar End -->


			<!-- Sale & Revenue Start -->
			<div class="container-fluid pt-4 px-4">
				<div id="menuarea" class="row g-4">

					<header class="n-section-title">
						<h1 class="tit">My Profile</h1>

					</header>
					<form name="join_form" action="profileUpdate" method="post">
						<section class="">

							<table class="table n-table table-row my-info-modify ">

								<colgroup>
									<col style="width: 190px">
									<col style="width: *">
									<col style="width: 50%">
								</colgroup>
								<tbody>
									<tr></tr>


									<%
									request.setCharacterEncoding("UTF-8");

									UserInfoDAO dao = new UserInfoDAO();
									userInfo info = new userInfo();

									ArrayList<login> lists = new ArrayList<>();
									lists = dao.user_id2(email.split("@")[0]);

									session.setAttribute("lists", lists);
									%>

									<c:forEach var="lists" items="${lists}" varStatus="status">

										<tr>
											<th scope="row" class="bold">아이디</th>


											<td colspan="2" class="bold" id="id">${lists.email.split("@")[0]}</td>

											<td></td>


										</tr>

										<tr id="password-area">
											<th scope="row" class="bold">비밀번호</th>
											<td colspan="2" class="bold" id='pw'>********</td>

											<td><button type="button"
													class="n-btn w100 btn-sm btn-default cert-hidden"
													onclick="changepw()" id="">비밀번호변경</button></td>
										</tr>


										<tr id="change-pass" style="display: none;">
											<th scope="row" class="bold">비밀번호</th>
											<td colspan="2" class="bold">
												<div class="input">
													<label for="password">현재 비밀번호</label> <input
														type= "password" id="nowpass">

												</div>
												<input type = "hidden" id="conpw" value ="${lists.pw}">
												
												<div id="id_div"></div> <br>
												<div class="input">
													<label for="password">신규 비밀번호</label> <input
														type="password" id="newPass" name="newPass">

												</div> <br>
												<div class="input">
													<label for="password">비밀번호 확인</label> <input
														type="password" id="c_newPass" name="">

												</div>
											<div id ="id_div2"></div>

											</td>
											<td><div>
													<button type="button"
														class="n-btn w100 btn-sm btn-default cert-hidden"
														onclick="change2()" id="confirm">확인</button>
												</div> <br>
												<div>
													<button type="button"
														class="n-btn w100 btn-sm btn-default cert-hidden"
														onclick="changepw2()" id="cancel">취소</button>
												</div></td>


										</tr>




										<tr>
											<th scope="row" class="bold">이름</th>


											<td colspan="2" id="name" class="bold">${lists.name}</td>

											<td><button type="button"
													class="n-btn w100 btn-sm btn-default cert-hidden"
													onclick="change1()" id="nameChange">이름변경</button></td>


										</tr>

										<tr>
											<th scope="row" class="bold">이메일</th>


											<td colspan="2" id="email1" class="bold">${lists.email}</td>

											<td>
												<!--  <button type="button"
													class="n-btn w100 btn-sm btn-default cert-hidden"
													onclick="change2()" id="emailChange">이메일변경</button>-->
											</td>


										</tr>

										<tr>
											<th scope="row" class="bold">휴대전화</th>


											<td colspan="2" id="phone" class="bold">${lists.phone}</td>

											<td><button type="button"
													class="n-btn w100 btn-sm btn-default cert-hidden"
													onclick="change3()" id="phoneChange">휴대전화변경</button></td>


										</tr>




										<tr>
											<th scope="row" class="bold">부서</th>

											<%
											if (depart == null) {
											%>
											<td colspan="2"><strong>임시부서</strong></td>
											<%
											} else {
											%>
											<td colspan="2"><strong>${lists.depart}</strong></td>

											<%
											}
											%>
											<td></td>


										</tr>

										<tr>
											<th scope="row" class="bold">직급</th>

											<%
											if (position == null) {
											%>
											<td colspan="2"><strong>임시직급</strong></td>
											<%
											} else {
											%>
											<td colspan="2"><strong>${lists.position}</strong></td>
											<%
											}
											%>

											<td></td>


										</tr>

										<tr>
											<th scope="row" class="bold">입사일</th>

											<%
											if (date == null) {
											%>
											<td colspan="2"><strong>임시직급</strong></td>
											<%
											} else {
											%>
											<td colspan="2"><strong>${lists.sign_date.substring(2,10)}</strong></td>
											<%
											}
											%>

											<td></td>


										</tr>


									</c:forEach>

								</tbody>
							</table>
							<ul class="n-info-txt"></ul>
						</section>

					</form>


					<a href="#"
						class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
						class="bi bi-arrow-up"></i></a>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script>
	// 이름 변경
		function change1() {

			var change = document.getElementById("nameChange"); //이름변경 버튼
			var name = document.getElementById("name"); // 이름 칸에 있는 값
			var id = document.getElementById("id"); //아이디 확인을 위해 호출

			var emailIn = $('#email1').text();
			var idIn = $('#id').text();
			var nameIn = $('#name').text();

			console.log(idIn);
			console.log(emailIn);
			console.log(nameIn);
			if ($('#inName').val() == "") {
				alert("이름을 입력해주세요");

				return false;
			}

			if ($('#nameChange').html() == '이름변경') {
				$('#nameChange').html('확인');
				name.innerHTML = "<input type='text' name='inputName' value='' id='inName'>"
				$('input[name=inputName]').attr('value', nameIn);

			} else {
				$('#nameChange').html('이름변경');
				name = $('#inName').val();

				name.innerHTML = "<input type='text' name='inputName' value='' id='inName'>"
				$('input[name=inputName]').attr('value', name);
				id.innerHTML = "<input type='hidden' name='inputId' value =''>"
				$('input[name=inputId]').attr('value', idIn);

				document.join_form.submit();

				$('#name').html = name;
			
			}

		}
	
	
			
	
	
	
	

	//전화번호 변경
		function change3() {

			var change = document.getElementById("phoneChange");
			var phone = document.getElementById("phone");
			var id = document.getElementById("id"); //아이디 확인을 위해 호출

			var phoneIn = $('#phone').text();
			var idIn = $('#id').text();

			if ($('#inPhone').val() == "") {
				alert("휴대전화를 입력해주세요");

				return false;
			}

			if ($('#phoneChange').html() == '휴대전화변경') {
				$('#phoneChange').html('확인');
				phone.innerHTML = "<input type='text' name='inputPhone' value='' id='inPhone'>"
				$('input[name=inputPhone]').attr('value', phoneIn);

			} else {
				$('#phoneChange').html('휴대전화변경');
				let phone = $('#inPhone').val();

				phone.innerHTML = "<input type='text' name='inputPhone' value='' id='inPhone'>"
				$('input[name=inputPhone]').attr('value', phone);

				id.innerHTML = "<input type='hidden' name='inputId' value =''>"
				$('input[name=inputId]').attr('value', idIn);

				document.join_form.submit();

				phone.innerHTML = phone;

			}

		}

	
	//비밀번호 변경
		function changepw() {
			var pass = document.getElementById("password-area");
			var changepass = document.getElementById("change-pass");
			var confirm = document.getElementById("confirm");
			var cancel = document.getElementById("cancel");
			
			if (changepass.style.display = "none") {
				pass.style.display = "none";
				
				changepass.style.display = "";
				
			}else if(pass.style.display ="none"){
				changepass.style.display = "none";
				pass.style.display = "";
			}

		}
		
	//비밀번호 변경 입력받을 화면
		function changepw2() {
			var pass = document.getElementById("password-area");
			var changepass = document.getElementById("change-pass");
			var confirm = document.getElementById("confirm");
			var cancel = document.getElementById("cancel");
			
			if (pass.style.display = "none") {
				changepass.style.display = "none";
				
				pass.style.display = "";
				
			}else if(pass.style.display ="none"){
				changepass.style.display = "none";
				pass.style.display = "";
			}

		}
		
		

		function change2(){
			
			//var id = document.getElementById("id");
			//var pw = document.getElementById("id");
			
			
			var id = $('#id').text();
			var pw = $('#nowpass').val();
			var conpw = $('#conpw').val();
			console.log($('#conpw').val());
		
			
			$.ajax({
				url : "pwCheck",
				type : "get",
				data : { id: id,
					pw: pw},
				
				//dataType  success 했을 때 받아올 결과값의 자료형을 의미
				success : function(result) {
				
					if (result == 0) {
						$("#id_div").html('비밀번호를 확인해주세요.');
						$("#id_div").css('color', 'red');
						
						
						
					} else if (result == 1) {
						$("#id_div").html('비밀번호가 일치합니다');
						$("#id_div").css('color', 'green');
					
					}
				},
				error : function() {
					alert("서버요청실패");
				}
			})
			
			
			
			
			var pass = $("#newPass").val();
			var n_pass = $('#c_newPass').val();
			var idIn = document.getElementById("id");
			
			
			
			if(pw==conpw && pass == n_pass){
			idIn.innerHTML = "<input type='hidden' name='inputId' value =''>"
				$('input[name=inputId]').attr('value', id);
			
			
			$('input[name=newPass]').attr('value', pass);
			
			document.join_form.submit();
			
			}else if(pass != n_pass){
				$("#id_div2").html('비밀번호가 다릅니다.');
				$("#id_div2").css('color', 'red');
			}
			

		}

		
		

	</script>

	<script type="text/javascript">
		function formChange(obj) {
			obj.submit();
		}
	</script>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/chart/chart.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/tempusdominus/js/moment.min.js"></script>
	<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>


	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
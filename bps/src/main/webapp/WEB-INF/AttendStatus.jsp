<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.ons.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">
<title>근태 현황</title>
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

<!-- Calender font Stylesheet -->
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>

<!--Adding datatable style cdn-->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

<!--Adding jQuery cdn -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!--Adding datatable cdn-->
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

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
                        <img class="rounded-circle" src="file/<%=logo %>" alt="" style="width: 40px; height: 40px;">
                        <div
                            class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                        </div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0"><%=name %></h6>
                        <span>admin</span>
                    </div>
                	<%} else { %>
                	                    <div class="position-relative">
                        <img class="rounded-circle" src="file/<%=logo %>" alt="" style="width: 40px; height: 40px;">
                        <div
                            class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                        </div>
                    </div>
                	<div class="ms-3">
                        <h6 class="mb-0"><%=name %></h6>
                        <span><%=depart %></span>
                        <span><%=position %></span>
                    </div>
                	<%} %>
                </div>
                <div class="navbar-nav w-100">
                    <a href="goMain" class="nav-item nav-link"><i
                            class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <a href="goAttendStatus" class="nav-item nav-link active"><i
                            class="fa fa-tachometer-alt me-2"></i>근태 관리</a>       
                            
                    <%
                    if (admin != null) {
					%>
                    <a href="goAdmin" class="nav-item nav-link"><i
                            class="fa fa-tachometer-alt me-2"></i>관리자 페이지</a>
                    <%}%>
                    
                    
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


		<!-- Content Start -->
		<div class="content">
			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
				<a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<i class="fa fa-hashtag"></i>
					</h2>
				</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
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
							<a href="#" class="dropdown-item">
								<div class="d-flex align-items-center">
									<img class="rounded-circle" src="img/user.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="ms-2">
										<h6 class="fw-normal mb-0">Jhon send you a message</h6>
										<small>15 minutes ago</small>
									</div>
								</div>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<div class="d-flex align-items-center">
									<img class="rounded-circle" src="img/user.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="ms-2">
										<h6 class="fw-normal mb-0">Jhon send you a message</h6>
										<small>15 minutes ago</small>
									</div>
								</div>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<div class="d-flex align-items-center">
									<img class="rounded-circle" src="img/user.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="ms-2">
										<h6 class="fw-normal mb-0">Jhon send you a message</h6>
										<small>15 minutes ago</small>
									</div>
								</div>
							</a>
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
							class="d-none d-lg-inline-flex">John Doe</span>
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


			<!-- 근태현황 시작점 -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-12">
						<div class="bg-light rounded h-100 p-4">
							<div>
								<h5 class="mb-2 w-50">근태현황</h5>
								<hr>
							</div>
							<div>
								<h6 class="today"></h6>
								<h1 class="clock"></h1>
							</div>
							<div>
								<h6>출근시간 : 00:00</h6>
								<h6>퇴근시간 : 00:00</h6>
							</div>
							<div class="btn-commuting">
									<input 
										type="submit" id="btn-go-work" name="attend"
										class="btn btn-primary me-2" value="출근"
									> 
									<input
										type="submit" id="btn-go-home" name="attend"
										class="btn btn-primary me-2" value="퇴근"
									>
							</div>
						</div>
					</div>
					<!-- 근태현황 끝 지점 -->


					<!-- 근무시간 시작지점 -->
					<div class="col-sm-12 col-xl-12">
						<div class="bg-light rounded h-100 p-4">
							
							<div class = "col-md-4">
								<h5 class="mb-4">주간</h5>
								<p>크으</p>
							</div>
							<hr>


							<div class="row text-center mb-2">
								<div class="col-md-3">주 근로시간</div>
								<div class="col-md-3">누적 근로시간</div>
								<div class="col-md-3">잔여 근로시간</div>
								<div class="col-md-3">연장 근로시간</div>
								<div class="col-md-3">
									<h5>00h 00m</h5>
								</div>
								<div class="col-md-3">
									<h5>00h 00m</h5>
								</div>
								<div class="col-md-3">
									<h5>00h 00m</h5>
								</div>
								<div class="col-md-3">
									<h5>00h 00m</h5>
								</div>
							</div>

							<div class="progress mt-3">
								<div
									class="progress-bar progress-bar-striped progress-bar-animated"
									role="progressbar" aria-valuenow="75" aria-valuemin="0"
									aria-valuemax="100" style="width: 75%"></div>
							</div>
						</div>
					</div>

					<div class="col-sm-12 col-xl-12">
						<div class="bg-light rounded h-100 p-4">
							<h6 class="mb-4"></h6>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">일자(요일)</th>
											<th scope="col">09/10(월)</th>
											<th scope="col">09/11(화)</th>
											<th scope="col">09/12(수)</th>
											<th scope="col">09/13(목)</th>
											<th scope="col">09/14(금)</th>
											<th scope="col">09/15(토)</th>
											<th scope="col">09/16(일)</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">근무시간</th>
											<td>09:00</td>
											<td>09:00</td>
											<td>09:00</td>
											<td>09:00</td>
											<td>09:00</td>
											<td>09:00</td>
											<td>09:00</td>
										</tr>
										<tr>
											<th scope="row">연장근무시간</th>
											<td>02:00</td>
											<td>02:00</td>
											<td>02:00</td>
											<td>02:00</td>
											<td>02:00</td>
											<td>02:00</td>
										</tr>
										<tr>
											<th scope="row">총 근무시간</th>
											<td>11:00</td>
											<td>11:00</td>
											<td>11:00</td>
											<td>11:00</td>
											<td>11:00</td>
											<td>11:00</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>



					<!-- Footer Start -->
					<div class="container-fluid pt-4 px-4">
						<div class="bg-light rounded-top p-4">
							<div class="row">
								<div class="col-12 col-sm-6 text-center text-sm-start">
									&copy; <a href="#">Your Site Name</a>, All Right Reserved.
								</div>
								<div class="col-12 col-sm-6 text-center text-sm-end">
									<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
									Designed By <a href="https://htmlcodex.com">HTML Codex</a>
								</div>
							</div>
						</div>
					</div>
					<!-- Footer End -->
				</div>
			</div>


			<!-- Back to Top -->
			<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
				class="bi bi-arrow-up"></i></a>
		</div>

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

		<!-- 출,퇴근 확인 창 -->
		<script>
				
				var username = sessionStorage.getItem("id");
				console.log("checkPro?id=" + username + "&attend=출근");
				
				var goHome = document.getElementById('btn-go-home');
			    goHome.addEventListener('click',()=>{
			
			        alert("퇴근완료")
			        fetch("checkPro?id=" + username + "&attend=퇴근", {
    					method: "GET"
			    	});
			    });
				var goWork = document.getElementById('btn-go-work')
			    goWork.addEventListener('click',()=>{
			
			        alert("출근완료")
			        fetch("checkPro?id=" + username + "&attend=출근", {
    					method: "GET"
			    	});
			    });
		    </script>
</body>
</html>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.oreilly.servlet.CacheHttpServlet"%>
<%@page import="com.moon.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHATTING</title>
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
                    <a href="goMain" class="nav-item nav-link ">메인화면</a>
                    <a href="goAttendStatus" class="nav-item nav-link">근태 관리</a>
                    <a href="goSchedule" class="nav-item nav-link">일정 관리</a>
                    <a href="goChatting" class="nav-item nav-link active">메시지</a>        
                    <a href="goFileDrive" class="nav-item nav-link ">파일-드라이브</a>
                            
                    <%
                    if (admin != null) {
					%>
                    <a href="goAdmin" class="nav-item nav-link">관리자 페이지</a>
                    <%}%>
                    
                    
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><%=compName %></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                
                <div class="navbar-nav align-items-center ms-auto">
                   
                 
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="file/<%=logo %>" alt=""
                                style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex"><%=name %></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="goMyPage" class="dropdown-item">My Profile</a>
             
                            <a href="Logout" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


			<!-- 메세지 html -->
			<div class="container-fluid pt-4 px-4">
				<div id="menuarea" class="row g-4">


					<div class="col-xl-3">
						<div class="bg-light rounded h-100 p-4">
							<h6 class="mb-4">회원목록</h6>
							<%
							request.setCharacterEncoding("UTF-8");

							UserInfoDAO dao = new UserInfoDAO();
							userInfo info = new userInfo();

							ArrayList<userInfo> list = new ArrayList<>();

							list = dao.datenotList(compNum);

							session.setAttribute("list", list);
							%>

							<form action="Chatting?host_email=<%=email %>" method="post">
								<select id="guest_email" style="height: 550px;" name="select_room"
									onchange="formChange(this.form)" class="form-select high-400"
									multiple aria-label="multiple select example">
									<c:forEach var="list" items="${list}" varStatus="status">
										<option value="${list.email}">${list.name}</option>
									</c:forEach>
								</select>
							</form>
						</div>
					</div>

					<div class="col-sm-9">
						<div class="bg-light rounded h-100 p-4">
						
						<%
						request.setCharacterEncoding("UTF-8");

						String chatroom = request.getParameter("select_room");
					
						
						ArrayList<userInfo> list_info = new ArrayList<>();
						
						
						ChattingDTO chatDTO = new ChattingDTO();
						ChattingDAO chatDAO = new ChattingDAO();

						ArrayList<ChattingDTO> lists = new ArrayList<>();
						if (chatroom != null) {
								chatDTO.setCompany(compNum);
								chatDTO.setHost_email_sub(email);
								chatDTO.setGuest_email_sub(chatroom);
								chatDTO.setHost_email(email);
								lists = chatDAO.show_mes(chatDTO);
								
								if (lists.isEmpty()) {
									chatDTO.setCompany(compNum);
									chatDTO.setHost_email_sub(chatroom);
									chatDTO.setGuest_email_sub(email);
									chatDTO.setHost_email(email);
									lists = chatDAO.show_mes(chatDTO);
								}
							
								list_info = dao.detailed(chatroom);
						}
						
						
						
						

						session.setAttribute("lists", lists);
						%>
						
						<%
						if (chatroom != null) {

						%>
						
							<h6 class="mb-4"><%=list_info.get(0).getName() %> 대화방</h6>
							<div
								id="scroll" style="overflow:scroll; height: 500px; padding: 1rem; background: #F7F7F7; flex-shrink: 2; overflow-y: auto; box-shadow: inset 0 2rem 2rem -2rem rgba(0, 0, 0, 0.05), inset 0 -2rem 2rem -2rem rgba(0, 0, 0, 0.05);">


						
							<% 
							
							for (int i = 0; i < lists.size(); i++) { 
								
								if (lists.get(i).getHost_email().equals(email)) {%>
								<div style="box-sizing: border-box; 
								padding: 0.5rem 1rem; 
								margin: 1rem 1rem 1rem auto; 
								background: 0 #213573; 
								border-radius: 1.125rem 0 1.125rem 1.125rem; 
								min-height: 2.25rem; 
								width: fit-content; 
								max-width: 66%; 
								color: #FFF; 
								box-shadow: 0 0 2rem rgba(0, 0, 0, 0.075), 0rem 1rem 1rem -1rem rgba(0, 0, 0, 0.1);">
								<%=lists.get(i).getSend_mes() %>
								</div>
									
									
								<% } 
								
								else if (lists.get(i).getHost_email().equals(chatroom)) { %>
								<div style="box-sizing: border-box; 
								padding: 0.5rem 1rem; 
								margin: 1rem 1rem 1rem 1rem; 
								background: #FFF; 
								border-radius: 1.125rem 1.125rem 1.125rem 0; 
								min-height: 2.25rem; 
								width: fit-content; 
								max-width: 66%; 
								box-shadow: 0 0 2rem rgba(0, 0, 0, 0.075), 0rem 1rem 1rem -1rem rgba(0, 0, 0, 0.1);">
								<%=lists.get(i).getSend_mes() %>
								
								</div>
								
					
							<%} 
							
							
							 } %>
							</div>
							
							
							<form action="Chatting_Mes?host=<%=email %>&guest=<%=list_info.get(0).getEmail()%>&select_room=<%=chatroom %>" method="post">
							<div style="margin-top: 1.5rem;">
								<div
									style="box-sizing: border-box; flex-shrink: 0; display: flex; align-items: center; padding: 0 0.5rem 0 1.5rem; flex-basis: 4rem;">
									<input
										style="border: none; background-image: none; background-color: white; padding: 0.5rem 1rem; border-radius: 1.125rem; flex-grow: 2; box-shadow: 0 0 1rem rgba(0, 0, 0, 0.1), 0rem 1rem 1rem -1rem rgba(0, 0, 0, 0.2); font-family: Red hat Display, sans-serif; font-weight: 400; letter-spacing: 0.025em;"
										placeholder="메시지를 입력해주세요." type="text"
										name="mes_text">


									<button style="margin-left: 1rem; width: 60px;" type="submit"
										style="margin-top: 7rem;"
										class="btn btn-primary rounded-pill m-2"
										onchange="formChange(this.form)"
										id="btn_mes">
										<i class="fa fa-paper-plane" aria-hidden="true"></i>
									</button>


								</div>
							</div>
							</form>
							
						<%} %>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Widgets End -->


		<!-- Footer Start -->
		<!-- <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            /*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                        </br>
                        Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div>
            Footer End
        </div> -->
		<!-- Content End -->


		<!-- Back to Top -->
		
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
	
	<script type="text/javascript">

    window.onload=function(){
    let mySpace = document.getElementById("scroll"); 
    mySpace.scrollTop = mySpace.scrollHeight;
};
</script>

	
	

	<script type="text/javascript">
		function formChange(obj) {
			obj.submit();
			 
		}
	</script>
</body>

</html>
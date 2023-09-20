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
                    <a href="goMain" class="nav-item nav-link ">
                    <i class="fa fa-home" aria-hidden="true"></i>메인화면
                    </a>
                    <a href="goAttendStatus" class="nav-item nav-link">
                    <i class="fa fa-list-alt" aria-hidden="true"></i>근태 관리
                    </a>
                    <a href="goSchedule" class="nav-item nav-link ">
                    <i class="fa fa-calendar" aria-hidden="true"></i>일정 관리
                    </a>
                    <a href="goChatting" class="nav-item nav-link">
                    <i class="fa fa-comments" aria-hidden="true"></i>메시지
                    </a>        
                    <a href="goFileDrive" class="nav-item nav-link ">
                    <i class="fa fa-file" aria-hidden="true"></i>파일-드라이브
                    </a>
                     <a href="goNoticeBoard" class="nav-item nav-link">
                     <i class="fa fa-table" aria-hidden="true"></i>공지게시판
                     </a>
                            
                    <%
                    if (admin != null) {
					%>
                    <a href="goAdmin" class="nav-item nav-link active">
                    <i class="fa fa-lock" aria-hidden="true"></i>관리자 페이지
                    </a>
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



			<!-- Sale & Revenue Start -->
			<div class="container-fluid pt-4 px-4">
				<div id="menuarea" class="row g-4">

					<div class="nav-item dropdown1">
						<div class="dropdown2 open-sub">
							<a class="dropdown-items" href="goAdmin">회원관리</a>
							<a class="dropdown-items" href="goDepart">부서관리</a>
							<a class="dropdown-items" href="goPosition">직급관리</a>
							<a class="dropdown-items" href="GoCar_Registration">차량관리</a>
						</div>
					</div>
					<form method="post" onsubmit="check_function">
						<div class="col-12">
							<div class="bg-light rounded h-100 p-4">
								<h6 class="mb-4">승인 요청 회원 목록</h6>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">E-Mail</th>
												<th scope="col">Name</th>
												<th scope="col">Phone</th>
												<th scope="col">Depart</th>
												<th scope="col">position</th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<%
											request.setCharacterEncoding("UTF-8");

											UserInfoDAO dao = new UserInfoDAO();
											userInfo info = new userInfo();

											ArrayList<userInfo> list = new ArrayList<>();

											list = dao.dateList(compNum);

											session.setAttribute("list", list);
											%>

											<c:forEach var="list" items="${list}" varStatus="status">

												<tr>
													<th scope="row">${status.index+1}</th>
													<td><input type="hidden">${list.email}</td>
													<td>${list.name}</td>
													<td>${list.phone}</td>
													<td><select name="depart">
															<%
															ArrayList<Depart> list_de = new ArrayList<>();

															departDAO dao_de = new departDAO();
															Depart depa = new Depart();

															depa.setEmail(email);

															list_de = dao_de.depart_ListUp(depa);

															session.setAttribute("list_de", list_de);
															%>
															<c:forEach var="list_de" items="${list_de}"
																varStatus="status">
																<option value="${list_de.depart }">${list_de.depart }</option>
															</c:forEach>
													</select></td>
													<td><select name="position">
															<%
															ArrayList<position> list_po = new ArrayList<>();

															PositionDAO dao_po = new PositionDAO();

															list_po = dao_po.position_info_List(email);

															session.setAttribute("list_po", list_po);
															%>
															<c:forEach var="list_po" items="${list_po}"
																varStatus="status">
																<option value="${list_po.position_name }">${list_po.position_name }</option>
															</c:forEach>
													</select></td>
													<th>
														<input type="submit" onclick="javascript: form.action='goAppInfoUp?company=<%=compNum%>&email=${list.email}'" value="승인">
														
														
														<input type="submit" onclick="javascript: form.action='infoDel?company=<%=compNum%>&email=${list.email}'" value="삭제">
													</th>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</form>

					<div class="col-sm-12 col-xl-6">
						<div class="bg-light rounded h-100 p-4">
							<h6 class="mb-4">회원 목록</h6>
							<%
							request.setCharacterEncoding("UTF-8");

							list = dao.datenotList(compNum);

							session.setAttribute("list", list);
							%>

							<form action="Detailed" method="post">
								<select name="selectInfo" onchange="formChange(this.form)"
									class="form-select high-400" multiple
									aria-label="multiple select example">
									<c:forEach var="list" items="${list}" varStatus="status">
										<option value="${list.email}">${list.name}</option>
									</c:forEach>
								</select>
							</form>
						</div>
					</div>
					
						<div class="col-sm-12 col-xl-6">
							<div class="bg-light rounded h-100 p-4">
								<h6 class="mb-4">상세정보</h6>
					<form method="post" name="form" onsubmit="check_function" >
								<%
								request.setCharacterEncoding("UTF-8");

								String emailInfo = request.getParameter("selectInfo");

								UserInfoDAO da = new UserInfoDAO();
								userInfo infos = new userInfo();

								ArrayList<userInfo> lists = new ArrayList<>();
								if (emailInfo == null) {

								} else {

									lists = dao.detailed(emailInfo);
								}

								session.setAttribute("lists", lists);
								%>
								<%
								if (emailInfo != null) {
								%>
								<c:forEach var="lists" items="${lists}" varStatus="status">

									<div class="input-group mb-3">
										<span class="width-70 input-group-text" id="basic-addon1">이름</span>
										<span class="form-control" aria-describedby="basic-addon1">
											${lists.name } </span>
									</div>
									<div class="input-group mb-3">
										<span class="width-70 input-group-text" id="basic-addon1">이메일</span>
										<span class="form-control" aria-describedby="basic-addon1">
											${lists.email } </span>
									</div>
									<div class="input-group mb-3">
										<span class="width-70 input-group-text" id="basic-addon1">부서</span>
										<select name="depart" class="form-control"
											style="background-color: #fff;" aria-describedby="basic-addon1">
											<%
											ArrayList<Depart> list_de = new ArrayList<>();

											departDAO dao_de = new departDAO();
											Depart depa = new Depart();

											depa.setEmail(email);

											list_de = dao_de.depart_ListUp(depa);

											session.setAttribute("list_de", list_de);
											%>
											<option value=${lists.depart }>${lists.depart }</option>
											<c:forEach var="list_de" items="${list_de}"
												varStatus="status">
												<option value="${list_de.depart }">${list_de.depart }</option>
											</c:forEach>
										</select>


									</div>
									<div class="input-group mb-3">
										<span class="width-70 input-group-text" id="basic-addon1">직급</span>
										<select name="position" class="form-control"
											style="background-color: #fff;" aria-describedby="basic-addon1">
											<%
											ArrayList<position> list_po = new ArrayList<>();

											PositionDAO dao_po = new PositionDAO();

											list_po = dao_po.position_info_List(email);

											session.setAttribute("list_po", list_po);
											%>
											<option value=${lists.position }>${lists.position }</option>
											<c:forEach var="list_po" items="${list_po}"
												varStatus="status">
												<option value="${list_po.position_name }">${list_po.position_name }</option>
											</c:forEach>
										</select>


									</div>
									<div class="input-group mb-3">
										<span class="width-70 input-group-text" id="basic-addon1">연락처</span>
										<input type="text" class="form-control" name="tel"
											aria-describedby="basic-addon1" value="${lists.phone }">


									</div>

									<div class="input-group mb-3">
										<span class="width-70 input-group-text" id="basic-addon1">입사일</span>
										<span class="form-control" aria-describedby="basic-addon1">
											${fn:substring(lists.sign_date, 0,10)} </span>
									</div>


									<div class="dis-f">

										<div class="me-xxl-3 mb-3">
											<input type="submit"
												class="back-color width-70 input-group-text" id="input"
												value="수정"
												onclick="javascript: form.action='infoUp?company=<%=compNum%>&email=${lists.email }'">
										</div>
										<div class="me-xxl-3 mb-3">
											<input type="submit"
												class="back-color width-70 input-group-text" id="input"
												value="삭제"
												onclick="javascript: form.action='infoDel?company=<%=compNum%>&email=${lists.email }'">
										</div>
									</div>

								</c:forEach>
								<%
								} else {
								%>
								<div class="input-group mb-3">
									<span class="width-70 input-group-text" id="basic-addon1">이름</span>
									<span class="form-control" aria-describedby="basic-addon1">

									</span>
								</div>
								<div class="input-group mb-3">
									<span class="width-70 input-group-text" id="basic-addon1">이메일</span>
									<span class="form-control" aria-describedby="basic-addon1">

									</span>
								</div>
								<div class="input-group mb-3">
									<span class="width-70 input-group-text" id="basic-addon1">부서</span>
									<span class="form-control" aria-describedby="basic-addon1">

									</span>
								</div>
								<div class="input-group mb-3">
									<span class="width-70 input-group-text" id="basic-addon1">직급</span>
									<span class="form-control" aria-describedby="basic-addon1">

									</span>
								</div>
								<div class="input-group mb-3">
									<span class="width-70 input-group-text" id="basic-addon1">연락처</span>
									<span class="form-control" aria-describedby="basic-addon1">

									</span>

								</div>

								<div class="input-group mb-3">
									<span class="width-70 input-group-text" id="basic-addon1">입사일</span>
									<span class="form-control" aria-describedby="basic-addon1">

									</span>
								</div>
								<%
								}
								%>

					</form>
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
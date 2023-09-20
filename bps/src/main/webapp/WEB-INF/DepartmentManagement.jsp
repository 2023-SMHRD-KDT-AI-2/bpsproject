<%@page import="com.moon.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin 부서관리</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

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
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
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
                    <a href="goChatting" class="nav-item nav-link">메시지</a>        
                    <a href="goFileDrive" class="nav-item nav-link ">파일-드라이브</a>
                            
                    <%
                    if (admin != null) {
					%>
                    <a href="goAdmin" class="nav-item nav-link active">관리자 페이지</a>
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
				
				<%
                            
                            
                            request.setCharacterEncoding("UTF-8");
   
							
                    		departDAO dao = new departDAO();
                    		Depart de = new Depart();
                    		
                    		ArrayList<Depart> departs = new ArrayList<>();
                    		
                    		
                    		de.setCompany(compNum);
                    	
   
                    		departs = dao.departinfoList(de);


                    		session.setAttribute("departs", departs);
             
                     %>


                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">부서 목록</h6>
                            	
                            <form action="departDetailed" method="post">
							<select name="selectDe" onchange="formChange(this.form)" class="form-select high-400" multiple aria-label="multiple select example">
                            <c:forEach var="departs" items="${departs}" varStatus="status">
                                <option value="${departs.depart}">${departs.depart}</option>						
							</c:forEach>
                            </select>
                            </form>
                        </div>
                    </div>


					<%
                            
                            
                            request.setCharacterEncoding("UTF-8");
                    		
                    		String select = request.getParameter("selectDe");
                    		
                    		departDAO dDAO = new departDAO();
                    		Depart depa = new Depart();
                    		
                    		depa.setDepart(select);
                    		depa.setEmail(email);
                    		
                    		ArrayList<Depart> departss = new ArrayList<>();
                        	
                    		
                    		if (select == null){

                    		} else {
   
                    			departss = dDAO.departDetailed(depa);
                    		}
                    		
                    		


                    		session.setAttribute("lists", departss);
                            
                            %>
					
					<div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded p-4">
                        <div class="dis-f">
                            <h6 class="mb-4">부서관리</h6>
                            <a href="goDepart" style="margin-left: auto;">신규등록하기</a>
                       </div>   
					<form method="post" name="form" onsubmit="check_function">
					<% if (select == null) {%>
					<div class="input-group mb-3">
                                <span class="width-70 input-group-text" id="basic-addon1">부서명</span>
                                <input id="dep" name="depart" type="text" class="form-control" aria-describedby="basic-addon1" >

                            </div>
                            <div class="input-group mb-3">
                                <span class="width-70 input-group-text">담당자</span>
                                <input id="dep_name" type="text" name="dep_name" class="form-control" aria-label="With textarea">
                            </div>
                            <div class="input-group mb-3">
                                <span class="width-70 input-group-text">연락처</span>
                                <input id="tel" type="text" name="tel" class="form-control" aria-label="With textarea">
                            </div>
                            <div class="input-group mb-3">
                                <span class="width-70 input-group-text">설명</span>
                                <input id="ex" type="text" name="ex" class="form-control" aria-label="With textarea">
                            </div>
                             <div class="dis-f">
                      	 		<div class="me-xxl-3 mb-3">
                                    <input type="submit" class="back-color width-70 input-group-text" id="input" value="등록"
                                    onclick="javascript: form.action='departinsert?email=<%=email%>'">
                                    </div>
                                <div class="me-xxl-3 mb-3">
                                    <input type="reset" class="back-color width-70 input-group-text" value="초기화">
                                </div>
                                </div>
                               </div>
					
					<%} else { %>
					

					 <c:forEach var="lists" items="${lists}" varStatus="status">
                            <div class="input-group mb-3">
                            <span class="width-70 input-group-text" id="basic-addon1">부서명</span>
                                <input id="dep" name="dep" type="text" class="form-control" aria-describedby="basic-addon1" value="${lists.depart}" >

                            </div>
                            <div class="input-group mb-3">
                                <span class="width-70 input-group-text">담당자</span>
                                <input id="dep_name" type="text" name="dep_name" class="form-control" aria-label="With textarea" value="${lists.depart_name }">
                            </div>
                            <div class="input-group mb-3">
                                <span class="width-70 input-group-text">연락처</span>
                                <input id="tel" type="text" name="tel" class="form-control" aria-label="With textarea" value="${lists.depart_call }">
                            </div>
                            <div class="input-group mb-3">
                                <span class="width-70 input-group-text">설명</span>
                                <input id="ex" type="text" name="ex" class="form-control" aria-label="With textarea" value="${lists.ex }">
                            </div>
                                
                     </c:forEach>
                                <div class="dis-f">
                      	 		
                                <div class="me-xxl-3 mb-3">
                                    <input type="submit" class="back-color width-70 input-group-text" id="input" value="수정"
                                    onclick="javascript: form.action='departUp?email=<%=email%>&depart=<%=select%>'">
                                </div>
                                <div class="me-xxl-3 mb-3">
                                    <input type="submit" class="back-color width-70 input-group-text" id="input" value="삭제"
                                    onclick="javascript: form.action='departDel?email=<%=email%>'">
                                </div>
                                <div class="me-xxl-3 mb-3">
                                <input type="reset" class="back-color width-70 input-group-text" value="초기화">
                         		</div>
                         		</div>
                         		
                     <%} %>
                            
                            
                    </form>
                        </div>
                    
                    </div>
					
                   



                </div>


        
              


                <!-- Back to Top -->
               
            </div>

			<script type="text/javascript">
				function formChange(obj)
				{
					obj.submit(); 	
				}
				
				
				
				
			
				
			</script>


            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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
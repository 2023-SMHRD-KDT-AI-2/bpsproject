<%@page import="com.moon.model.carInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.moon.model.*"%>
<%@ page import="com.moon.model.carInfo"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>차량 관리</title>
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
    <link rel="stylesheet" href="css/car_reserv.css">
    <script src="js/car_reserv.js"></script>
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
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
                    <a href="goMain" class="nav-item nav-link ">메인화면</a>
                    <a href="goAttendStatus" class="nav-item nav-link">근태 관리</a>
                    <a href="goSchedule" class="nav-item nav-link active">일정 관리</a>
                    <a href="goChatting" class="nav-item nav-link">메시지</a>        
                    <a href="goFileDrive" class="nav-item nav-link ">파일-드라이브</a>
                            
                    <%
                    if (admin != null) {
					%>
                    <a href="goAdmin" class="nav-item nav-link ">관리자 페이지</a>
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

            

            <!-- Form Start -->
            <form action="compcarUpdate" accept-charset="UTF-8" method="post">
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">

				<div class="nav-item dropdown1">
						<div class="dropdown2 open-sub">
							<a class="dropdown-items" href="goSchedule">일정 등록</a>
							<a class="dropdown-items" href=goCarReserv>차량 신청</a>
						</div>
					</div>    

                    <!-- form 지정-->
                    <!-- 차량 용도 선택하는 부분-->
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-2">용도 선택</h6>
                            <hr>
 
                            <div class="form-check">
								<select class="form-select mb-1" aria-label="Default select example" name="usereason">
	                                <option value="단기출장">단기출장</option>
	                                <option value="장기출장">장기출장</option>
	                                <option value="외출">외출</option>
	                                <option value="화물운송">화물운송</option>
                            	</select>
                            </div>
 
                            <hr>
                            <!-- 차량 출발시간 도착시간 -->
                            <h6>시간</h6>
                            <div class="form-floating mb-2">
                                <strong>출발 예정 시간</strong>
                                <input type="datetime-local" name="startTime">
                            </div>
                            <div class="form-floating mb-2">
                                <strong>도착 예정 시간</strong>
                                <input type="datetime-local" name="returnTime">
                            </div>
                            <hr>
                            <h6 class="carSearch">차량 검색</h6>
                            <div class="form-floating mb-3">
                               <input onclick="openChild()" type="text" class="form-control"
                              placeholder="회사명" id="pInput" name="carNum"> <label
                              for="floatingInput">차량 검색</label>
                            </div>
                            <h6 class="mb-2">세부내용</h6>
                     	<hr>
                            <div>
	                    	 <input type="hidden" name="compNum" value="<%=compNum%>">
	                    	<input type="hidden" name="name" value="<%=name%>">
                    
                    	</div>
       				 	
                                
                        	<div class="form-floating">
                            	<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="reason_detail" style="height: 200px;"></textarea>
                            	<label for="floatingTextarea">Comments</label>
                        	</div>
                            
                            <div id="CheckCancelButton">
                        <input type="submit" value="확인" class="btn btn-success rounded-pill m-2">
                        <input type="reset" value="취소" class="btn btn-danger rounded-pill m-2">
                    </div>
                        </div>
                    </div>
                    
                   
                        </form>	
                   
                   
                   
                   
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                           
                
                        	<h6 class="mb-2 mt-4">차량 반납</h6>
                            <hr>
                            
                            <form action="returnCompCar" accept-charset="UTF-8" method="post">
                                <div class="form-floating mb-2">
                                    <input onclick="openCh()" type="text" class="form-control"
                              placeholder="회사명" id="dInput" name="carNum"> <label
                              for="floatingInput">차량 검색</label>
                              <input type="hidden" name="compNum" value="<%=compNum%>">
                    			<input type="hidden" name="name" value="<%=name%>">
                                </div>
                           
                                <input type="submit" value="반납" id="car_return" class="btn btn-success rounded-pill m-2">
                            </form>
                       </div>
                   </div>       
              
                    
                     </div>
                    </div>

                    
                    
      
    

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
    <script src="code.jquery.com_jquery-3.7.1.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/car_reserv.js"></script>
    <script type="text/javascript">
    </script>
   	<script>
      function openChild() {
         window.open('GoCompCarList?company=<%=compNum%>', 'CompCar_search','width=680px, height=500px');
      };
      
      
      function openCh() {
          window.open('GoUsingCarList?company=<%=compNum%>&name=<%=name%>', 'UsingCompCar_search','width=680px, height=500px');
       };
      
      
   </script>
   


</body>
</html>
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
<title>Admin 차량관리</title>
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
   #CheckCancelButton{
      float: right;
   }
   .text_space {
   text-align: center;
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


         <!-- Form Start -->
         <form action="carsign" accept-charset="UTF-8" method="post">
            <div class="container-fluid pt-4 px-4">
               <div class="row g-4">

                  <!-- 차량 용도 선택하는 부분-->
                  <div class="col-sm-12 col-xl-6">
                     <div class="bg-light rounded h-100 p-4">
                        <h6 class="mb-2">차량 등록</h6>
                        <hr>

                        <div class="form-floating mb-3">
                           <input type="text" class="form-control"
                              placeholder="회사명" id="pInput1" name="manufac">
                              <label for="floatingInput">제조사</label>
                        </div>
                        <div class="form-floating mb-3">
                           <input onclick="openChild()" type="text" class="form-control"
                              placeholder="회사명" id="pInput2" name="carName"> <label
                              for="floatingInput">차량 검색</label>
                        </div>
                        <div class="form-floating mb-3">
                           <input type="text" class="form-control" id="floatingInput"
                              placeholder="123호 1234" name="carNum"> <label for="floatingInput">차량
                              번호 (123문 1234)</label>
                        </div>

                        <div>
                         <input type="hidden" name="compNum" value="<%= compNum %>">
                         <input type="hidden" name="compName" value="<%= compName %>">
                         <input type="hidden" name="name" value="<%= name %>">
                         <input type="hidden" name="depart" value="<%= depart %>">
                        </div>




                     </div>
                  </div>
                  <div class="col-sm-12 col-xl-6">
                     <div class="bg-light rounded h-100 p-4">
                        <h6 class="mb-2">차량 정보</h6>
                        <hr>
                        <div class="form-floating mb-3">
                                    <select class="form-select" id="floatingSelect"
                                        aria-label="Floating label select example">
                                        <option value="1">휘발유</option>
                                        <option value="2">경유</option>
                                        <option value="3">LPG</option>
                                        <option value="4">하이브리드</option>
                                        <option value="4">electric</option>
                                    </select>
                                    <label for="floatingSelect">유종 선택</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <select class="form-select" id="floatingSelect"
                                        aria-label="Floating label select example">
                                        <option value="1">장기 출장</option>
                                        <option value="2">단기 출장</option>
                                        <option value="2">화물 운송</option>
                                    </select>
                                    <label for="floatingSelect">용도</label>
                                </div>
                                <div id="CheckCancelButton">

                              <input type="submit" value="확인" id="button-chack"
                              class="btn btn-success rounded-pill m-2">

                        </div>

                     </div>
                  </div>
                  
                     <div class="col-sm-12 col-xl-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">보유차량</h6>
                            <table class="table table-bordered">
                            
                            			<%
											request.setCharacterEncoding("UTF-8");
				
											carInfoDAO cdao = new carInfoDAO();
											carInfo info = new carInfo();
											ArrayList<carInfo> list = new ArrayList<>();
											info.setCompNum(compNum);
											
											list=cdao.show_Allcar(info);
						
											session.setAttribute("list", list);
										%>
                                <thead>
                                    <tr>
                                        <th scope="col" class="text_space">차량 번호</th>
                                        <th scope="col" class="text_space">제조사</th>
                                        <th scope="col" class="text_space">차량</th>
                                        <th scope="col" class="text_space">최근사용자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <c:forEach var="list" items="${list}" varStatus="status">
                                
                                    <tr>
                                        <td class="text_space">${list.carNum}</td>
                                        <td class="text_space">${list.manufac}</td>
                                        <td class="text_space">${list.carName}</td>     
                                        <td class="text_space">${list.last_use}</td>
                                        
                                    </tr>       
                                 </c:forEach>            
                                </tbody>
                            </table>
                        </div>
                    </div>

               </div>

            </div>
         </form>
         <!-- Form End -->



      </div>
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
   <script src="code.jquery.com_jquery-3.7.1.min.js"></script>

   <!-- Template Javascript -->
   <script src="js/main.js"></script>
   <script src="js/차량관리.js"></script>
   <script>
      function openChild() {
         window.open('goCarList', 'car_search','width=680px, height=500px');
      };
   </script>


</body>
</html>
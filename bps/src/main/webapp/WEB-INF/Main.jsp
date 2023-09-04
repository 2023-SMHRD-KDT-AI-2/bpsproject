<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Moon-Works</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="./css/nucleo-icons.css" rel="stylesheet" />
<link href="./css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="./css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle" href="./css/argon-dashboard.css?v=2.0.4"
	rel="stylesheet" />
</head>

<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100">
		<!-- 상단 컬러-->
	</div>
	<!-- 왼쪽 메뉴바-->

	<aside
		class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 "
		id="sidenav-main">
		<div class="sidenav-header">
			<i
				class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
				aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0"
				href="index.html " target="_blank"> <!--로고 이미지 삽입 --> <img
				src="" class="navbar-brand-img h-100" alt="main_logo"> <span
				class="ms-1 font-weight-bold">업무관리시스템</span>
			</a>
		</div>
		<hr class="horizontal dark mt-0">
		<div class="collapse navbar-collapse  w-auto "
			id="sidenav-collapse-main">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active" href="">
						<!--1번째 메뉴-->
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">근태관리</span>
				</a></li>
				<li class="nav-item"><a class="nav-link " href="">
						<!--2번째 메뉴-->
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">일정</span>
				</a></li>
				<li class="nav-item"><a class="nav-link " href="">
						<!--3번째 메뉴-->
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-credit-card text-success text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">메시지</span>
				</a></li>
				<li class="nav-item"><a class="nav-link " href="">
						<!--4번째 메뉴-->
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-app text-info text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">게시판</span>
				</a></li>
				<li class="nav-item"><a class="nav-link " href="">
						<!--5번째 메뉴-->
						<div
							class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-world-2 text-danger text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">드라이브</span>
				</a></li>
			</ul>
		</div>
	</aside>
	<main class="main-content position-relative border-radius-lg ">
		<!-- Navbar -->
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl "
			id="navbarBlur" data-scroll="false">
			<div class="container-fluid py-1 px-3">

				<div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4"
					id="navbar">
					<div class="ms-md-auto pe-md-3 d-flex align-items-center"></div>
					<ul class="navbar-nav  justify-content-end">
						<li class="nav-item d-xl-none ps-3 d-flex align-items-center">
							<a href="javascript:;" class="nav-link text-white p-0"
							id="iconNavbarSidenav">
								<div class="sidenav-toggler-inner">
									<i class="sidenav-toggler-line bg-white"></i> <i
										class="sidenav-toggler-line bg-white"></i> <i
										class="sidenav-toggler-line bg-white"></i>
								</div>
						</a>
						</li>
						<li class="nav-item px-3 d-flex align-items-center"><a
							href="javascript:;" class="nav-link text-white p-0"> <i
								class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End Navbar -->
		<div class="container-fluid py-4">
			<!--메인 화면 공간-->
		</div>
	</main>
	<div class="fixed-plugin">
		<a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
			<i class="fa fa-cog py-2"> </i>
		</a>
		<div class="card shadow-lg">
			<div class="card-header pb-0 pt-3 ">
				<div class="float-start">
					<h5 class="mt-3 mb-0">레이아웃 변경</h5>
				</div>
				<div class="float-end mt-4">
					<button
						class="btn btn-link text-dark p-0 fixed-plugin-close-button">
						<i class="fa fa-close"></i>
					</button>
				</div>

				<!-- End Toggle Button -->
			</div>

			<div class="card-body pt-sm-3 pt-0 overflow-auto">
				<div class="mt-2 mb-5 d-flex">
					<h6 class="mb-0">다크모드</h6>
					<div class="form-check form-switch ps-0 ms-auto my-auto">
						<input class="form-check-input mt-1 ms-auto" type="checkbox"
							id="dark-version" onclick="darkMode(this)">
					</div>
				</div>
				<!-- 메뉴 선택 공간 -->




			</div>
		</div>
	</div>


	<!--   Core JS Files   -->
	<script src="./js/core/popper.min.js"></script>
	<script src="./js/core/bootstrap.min.js"></script>
	<script src="./js/plugins/perfect-scrollbar.min.js"></script>
	<script src="./js/plugins/smooth-scrollbar.min.js"></script>
	<script src="./js/plugins/chartjs.min.js"></script>
	-->



	<script async defer src="https://buttons.github.io/buttons.js"></script>

	<script src="./js/argon-dashboard.min.js?v=2.0.4"></script>
</body>

</html>
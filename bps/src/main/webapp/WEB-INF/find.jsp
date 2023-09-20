<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Moon-Works 회원가입</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">



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




<link href="css/style.css" rel="stylesheet">


<style>
table {
	margin-left: auto;
	margin-right: auto;
	width: 300px;
	margin: auto;
	border-collapse: separate;
	border-spacing: 10px 10px;
}

.btn-gradient {
	margin: 5px; . btn-gradient .small, .btn-effect.small { padding : 8px
	18px;
	font-size: 14px; . btn-gradient { text-decoration : none;
	color: white;
	padding: 10px 30px;
	display: inline-block;
	position: relative;
	border: 1px solid rgba(0, 0, 0, 0.21);
	border-bottom: 4px solid rgba(0, 0, 0, 0.21);
	border-radius: 4px;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
}

#id_div {
	display: flex;
	justify-content: center;
}
</style>

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-8 col-lg-7 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->


						<div class="col-lg-6">
							<div class="p-5">

								<div class="form-group row"
									style="display: flex; justify-content: center; flex-direction: row;">

									<div class="find" style="margin-right: 20%;">

										<a href="#" onclick="findId()" id="findId"
											style="text-align: center; text-color: blue">아이디 찾기</a>
									</div>

									<div class="find">

										<a href="#" onclick="findPw()" id="findPw"
											style="text-align: center;">비밀번호 찾기</a>

									</div>

								</div>


								<hr>
								<div id = "title" style ="font-size: 15px; text-align: center; color: #213573 ">아이디 찾기</div>

								<form>
									<div>

										<table id="find_id" style ="width: 70%">
											<tr>
												<th>이름</th>
												<td><input type="text" id="name"></td>

											</tr>

											<tr>
												<th>전화번호</th>
												<td><input type="text" id="phone"></td>
											</tr>



										</table>

										<table id="find_pw" style="display: none; width: 70%">
											<tr id="find_id">
												<th>이름</th>
												<td><input id="pw_name" type="text" id="name"></td>

											</tr>

											<tr>
												<th>아이디</th>
												<td><input id="pw_id" type="text" id="name"></td>

											</tr>
											<tr>
												<th>전화번호</th>
												<td><input id="pw_phone" type="text" id="phone"></td>
											</tr>



										</table>
										<hr>
										<div id="id_div" style="text-align:center; justify-content: center; font-size: 30px"></div>
										<br>
										<div style="display: flex; justify-content: center; text-align: center" id ="c_id">
											<button type="button"
												class="n-btn w100 btn-sm btn-default cert-hidden"
												onclick="find()" id="confirm">확인</button>
												<div style = "width: 15px; height: auto; display: inline-block;"></div>
												<button type="button"
													class="n-btn w100 btn-sm btn-default cert-hidden"
													onclick="location.href =  'goLogin';" id="">돌아가기</button>
										</div>


										<div style="display: none; justify-content: center; text-align: center; " id ="c_pw">
											<button type="button"
												class="n-btn w100 btn-sm btn-default cert-hidden"
												onclick="P_find()" id="confirm">확인</button>
												<div style = "width: 15px; height: auto; display: inline-block;"></div>
												<button type="button"
													class="n-btn w100 btn-sm btn-default cert-hidden"
													onclick="location.href =  'goLogin';" id="">돌아가기</button>
										</div>


									</div>
								</form>
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		function find() {

			var name = $('#name').val();
			var phone = $('#phone').val();

			console.log(name);
			console.log(phone);

			$.ajax({
				url : "find",
				type : "get",
				datatype : "json",
				data : {
					name : name,
					phone : phone
				},

				//dataType  success 했을 때 받아올 결과값의 자료형을 의미
				success : function(result) {
					const json = JSON.parse(result)
					console.log(json.id)

					if (result == 0) {
						$("#id_div").html('정보를 다시 확인해주세요');
						$("#id_div").css('color', 'red');

					} else {

						$("#id_div").html(json.id);
						$("#id_div").css('color', 'green');

					}
				},
				error : function() {
					alert("입력하신 정보를 확인해주세요");
				}
			});

		}

		function P_find() {

			var id = $('#pw_id').val();
			var name = $('#pw_name').val();
			var phone = $('#pw_phone').val();

			console.log(id);
			console.log(phone);

			$.ajax({
				url : "find",
				type : "get",
				datatype : "json",
				data : {
					id : id,
					phone : phone,
					name : name
				},

				//dataType  success 했을 때 받아올 결과값의 자료형을 의미
				success : function(result) {
					const json = JSON.parse(result)
					console.log(json.pw)

					if (result == 0) {
						$("#id_div").html('정보를 다시 확인해주세요');
						$("#id_div").css('color', 'red');

					} else {

						$("#id_div").html(json.pw);
						$("#id_div").css('color', 'green');

					}
				},
				error : function() {
					alert("입력하신 정보를 확인해주세요");
				}
			});

		}

		function findId() {
			var find_id = document.getElementById("find_id");
			var find_pw = document.getElementById("find_pw");
			var c_id = document.getElementById("c_id");
			var c_pw = document.getElementById("c_pw");
			find_pw.style.display = "none";
			find_id.style.display = "";
			c_pw.style.display="none"
			c_id.style.display=""
			$('#id_div').html('')
			$('#title').html('아이디 찾기')

		}

		function findPw() {
			var find_id = document.getElementById("find_id");
			var find_pw = document.getElementById("find_pw");
			var c_id = document.getElementById("c_id");
			var c_pw = document.getElementById("c_pw");
			find_id.style.display = "none";
			find_pw.style.display = "";
			c_id.style.display="none"
			c_pw.style.display=""
				$('#id_div').html('')
				$('#title').html('비밀번호 찾기')
		}
	</script>













	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

</body>

</html>
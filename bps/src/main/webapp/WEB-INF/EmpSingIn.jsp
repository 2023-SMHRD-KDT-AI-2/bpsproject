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

<title>Moon-Works 사원 회원가입</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">




</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<form name="join_form" action="empJoin" method="post">
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">사원 계정 생성</h1>
							</div>

							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
									<input type="text" class="form-control form-control-user"
										id="exampleFirstName" placeholder="아이디 (영문자 숫자만 가능)" name="inputEmail1">
								</div>



								<div class="col-sm-3">
									<input type="text" class="form-control" id="textEmail"
										placeholder="이메일을 선택하세요." name="inputEmail2">
								</div>
								<div class="col-sm-3">
									<select id="select" class="form-control">
										<option value="" disabled selected>이메일 선택</option>
										<option value="naver.com" id="naver.com">naver.com</option>
										<option value="hanmail.net" id="hanmail.net">hanmail.net</option>
										<option value="gmail.com" id="gmail.com">gmail.com</option>
										<option value="nate.com" id="nate.com">nate.com</option>
										<option value="directly" id="exampleLastName">직접 입력하기</option>
									</select>
								</div>
							</div>

							<div id="id_div"></div>

							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
									<input type="password" class="form-control"
										id="exampleInputPassword" placeholder="비밀번호 영문자,숫자,특수조합 8~25자리" name="pw">
								</div>

								<div class="col-sm-6">
									<input type="password" class="form-control"
										id="exampleRepeatPassword" placeholder="비밀번호 확인"
										name="pwCheck">
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="name"
									placeholder="이름" name="inputName">
							</div>
							
							<div class="form-group row">
								<div class="col-sm-4">
									<input type="text" class="form-control phone" placeholder="연락처"
										name="inputPhone1" id ="phone1">
								</div>

								<div class="col-sm-4">
									<input type="text" class="form-control phone"
										name="inputPhone2" id ="phone2">
								</div>

								<div class="col-sm-4">
									<input type="text" class="form-control phone"
										name="inputPhone3" id ="phone3">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-6">
									<input type="text" class="form-control adress"
										id="address_kakao" placeholder="주소입력" name="address">
								</div>
								<div class="col-sm-6">
									<input type="text" class="form-control adress"
										id="address" placeholder="상세주소"
										name="address_detail">
								</div>
							</div>
							<hr>
							<strong>회사 정보 입력</strong>
							<div class="form-group">

								<input onclick="openChild()" type="text" class="form-control"
									placeholder="사업자번호" id="pInput" name="comNum">
							</div>
							<button class="btn btn-primary btn-user btn-block"
								onclick="joinform_check()" type="button">회원가입</button>
							<hr>


							<div class="text-center">
								<a class="small" href="goLogin"> <strong>로그인 페이지 이동</strong></a>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>

	</div>

	<script type="text/javascript">
		function openChild() {
			window
					.open('goCompSearch', 'comp_search',
							'width=680px, height=500px, resizable = no, scrollbars = no');
		};
	</script>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

	<script type="text/javascript">
		$('#exampleFirstName').keyup(function() {
			let userId = $('#exampleFirstName').val(); // input_id에 입력되는 값
			
			$.ajax({
				url : "idCheck",
				type : "post",
				data : {userId : userId},
				//dataType --> success 했을 때 받아올 결과값의 자료형을 의미
				success : function(result) {
					console.log(result)
					var id_check = /^[A-Za-z]{0}[A-Za-z0-9_-]{0,18}$/;
					if (result == 0 || !id_check.test(userId)) {
						$("#id_div").html('사용할 수 없는 아이디입니다.');
						$("#id_div").css('color', 'red');
						$("#id_div").css('display', '');
						if (userId.length <= 1) {
							$("#id_div").css('display', 'none');
						}

					} else if (result == 1) {
						$("#id_div").html('사용할 수 있는 아이디입니다.');
						$("#id_div").css('color', 'green');
						$("#id_div").css('display', '');

						if (userId.length == 0) {
							$("#id_div").css('display', 'none');
						}
					}

				},
				error : function() {
					alert("서버요청실패");
				}
			})

		})

		function joinform_check() {
			//변수에 담아주기
			var email1 = document.getElementById("exampleFirstName");
			var email2 = document.getElementById("textEmail");
			var pw = document.getElementById("exampleInputPassword");
			var rpw = document.getElementById("exampleRepeatPassword");
			var name = document.getElementById("name");
			
			
			var phone1 = document.getElementById("phone1");
			var phone2 = document.getElementById("phone2");
			var phone3 = document.getElementById("phone3");
			var address = document.getElementById("address_kakao");
			
			var address2 = document.getElementById("address");

			var buisness = document.getElementById("pInput");
			
			
			var id_check = /^[A-Za-z]{1}[A-Za-z0-9_-]{3,19}$/;
			
			if (email1.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
				alert("아이디를 입력하세요.");
				uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
				return false;
			}
			;
			if(!id_check.test(email1.value)){
				alert("영문자 숫자만 가능합니다.");
				pw.focus();
				return false;
			}

			if (email2.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
				alert("이메일을 확인하세요.");
				uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
				return false;
			}
			;

			if (pw.value == "") {
				alert("비밀번호를 입력하세요.");
				pwd.focus();
				return false;
			}
			;

			//비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
			var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

			if (!pwCheck.test(pw.value)) {
				alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
				pw.focus();
				return false;
			}
			;

			if (rpw.value !== pw.value) {
				alert("비밀번호가 일치하지 않습니다..");
				repwd.focus();
				return false;
			}
			;

			if (name.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
				alert("이름을 확인하세요.");
				uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
				return false;
			}
			;

			
			if (phone1.value == "" || phone2.value == "" ||phone3.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
				alert("핸드폰번호를 확인하세요.");
				uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
				return false;
			}
			;
			

			if (address.value == "" ||address2.value=="" ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
				alert("주소를 확인하세요.");
				uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
				return false;
			}
			;

			if (buisness.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
				alert("사업자명을 확인하세요.");
				uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
				return false;
			}
			;

			document.join_form.submit();
		}
	</script>








	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- 간편로그인 데이터 가져오기 -->
	<script type="text/javascript" src="js/loginfo.js"></script>
	<script
		src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="js/navercall.js"></script>

	<!-- 주소 검색 스크립트-->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="js/addressFind.js"></script>



</body>

</html>
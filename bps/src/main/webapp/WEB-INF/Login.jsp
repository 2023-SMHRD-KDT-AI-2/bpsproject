<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Moon-Works 로그인</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-6 col-lg-7 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                       
                           <form action="Login" method="post">
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <img src="img/logo.png" style="width: 150px;">
                                        <h1 class="h4 text-gray-900 mb-4">Moon-Works</h1>                                   
                                    </div>
                                
                                
                                
                                
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                name="id"
                                                placeholder="Email">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password"
                                                name="pw">
                                        </div>
                                        <div class="form-group" style="height: 7px;">
                                           
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                        
                                            <strong>로그인</strong>
                                        </button>
                                        
                                        
                                        <hr>
                                        <a href="javascript:loginWithKakao()" class="btn btn-kakao btn-user btn-block" 
                                           style="display: flex; align-items: center; flex-direction: row;
                                                  justify-content: center;">
                                            <div style="margin-right: 15px;">
                                                <i class="fa fa-comment"></i>
												<path
													d="M512 240c0 114.9-114.6 208-256 208c-37.1 0-72.3-6.4-104.1-17.9c-11.9 8.7-31.3 20.6-54.3 30.6C73.6 471.1 44.7 480 16 480c-6.5 0-12.3-3.9-14.8-9.9c-2.5-6-1.1-12.8 3.4-17.4l0 0 0 0 0 0 0 0 .3-.3c.3-.3 .7-.7 1.3-1.4c1.1-1.2 2.8-3.1 4.9-5.7c4.1-5 9.6-12.4 15.2-21.6c10-16.6 19.5-38.4 21.4-62.9C17.7 326.8 0 285.1 0 240C0 125.1 114.6 32 256 32s256 93.1 256 208z" />
                                            </div>
                                            <div><strong>카카오 로그인</strong></div>
                                        </a>
                                        <a id="naverIdLogin_loginButton" href="javascript:void(0)" class="btn btn-naver btn-user btn-block"
                                            style="display: flex; align-items: center; flex-direction: row;
                                                  justify-content: center;
                                                  height: 37.8px;">
                                            <div style="margin-right: 15px;">
                                                <strong style="font-size: 20px;">N</strong>
                                            </div> <strong>네이버 로그인</strong>
                                        </a>
                                    
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="goFind"> <strong>아이디/비밀번호 찾기</strong>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="goSingIn"><strong>회원가입</strong></a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>

        </div>

    </div>


	<!-- 간편 로그인 스크립트 -->
	<!-- 카카오 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="js/kakao.js"></script>
	<!-- 네이버 -->
	<script	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
			charset="utf-8"></script>
	<script type="text/javascript" src="js/naver.js"></script>
	
	
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
	
		<script type="text/javascript">
		var testPopUp;
		if (sessionStorage.length > 0) {
			sessionStorage.clear();

			if (localStorage.key(0).startsWith('kakao')) {
				localStorage.clear();
				function openPopUpkaka() {
							location.href = "https://kauth.kakao.com/oauth/logout?client_id=0f72e7dcd0a213b06a4393aa80485c9e&logout_redirect_uri=http://localhost:8090/bps/goLogin",
							"_blank";

				}
				openPopUpkaka();

			} else {

				localStorage.clear();

				function openPopUp() {
					testPopUp = window
							.open("https://nid.naver.com/nidlogin.logout",
									"_blank",
									"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
				}
				function closePopUp() {
					testPopUp.close();
				}

				function naverLogout() {
					openPopUp();
					setTimeout(function() {
						closePopUp();
					}, 500);

				}

				naverLogout();
			}
		}
	</script>

</body>

</html>
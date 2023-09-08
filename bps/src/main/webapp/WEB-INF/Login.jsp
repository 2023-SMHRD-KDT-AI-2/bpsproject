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
                       
                           <form action="" method="post">
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <img src="img/제목 없음.png" style="width: 150px;">
                                        <h1 class="h4 text-gray-900 mb-4">Moon-Wokrs</h1>                                   
                                    </div>
                                
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                name=""
                                                placeholder="Email">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password"
                                                name="">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <a href="goMain" class="btn btn-primary btn-user btn-block">
                                            <strong>로그인</strong>
                                        </a>
                                        <hr>
                                        <a href="index.html" class="btn btn-kakao btn-user btn-block" 
                                           style="display: flex; align-items: center; flex-direction: row;
                                                  justify-content: center;">
                                            <div style="margin-right: 15px;">
                                                <i class="fa fa-comment"></i>
                                            </div>
                                            <div><strong>카카오 로그인</strong></div>
                                        </a>
                                        <a href="index.html" class="btn btn-naver btn-user btn-block"
                                            style="display: flex; align-items: center; flex-direction: row;
                                                  justify-content: center;
                                                  height: 37.8px;">
                                            <div style="margin-right: 15px;">
                                                <strong style="font-size: 20px;">N</strong>
                                            </div> <strong>네이버 로그인</strong>
                                        </a>
                                    
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href=""> <strong>아이디/비밀번호 찾기</strong>
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

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
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

    <title>Moon-Works 관리자 회원가입</title>

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

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <form action="adminJoin" method="post">
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">관리자 계정 생성</h1>
                            </div>
                          
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="아이디" name="inputEmail1" value="">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="textEmail" placeholder="이메일을 선택하세요."
                                            name="inputEmail2" value="">
                                    </div>
                                    <div class="col-sm-3">
                                        <select id="select" class="form-control">
                                            <option value="" disabled selected>이메일 선택</option>
                                            <option value="naver.com" id="naver.com">naver.com</option>
                                            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
                                            <option value="gmail.com" id="gmail.com">gmail.com</option>
                                            <option value="nate.com" id="nate.com">nate.com</option>
                                            <option value="directly" id="exampleLastName">직접
                                                입력하기</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control" id="exampleInputPassword"
                                            placeholder="비밀번호" name="pw" value="">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" id="exampleRepeatPassword"
                                            placeholder="비밀번호 확인" name="pwCheck" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="이름" name="inputName" value="">
                                </div>
                                <hr>
                                <strong>회사 정보 입력</strong>
                                <div class="form-group row">
									<div class="col-sm-6">
                                    <input type="text" class="form-control" id="exampleFirstName" placeholder="회사명"
                                        name="compName" value="">
                                    </div>
                                    <div class="col-sm-6">
                                    <input type="text" class="form-control" id="exampleFirstName" placeholder="사업자번호"
                                        name="compNum" value="">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="address_kakao" placeholder="주소입력"
                                            name="address" value="">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="exampleRepeatPassword"
                                            placeholder="상세주소" name="address_detail" value="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" placeholder="연락처" name="inputPhone1" value="">
                                    </div>

                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="inputPhone2" value="">
                                    </div>

                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="inputPhone3" value="">
                                    </div>
                                </div>
                                <strong>로고 등록 [JPG/PNG]</strong>
                                <div class="form-group">
                                    <input type="file" accept=".jpg, .png" class="form-control" name="comLogo" value="">
                                </div>
                                <button class="btn btn-primary btn-user btn-block" type="submit">회원가입</button>
                                <hr>

                                <div class="text-center">
                                    <a class="small" href="goLogin">
                                        <strong>로그인 페이지 이동</strong></a>
                                </div>
                            

                        </div>
                    </div>
                </form>
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

    <!-- 주소 검색 스크립트-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="js/addressFind.js"></script>
        


</body>

</html>
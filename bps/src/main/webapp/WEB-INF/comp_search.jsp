<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <title>회사 정보 검색</title>
    <style>

        body {
            text-align: center;
        }

        .center {
            display: flex;
            justify-content: center;
            float: right;
            margin-bottom: 3%;
        }

      
        img {
            width: 100px;
        }

        .textbox {
            width: 240px;
            height: 40px;
            border-top: 0.1px solid #fff;
            border-left: 0.1px solid #fff;
            border-bottom: 0.1px solid #213573;
        }

        .sub {
            width: 50px;
            background-color: #213573;
            color: #fff;
            font-weight: bold;
            border: #213573;
            
        }

        div {
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
        }

        table {
            width: 700px;
        }

        td {
            border-bottom : 0.1px solid #e3e6f0;
        }
        
        .last {
            border-bottom: #fff;
            text-align: center;
        }

        .boad {
            border-right: 0.1px solid #e3e6f0;
        }

        .ta {
            border-right: #fff;
        }

        .font {
            font-size: 20px;
            font-weight: bold;
        }

        .high {
            height: 36px;
        }

    </style>
</head>
<body>

        <div class="center">
        <div>
        <input class="textbox" type="text" name="comp" placeholder="사업자번호 또는 회사명 입력">
        <button class="sub"><i class="fa fa-search" aria-hidden="true"></i></button>
        </div>
        </div>

        <table>

            <tr class="font">
                <td class="boad ta">로고</td>
                <td>회사명</td>
                <td>사업자번호</td>
                <td></td>
            </tr>
            <tr>
                <td><img src = "" /> </td>
                <td></td>
                <td class="boad"></td>
                <td><button onclick="setParentText()" id="cInput" class="select sub high put" value="123-45-67890">선택</button></td>
            </tr>
          

            
         

        </table>

    <script src="vendor/jquery/jquery.js"></script>
    
    <script>
        function setParentText(){
            opener.document.getElementById("pInput").value = document.getElementById("cInput").value
        }

        $(".put").click(function(){
            window.close();
        })
 

    </script>
</body>
</html>
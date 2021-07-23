<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>계좌개설</title>
    <link href="/Open-Banking/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i%7cMontserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/Open-Banking/css/font-awesome.min.css" rel="stylesheet">
    <!-- Style -->
    <link href="/Open-Banking/css/style.css" rel="stylesheet">
    <link href="/Open-Banking/css/openAccount.css" rel="stylesheet">
    <link rel="stylesheet" href="/Open-Banking/css/layout.css" />
	<link rel="stylesheet" href="/Open-Banking/css/board.css" />
	<script src="/Open-Banking/js/main.js"></script>
	<script src="/Open-Banking/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	
<!--회원가입 부분-->
        <section class="signup-wrap">
			<form action="/Open-Banking/openAccount.sj">

				<div class="logo">
	                <a href="/Open-Banking/input.sj" target="_blank" title="네이버 홈페이지"></a>
	            </div>
	
	            <div class="input-box">
	                <!--아이디,비번,비번재확인-->
	
	                <h3>계좌비밀번호</h3>
	                <span class="signup-input">
	                    <input id="signup-pw" type="text" name="password"></input>
	                    <span class="pw-lock"></span>
	                </span>
	
	                <h3>계좌비밀번호 재확인</h3>
	                <span class="signup-input">
	                    <input id="signup-pww" type="text" name="re_password"></input>
	                    <span class="pww-lock"></span>
	                </span>
	
	            </div>
	
	            <div style="margin-top: 35px;" class="input-box">
	                <!--이름,생년월일,성별,이메일-->
	                <h3>별칭</h3>
	                <span class="signup-input">
	                    <input id="signup-name" type="text" name="alias"></input>
	                </span>
	
	                <span class="choice">
	                    <h3>본인 확인 이메일</h3>
	                    <span>(선택)</span>
	                </span>
	                <span class="signup-input">
	                    <input id="signup-email" type="text" placeholder="선택입력" name="email"></input>
	                </span>
	
	            </div>
	
	            <div style="margin-top: 35px;" class="input-box">
	                <!--휴대전화-->
	                <h3>휴대전화</h3>
	                <span class="signup-input">
	                    <select id="signup-country" class="selectbox" name="country" onchange="">
	                        <option value="ko">대한민국 +82</option>
	                    </select>
	                </span>
	                <div style="display: flex;">
	                    <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
	                        <input id="signup-phone" type="text" placeholder="전화번호 입력" name="phone"></input>
	                    </span>
	                    <span class="cnum-btn-wrap">
	                        <button id="cnum-btn">인증번호 받기</button>
	                    </span>
	                </div>
	                
	                <span class="signup-input-c" style="margin-top: 10px;">
	                    <input id="signup-cnum" type="text" placeholder="인증번호 입력하세요"></input>
	                </span>
	            </div>
	
	            <div>
	                <!--가입하기-->
	                <div class="signup-btn-wrap input-box">
	                    <input type="submit" id="signup-btn" value="계좌개설">
	                </div>
	            </div>
			</form>
        
        </section>
	
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp"/>
	</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="Hair salon templates for mens hair cut service provider.">
<meta name="keywords" content="hair salon website templates free download, html5 template, free responsive website templates, website layout,html5 website templates, template for website design, beauty HTML5 templates, cosmetics website templates free download">
<title>Insert title here</title>
<!-- Bootstrap -->
<link href="/Open-Banking/css/bootstrap.min.css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i%7cMontserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<!-- Font Awesome -->
<link href="/Open-Banking/css/font-awesome.min.css" rel="stylesheet">
<!-- Style -->
<link href="/Open-Banking/css/style.css" rel="stylesheet">
<link href="/Open-Banking/css/modal.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- Custom Style -->
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
Kakao.init('c0ee324b9204956e6ee791dd0445b088'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

function kakaoLoginBtn(){
	Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function (authObj) {
        	kakaoLogin();
        },
        fail: function (err) {
            alert(err);
        }
    })
}

function checkForm(){
	let f = document.lform
	if (f.id.value == '') {
		alert("아이디를 입력하세요")
		f.id.focus()
		return false
	}
	if (f.password.value == '') {
		alert("비밀번호를 입력하세요")
		f.password.focus()
		return false
	}
	return true
}


$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>

</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>

	<section>
		<div class="hero-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
               	<%--  <C:if test="${ Kakao.Auth.getAccessToken() eq null }"> 
			              <a id="kakao-login-btn"></a>
						    <a href="javascript:void(0)"></a>
						    	<script>
						    		javascript:kakaoLoginBtn();
						    	</script>
				    	</C:if> --%>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	         
    
</body>
</html>
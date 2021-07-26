<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Hair salon templates for mens hair cut service provider.">
<meta name="keywords" content="hair salon website templates free download, html5 template, free responsive website templates, website layout,html5 website templates, template for website design, beauty HTML5 templates, cosmetics website templates free download">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>login</title>
<link href="/Open-Banking/css/style.css" rel="stylesheet">
<link href="/Open-Banking/css/modal.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="/Open-Banking/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link href="/Open-Banking/css/font-awesome.min.css" rel="stylesheet">
<link href="/Open-Banking/css/loginForm.css" rel="stylesheet" />
<!-- Custom Style -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

	function checkForm() {
		
		let f = document.loginForm
		
		if(isNull(f.id, '아이디를 입력하세요'))
			return false
		if(isNull(f.password, '패스워드를 입력하세요'))
			return false
		
		return true
	}    
    
	window.Kakao.init('82c288c3750bc7ab2ec232dd74a11191');
	
	function kakaoLoginBtn(){
		Kakao.Auth.createLoginButton({
	        container: '#kakao-login-btn',
	        success: function(authObj) { //authObj가 참일때, 자료를 성공적으로 보냈을때 출력되는 부분
	            Kakao.API.request({
	  
	                url: '/v2/user/me',
	  
	                success: function(res) { //res가 참일때, 자료를 성공적으로 보냈을때 출력되는 부분
	  						alert(res.id)
	                      console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
	  
	                      console.log(res.kakao_account['email']);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
	  
	                      console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
	                              
	                      // res.properties.nickname으로도 접근 가능 )
	                      console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
	           
	          
		           var kakaonickname = res.properties.nickname;    //카카오톡 닉네임을 변수에 저장
		           var kakaoe_mail = res.kakao_account['email'];    //카카오톡 이메일을 변수에 저장함
	  
	          	 //카카오톡의 닉네임과,mail을 url에 담아 같이 페이지를 이동한다.
	          	 location.href = '<%=request.getContextPath() %>/loginProcess.sj?kakaoId=' + res.id
	        
	                    }
	                  })
	                },
	                fail: function(error) { //에러 발생시 에러 메시지를 출력한다.
	                  alert(JSON.stringify(error));
	                }
	    })
	}
    
  </script>
  </head>
  <body>
  	<header>
	  	<!-- 메뉴 바 -->
	  	<jsp:include page="/jsp/include/topMenu.jsp">
	  		<jsp:param value="loginForm" name="this"/>
	  	</jsp:include>
  	</header>
  
  	<section>
  		<div class="login-form">
			<form action="/Open-Banking/loginProcess.sj" method="post" class="form-horizontal" name="login_frm">
				<!-- form 태그 넘길 때 같이 넘길 name=value -->
				<input type="hidden" name="login_ok" value="1"/>
				<div class="row">
					<div class="col-8 offset-4">
						<h2>로그인</h2>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-form-label col-4">아이디</label>
					<div class="col-8">
						<input type="text" class="form-control" name="id" placeholder="ID를 입력하세요" required="required">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-form-label col-4">비밀번호</label>
					<div class="col-8">
						<input type="password" class="form-control" name="password" placeholder="PASSWORD를 입력하세요" required="required">
					</div>
				</div>
				<div style="text-align: center">
					<div class="form-group row loginbtn">
							<input type="submit" class="login_submit" name="btn btn-primary btn-lg" accesskey="enter" value="로그인" >
					</div>
					<div class="form-group row" id="kakaologin">
						<a id="kakao-login-btn"></a>
						<p id="token-result"></p>
						<a href="javascript:void(0)"></a>
				    	<script>
				    		javascript:kakaoLoginBtn();
				    	</script>
					</div>
				</div>
			</form>
			
			<!-- 카카오메일 넘기기 -->
			<div class="text-center">비밀번호가 기억나지 않습니까? <a href="./pwFindForm.sj">비밀번호 찾기</a></div>
			<div class="text-center">아직 회원이 아니십니까? <a href="/Open-Banking/signup.sj">회원가입</a></div>
  		</div>
  	</section>
  
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp"></jsp:include>	
	</footer>  
  </body>
  </html>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
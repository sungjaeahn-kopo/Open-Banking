<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Hair salon templates for mens hair cut service provider.">
    <meta name="keywords" content="hair salon website templates free download, html5 template, free responsive website templates, website layout,html5 website templates, template for website design, beauty HTML5 templates, cosmetics website templates free download">
    <title>Men Salon | Hair Salon Website Templates Free Download</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i%7cMontserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- Style -->
    <link href="css/style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js "></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js "></script>
<![endif]-->
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	window.Kakao.init('82c288c3750bc7ab2ec232dd74a11191')
	
	
	if('${transferResult}' != '') {
		alert('카카오')
		let money = '${transferResult}'
		let account_number = '${account_number}'
		/*
		Kakao.Auth.authorize({
		    redirectUri: 'http://localhost:9999/Open-Banking/index.sj',
		    scope: 'talk_message'
		});
		*/
		Kakao.API.request({
		  url: '/v2/api/talk/memo/default/send',
		  data: {
		    template_object: {
		      object_type: 'feed',
		      content: {
		        title: 'SJ뱅크 계좌이체 성공',
		        description: '계좌번호 ' + account_number + '로' + money + '원이 이체되었습니다.',
		        image_url:
		          'https://dimg.donga.com/wps/NEWS/IMAGE/2021/06/29/107689623.2.jpg',
		        link: {
		          web_url: 'https://developers.kakao.com',
		          mobile_web_url: 'https://developers.kakao.com',
		        },
		      },
		      social: {
		        like_count: 100,
		        comment_count: 200,
		      },
		      button_title: '바로 확인',
		    },
		  },
		  success: function(response) {
		    console.log(response);
		  },
		  fail: function(error) {
		    console.log(error);
		  },
		});
	} //if문
	
	
	
	//카카오로그인
/* 	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	
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
	} */
/* //카카오로그아웃  
 	function kakaoLogout() {
		
		Kakao.init(kakaoKey);	// 초기화
		Kakao.isInitialized();
		
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	    
	    // 카카오 로그아웃
	    Kakao.Auth.logout(function() {
	    	console.log(Kakao.Auth.getAccessToken());
	    });
	    
	};   */
	
	 /*    
	function kakaoLogout(){
	    Kakao.Auth.logout();
	    location.href="http://developers.kakao.com/logout";
	    location.href="/Open-Banking/index.jsp";
	    alert('카카오 로그아웃 완료!');
	   setCookie("kakao_login","",-1);  // 쿠키삭제 (로그아웃) 
	    //deleteCookie( "kakao_login" ); 쿠키삭제 다른 방법
	    createLoginKakao();
	    location.href="../index.jsp";
	} 
	*/
/* 	function kakaoLogout(){
	    Kakao.Auth.logout();

	    location.assign("http://developers.kakao.com/logout");
	     setTimeout(history.back(),3000); 
	    setInterval(history.back(),3000);
		 location.assign("http://localhost:9999/Open-Banking/index.jsp"); 
	    alert('카카오 로그아웃 완료!');
	    setCookie("kakao_login","",-1);  // 쿠키삭제 (로그아웃)  
	    //deleteCookie( "kakao_login" ); 쿠키삭제 다른 방법
	    createLoginKakao();
	     location.href="../index.jsp"; 
	}  */
	
/* 	 function logout() {
        if (!Kakao.Auth.getAccessToken()) {
            console.log('Not logged in.');
            return;
        }
        console.log(Kakao.Auth.getAccessToken()); //before Logout
        Kakao.Auth.logout(function () {
            console.log(Kakao.Auth.getAccessToken()); //after Logout
            //★ 추가 할 것 : 로그아웃 성공 후 처리 
        });
    }

    function unlink() {
        Kakao.API.request({
            url: '/v1/user/unlink',
            success: function (response) {
                console.log(response);
            },
            fail: function (error) {
                console.log(error);
            }
        });
        
        location.href="https://accounts.kakao.com/login?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fproxy%3DeasyXDM_Kakao_v0rj4rf3ybf_provider%26ka%3Dsdk%252F1.40.6%2520os%252Fjavascript%2520sdk_type%252Fjavascript%2520lang%252Fko-KR%2520device%252FWin32%2520origin%252Fhttp%25253A%25252F%25252Flocalhost%25253A9999%26origin%3Dhttp%253A%252F%252Flocalhost%253A9999%26response_type%3Dcode%26redirect_uri%3Dkakaojs%26state%3Dr8xtubaze6hqpqvdtss1v9%26client_id%3Dc0ee324b9204956e6ee791dd0445b088";
    } */
	 
</script>
</head>

<body>
    <header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
    
    <div class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <h1 class="hero-title">smart한 금융의 시작 <br></h1>
                    <p class="hero-text"><strong>Your Types <br> Your Style <br> Your Money</strong> </p>
						<!-- <ul> -->
							<!-- <li onclick="kakaoLogin();">
						      <a href="javascript:void(0)"> -->
						          <!-- <img src="images/kakao_login_btn.png">  -->
						          
						              <!-- 로그인 버튼 -->
						              <!-- 토큰 값이 없을 경우에만 활성화 -->
						              <%-- <C:if test="${ Kakao.Auth.getAccessToken() eq null }">
							              <a id="kakao-login-btn"></a>
										    <a href="javascript:void(0)"></a>
										    	<script>
										    		javascript:kakaoLoginBtn();
										    	</script>
										    	
								    	</C:if> --%>
					        		
									     <!--  <a href="javascript:logout()">
									      
									      	<script>
									      		location.assign('http://localhost:9999/Open-Banking/index.jsp');
									      	</script>
									          <span>로그아웃</span>
									      </a>
									      <a href="javascript:unlink()">
									      	<script>
									      		location.assign('http://localhost:9999/Open-Banking/index.jsp');
									      	</script>
									          <span>연결해제</span>
									      </a> -->
                </div>
            </div>
        </div>
    </div>
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <div class="mb60 text-center section-title">
                        <!-- section title start-->
                        <h1>salon and barbar service</h1>
                        <h5 class="small-title ">we help you look great</h5>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="service-block">
                        <!-- service block -->
                        <div class="service-icon mb20">
                            <!-- service img -->
                            <img src="images/service-icon-1.png" alt=""> </div>
                        <!-- service img -->
                        <div class="service-content">
                            <!-- service content -->
                            <h2><a href="# " class="title ">traditional cut</a></h2>
                            <p>Responsive website templates free download html5 with css3 for Hair Salon and Shop website template.</p>
                            <div class="price ">$45</div>
                        </div>
                        <!-- service content -->
                    </div>
                    <!-- /.service block -->
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="service-block">
                        <!-- service block -->
                        <div class="service-icon mb20">
                            <!-- service img -->
                            <img src="images/service-icon-2.png" alt=""> </div>
                        <!-- service img -->
                        <div class="service-content">
                            <!-- service content -->
                            <h2><a href="#" class="title ">MUSTACHE TRIM</a></h2>
                            <p>Free Responsive HTML5 CSS3 Website Template for hair salon and beauty salon.</p>
                            <div class="price">$45</div>
                        </div>
                        <!-- service content -->
                    </div>
                    <!-- /.service block -->
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="service-block">
                        <!-- service block -->
                        <div class="service-icon mb20">
                            <!-- service img -->
                            <img src="images/service-icon-3.png" alt=""> </div>
                        <!-- service img -->
                        <div class="service-content">
                            <!-- service content -->
                            <h2><a href="#" class="title ">BEARD TRIM</a></h2>
                            <p>Responsive website templates free download html with css.</p>
                            <div class="price ">$45</div>
                        </div>
                        <!-- service content -->
                    </div>
                    <!-- /.service block -->
                </div>
                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 text-center"> <a href="#" class="btn btn-default"> View All Service </a> </div>
            </div>
        </div>
    </div>
    <div class="space-medium bg-default">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12"><img src="images/about-img.jpg" alt="" class="img-responsive"></div>
                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                    <div class="well-block">
                        <h1>Men’s salon website templates</h1>
                        <h5 class="small-title ">best experience ever</h5>
                        <p>Free Hair Salon Website Templates for your hair salon shop or business. <a href="https://easetemplate.com/">Free Website Template Download It now!</a></p>
                        <p>Bootstrap templates free download idcondi mentum utturpis one fuscenec justo idle libero pharetra posuere aliquam tempus is porttitor atfinibus sollicitudin namiam.</p>
                        <p>Best Free HTML CSS Website Templates for salon and hair cutting business. All features are clean designed</p>
                        <a href="# " class="btn btn-default">View More About us</a> </div>
                </div>
            </div>
        </div>
    </div>
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                    <div class="section-title mb60 text-center">
                        <!-- section title start-->
                        <h1>testimonials</h1>
                        <h5 class="small-title">What Happy Client Say</h5>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="testimonial-block">
                        <!-- testimonial block -->
                        <div class="testimonial-content">
                            <p class="testimonial-text">“Free Beauty Website Templates that help me a lot to build easy and fast my hair shop website in 2 days”</p>
                        </div>
                        <div class="testimonial-info">
                            <h4 class="testimonial-name">Reba Truong</h4>
                            <span class="testimonial-meta">34 Year</span> <span class="testimonial-meta">Customer</span> </div>
                    </div>
                    <!--/. testimonial block -->
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="testimonial-block">
                        <!-- testimonial block -->
                        <div class="testimonial-content">
                            <p class="testimonial-text">“Free bootstrap responsive website templates 2017 its best ever i found for my hair salon”</p>
                        </div>
                        <div class="testimonial-info">
                            <h4 class="testimonial-name">Thomas Warren</h4>
                            <span class="testimonial-meta">34 Year</span> <span class="testimonial-meta ">Customer</span> </div>
                    </div>
                    <!--/. testimonial block -->
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="testimonial-block">
                        <!-- testimonial block -->
                        <div class="testimonial-content">
                            <p class="testimonial-text">“Best Free HTML CSS Website Templates for salon and hair cutting business. All features are clean designed”</p>
                        </div>
                        <div class="testimonial-info">
                            <h4 class="testimonial-name">Carie Willis</h4>
                            <span class="testimonial-meta">34 Year</span> <span class="testimonial-meta">Customer</span> </div>
                    </div>
                    <!--/. testimonial block -->
                </div>
            </div>
        </div>
    </div>
    <div class="cta-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="cta-title">hair salon website templates</h1>
                    <p class="cta-text">You can download and use these FREE HTML templates for your salon and beauty shop and store. </p>
                    <a href="https://easetemplate.com/downloads/category/free-website-template/" class="btn btn-default" target="_blank">Call to action buttons</a> </div>
            </div>
        </div>
    </div>
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                    <div class="section-title mb40 text-center">
                        <!-- section title start-->
                        <h1>Latest News &amp; Article</h1>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="post-block">
                        <div class="row ">
                            <!-- post block -->
                            <div class="col-md-6">
                                <div class="post-img">
                                    <a href="#"><img src="images/post-img.jpg" alt="" class="img-responsive"></a>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="post-content">
                                    <h2><a href="https://easetemplate.com/" class="title" target="_blank"> cosmetics website templates free download</a></h2>
                                    <p class="meta"> <span class="meta-date"> 1 January 2018</span> <span class="meta-comment"><a href="# ">(12) Comments</a></span> <span class="meta-author">By <a href="#">Author</a></span></p>
                                    <p>Cras dolor arcu porttitor atfinibus idcondi mentum uttu rpis one fuscenec justo idle libero pharetra posuere aliq uam tempus is porttitor atfinibus.</p>
                                    <a href="#" class="btn btn-default">Read More</a> </div>
                            </div>
                        </div>
                        <!-- /.post block -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <!-- footer-->
        <div class="container">
            <div class="footer-block">
                <!-- footer block -->
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="footer-widget">
                            <h2 class="widget-title">Salon Address</h2>
                            <ul class="listnone contact">
                                <li><i class="fa fa-map-marker"></i> 4958 Norman Street Los Angeles, CA 90042 </li>
                                <li><i class="fa fa-phone"></i> +00 (800) 123-4567</li>
                                <li><i class="fa fa-fax"></i> +00 (123) 456 7890</li>
                                <li><i class="fa fa-envelope-o"></i> info@salon.com</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="footer-widget footer-social">
                            <!-- social block -->
                            <h2 class="widget-title">Social Feed</h2>
                            <ul class="listnone">
                                <li>
                                    <a href="#"> <i class="fa fa-facebook"></i> Facebook </a>
                                </li>
                                <li><a href="#"><i class="fa fa-twitter"></i> Twitter</a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i> Google Plus</a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i> Linked In</a></li>
                                <li>
                                    <a href="#"> <i class="fa fa-youtube"></i>Youtube</a>
                                </li>
                            </ul>
                        </div>
                        <!-- /.social block -->
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                        <div class="footer-widget widget-newsletter">
                            <!-- newsletter block -->
                            <h2 class="widget-title">Newsletters</h2>
                            <p>Enter your email address to receive new patient information and other useful information right to your inbox.</p>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Email Address">
                                <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Subscribe</button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </div>
                        <!-- newsletter block -->
                    </div>
                </div>
                <div class="tiny-footer">
                    <!-- tiny footer block -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="copyright-content">
                             Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.tiny footer block -->
            </div>
            <!-- /.footer block -->
        </div>
    </div>
    <!-- /.footer-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/menumaker.js"></script>
    <!-- sticky header -->
    <script src="js/jquery.sticky.js"></script>
    <script src="js/sticky-header.js"></script>
</body>

</html>

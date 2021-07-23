<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Main</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9df8e3a9d46c166c7d34b0e997579ad3"></script>  
<script>
/* 
window.onload = function(){
	 var container = document.getElementById('map'); //������ ���� ������ DOM ���۷���
	 var options = { //������ ������ �� �ʿ��� �⺻ �ɼ�		
	 	center: new kakao.maps.LatLng(37.474309, 126.868428), //������ �߽���ǥ.
	 	level: 3 //������ ����(Ȯ��, ��� ����)
	 };
	 var map = new kakao.maps.Map(container, options); //���� ���� �� ��ü ����
}
function go(){
	 var container = document.getElementById('map'); 
	 var options = { 
	 	center: new kakao.maps.LatLng(37.556325, 126.624533), //�ϳ�����Ƽ���� ���� �浵
	 	level: 3 
	 };
	 var map = new kakao.maps.Map(container, options);
}
 */
 
</script>
</head>
<body>


<jsp:include page="/jsp/include/topMenu.jsp" /> 


<div class="hero-slider">
    <!-- Slider Item -->
    <div class="slider-item slide1" style="background-image:url(${pageContext.request.contextPath }/resources/assets/images/slider/���2.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Slide Content Start -->
                    <div class="content style text-center">
                        <h2 class="text-white text-bold mb-2">�ϳ����� ���°��� ����</h2>
                        <p class="tag-text mb-5">ģ�� ���� '������'�� �Բ� ������ ���°��� �ϼ���!</p>
                        
                    </div>
                    <!-- Slide Content End -->
                </div>
            </div>
        </div>
    </div>
    <!-- Slider Item -->
    <div class="slider-item" style="background-image:url(${pageContext.request.contextPath }/resources/assets/images/slider/���2.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Slide Content Start-->
                    <div class="content style text-right">
                        <h2 class="text-white">�ϳ����� ���°��� ����</h2>
                        <p class="tag-text">ģ�� ���� '������'�� �Բ� ������ ���°��� �ϼ���! </p>
                        
                    </div>
                    <!-- Slide Content End-->
                </div>
            </div>
        </div>
    </div>
    <!-- Slider Item -->
    <div class="slider-item" style="background-image:url(${pageContext.request.contextPath }/resources/assets/images/slider/���2.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Slide Content Start -->
                    <div class="content text-center style">
                        <h2 class="text-white text-bold mb-2">�ϳ����� ���°��� ����</h2>
                        <p class="tag-text mb-5">ģ�� ���� '������'�� �Բ� ������ ���°��� �ϼ���!</p>
                        
                    </div>
                    <!-- Slide Content End -->
                </div>
            </div>
        </div>
    </div>
</div>

<!--====  End of Page Slider  ====-->

<section class="cta">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="cta-block">
                    <div class="emmergency item">
                        <i class="fa fa-phone"></i>
                        <h2>����</h2>
                      
                        <p>��ǥ��ȭ: 02-2151-6400<br>
							�ѽ�: 02-2151-6410</p>
                    </div>
                    <div class="top-doctor item">
                        <i class="fa fa-stethoscope"></i>
                        <h2>ã�ƿ��ô� ��</h2>
                        <p>�ּ�: (22742) ��õ ���� ���ڷ� 181 �ϳ������׷� ���յ����ͼ��� �������� 5��</p>
                        
                        <button type="button" class="btn btn-primary btn btn-main" data-toggle="modal" data-target="#myModal">
    						��������
  						</button>
                    </div>
                    <div class="working-time item">
                        <i class="fa fa-hourglass-o"></i>
                        <h2>�� ����</h2>
                        <ul class="w-hours">
                            <li>���ڱ������ ����<span>1588-3555</span></li>
                            <li>�������<span>1588-1111 </span></li>
                            <li>�ؿ� <span>+82-42-520-2500</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<br>
<br>
<br>



<!--  
<div class="container">
  
  The Modal
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        Modal Header
        <div class="modal-header">
          <h4 class="modal-title">���� ����</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        Modal body
        <div class="modal-body">
          <div id="map" style="width:500px;height:400px;"></div>
				<br>
				<input type="button" class="btn btn-primary btn-lg" value="�ϳ�����Ƽ����" onclick="go()">
        </div>
        
        Modal footer
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

</div>
  -->
</body>
</html>
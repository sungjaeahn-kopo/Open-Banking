<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SJ Bank</title>
<link href="/Open-Banking/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i%7cMontserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="/Open-Banking/css/font-awesome.min.css" rel="stylesheet">
<link href="/Open-Banking/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/Open-Banking/css/layout.css" />
<link rel="stylesheet" href="/Open-Banking/css/board.css" />
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function doAction(accountno) {
		<c:choose>
			<c:when test="${ not empty user }">
				location.href = 'transactionDetails.sj?accountno=' + accountno;
			</c:when>
			<c:otherwise>
				if(confirm('로그인이 필요한 서비스입니다\n 로그인페이지로 이동하시겠습니까?'))
					location.href = "/Open-Banking/jsp/login/loginForm.sj"
			</c:otherwise>
		</c:choose>
	}
	
	$(document).ready(function(){
		$('#bankCode').change(function(){
			$.ajax({
				type : 'get',
				url : '/Open-Banking/accList.sj',
				dataType : 'json',
				data : {
					bankCode : $("#bankCode option:selected").val()
				}, 
				success : function(data) {
					console.log(data)
					resultHtml(data);
				},
				error : function() {
					alert("fail")
				}
			})
			
		})
	})

	function resultHtml(data) {
		
		
		var html = "<hr width=\"80%\">";
		html += "<h2>" + value.id + "계좌</h2>";
		html += "<hr width=\"80%\"><br>";
		html += "<table border = '1'>";
		html += "<tr>";
		html += "<th width=\"10%\">은행명</th>";
		html += "<th>계좌번호</th>";
		html += "<th width=\"16%\">별칭</th>";
		html += "<th>예금주</th>";
		html += "<th width=\"20%\">생성일</th>";
		html += "</tr>";

		$.each(data, function(key, value) {
			html += "<tr align = 'center'>";
			html += "<td>" + value.bankCode + "</td>";
			html += '<td><a href="javascript:doAction(' + '\'' +  value.accountNo + '\'' + ')">';
			html += value.accountNo + "</a>";
			html += "</td>";
			html += "<td>" + value.alias + "</td>";
			html += "<td>" + value.id + "</td>";
			html += "<td>" + value.date + "</td>";
			html += "</tr>";
		});

		html += "</table>";
		$("#accList").empty();
		$("#accList").append(html);
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
	<br>
	<br>
		<div align="center">
			조회하고 싶은 은행을 선택하세요 : 
			<select id = "bankCode" name="items1" >
					<option value="">---은행선택---</option>
					<option value="SJ Bank" title="/images/SJBank.png">SJ Bank</option>
					<option value="JH Bank" title="/images/JHBank.png">JH Bank</option>
					<option value="YR Bank" title="/images/YRBank.jpg">YR Bank</option>
					<option value="SW Bank" title="/images/SWBank.jpg">SW Bank</option>
			</select>
		</div>
		<br><br>
		<div align="center" id="accList">
		</div>
	</section>
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp"/>
	</footer>
</body>
</html>
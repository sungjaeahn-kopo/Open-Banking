<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Open-Banking/css/layout.css" />
<link rel="stylesheet" href="/Open-Banking/css/board.css" />
<link href="/Open-Banking/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i%7cMontserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="/Open-Banking/css/font-awesome.min.css" rel="stylesheet">
<link href="/Open-Banking/css/style.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
		<div align="center">
			<hr width="80%">
			<h2>계좌 목록</h2>
			<hr width="80%">
			<br>
				<table id="list">
					<tr>
						<th width="7%">번호</th>
						<th>제목</th>
						<th width="16%">작성자</th>
						<th>조회수</th>
						<th width="20%">등록일</th>
					</tr>
					<tr>
						<td>443</td>
						<td>443</td>
						<td>443</td>
						<td>443</td>
						<td>443</td>

					
					</tr>
				</table>	
				
				
				<br>
				<c:if test="${ not empty userVO }">
					<button id="addBtn">새글등록</button>
				</c:if>	
			</div>
		</section>
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp"/>
	</footer>



</body>
</html>
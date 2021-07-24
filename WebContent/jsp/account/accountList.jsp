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
						<th width="10%">은행명</th>
						<th>계좌번호</th>
						<th width="16%">별칭</th>
						<th>예금주</th>
						<th width="20%">생성일</th>
					</tr>
					
					<c:forEach items="${ list }" var="account" varStatus="loop">
						<tr>
							<td>${ account.bankCode }</td>
							<td>${ account.accountNo }</td>
							<td>${ account.alias }</td>
							<td>${ account.id }</td>
							<td>${ account.date }</td>
						</tr>
					</c:forEach>
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
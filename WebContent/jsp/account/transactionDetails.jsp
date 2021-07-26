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
			<h2>거래내역 조회</h2>
			<hr width="80%">
			<br>
				<table id="list">
					<tr>
						<th>거래번호</th>
						<th>이체계좌번호</th>
						<th>이체금액</th>
						<th>받는계좌번호</th>
						<th>받는사람</th>
						<th>거래일시</th>
						<th>거래은행</th>
						<th>잔액</th>
					</tr>
					
					<c:forEach items="${ list }" var="trans" varStatus="loop">
						<tr>
							<td>${ trans.transNo }</td>
							<td>${ trans.transAccountNo }</td>
							<td>${ trans.amount }</td>
							<td>${ trans.toAccountNo }</td>
							<td>${ trans.toName }</td>
							<td>${ trans.transDate }</td>
							<td>${ trans.bankName }</td>
							<td>${ trans.balance }</td>
						</tr>
					</c:forEach>
				</table>	
				<br>
			</div>
		</section>
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp"/>
	</footer>
</body>
</html>
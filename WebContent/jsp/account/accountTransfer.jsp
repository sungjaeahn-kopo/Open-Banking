<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>계좌이체</title>
<link href="/Open-Banking/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i%7cMontserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="/Open-Banking/css/font-awesome.min.css" rel="stylesheet">
<link href="/Open-Banking/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/Open-Banking/css/layout.css" />
<link rel="stylesheet" href="/Open-Banking/css/board.css" />
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function checkBal(val){
		alert("계좌" + val + "선택");
	}

</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
		<section>
			<form action="/transferProcess.sj">
				<div align="center">
					<hr width="80%">
					<h2>계좌이체</h2>
					<hr width="80%">
					<br>
						<table id="list">
							<tr>
								<th>이체계좌선택</th>
								<th width="50%">송금가능금액</th>
							</tr>
							
							<tr>
								<td>
									<select name="items1" onchange="checkBal(this.value)">
										<c:forEach items="${ list }" var="account" varStatus="loop">
											<option value="account01">${ account.accountNo } (${ account.bankCode })  </option>
										<!-- <option value="자바스크립트">자바스크립트</option>
										<option value="CSS">CSS</option> -->
										</c:forEach>
									</select>
								</td>
									
								<td>
								</td>
							</tr>
						</table>
								<br>
								<br>
								<br>
						<table border="1">
							<tr>
								<th>상대계좌</th>
								<th>은행</th>
								<th>예금주</th>
								<th>이체금액</th>
							</tr>
							<tr>
								<td>
									<input type="text" />
								</td>
								<td>
									<input type="text" />
								</td>
								<td>
									<input type="text" />
								</td>
								<td>
									<input type="text" />
								</td>
							</tr>
						</table>
						
							
						<br>
						<c:if test="${ not empty user }">
							<input type="button" value="계좌이체"/>
						</c:if>	
					</div>
				</form>
			</section>
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp"/>
	</footer>

</body>
</html>
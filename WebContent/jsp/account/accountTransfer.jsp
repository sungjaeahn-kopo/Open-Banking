<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>계좌이체</title>
<link href="/Open-Banking/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i%7cMontserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link href="/Open-Banking/css/font-awesome.min.css" rel="stylesheet">
<link href="/Open-Banking/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/Open-Banking/css/layout.css" />
<link rel="stylesheet" href="/Open-Banking/css/board.css" />
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#account').change(function(){
			$.ajax({
				type : 'get',
				url : '/Open-Banking/transBal.sj',
				data : {
					accountno : $("#account option:selected").val()
				}, 
				success : function(data) {
					document.getElementById("bal").innerText = data.trim()
					//document.write(bal)
				},
				error : function() {
					alert('실패')
				}
			})
			
		})
	})
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<form action="/Open-Banking/transferProcess.sj">
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
							<select id = "account" name="items1" >
								<c:forEach items="${ list }" var="account" varStatus="loop">
									<option value="${account.accountNo }">${ account.accountNo }(은행코드
										: ${ account.bankCode })</option>
								</c:forEach>
							</select>
						</td>

						<c:forEach items="${ list }" var="account" varStatus="loop">
							<td id="bal" />
						</c:forEach>
					</tr>
				</table>
				<br> <br> <br>
				<table border="1">
					<tr>
						<th>상대계좌</th>
						<th>은행</th>
						<th>예금주</th>
						<th>이체금액</th>
					</tr>
					<tr>
						<td><input type="text" name="t_account" /></td>
						<td><input type="text" name="t_bank" /></td>
						<td><input type="text" name="t_owner" /></td>
						<td><input type="text" name="t_amount" /></td>
					</tr>
				</table>

				<br>
				<c:if test="${ not empty user }">
					<input type="submit" value="계좌이체" />
				</c:if>
			</div>
		</form>
	</section>
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp" />
	</footer>

</body>
</html>
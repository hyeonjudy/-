<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
table{
	border:1px ;
	solid #FFFFFF
}
.th.categorylist{
	width:20px;
	height:400px;
}
.td{
	position : relative;
	left:20px;
	width:20px;
	height:20px;
}
</style>


<title>Join Page</title>
</head>
<body>

	<table border="1">
		<tr>
			<th class="titlebar" bordercolor="#FFFFFF" colspan="2">
				<jsp:include page="titlebar.jsp"></jsp:include>
			</th>
		</tr>
		<tr>
			<th class="categorylist" bordercolor="#FFFFFF">
				<jsp:include page="product_category.html"></jsp:include>
			</th>
			<center>
			<td>
			<hr width=500, size=2, color="blue">
			<center>회원가입</center>
			<hr width=500, size=2, color="blue">
			<center>
			<form action="join_OK" method="post">
				아이디 : <input type="text" name="id" size=10><br />
				<br />
				패스워드 : <input type="password" name="pw" size=15><br />
				<br />
				성별 : <input type="radio" name="gender" value="남">남<input type="radio" name="gender" value="여">여<br />
				<br />
				나이 : <select name="age" size=3>
					<option value="10대">10대</option>
					<option value="20대">20대</option>
					<option value="30대">30대</option>
					<option value="40대">40대</option>
					</select><br />
				<br />
				피부타입 : <input type="radio" name="skintype" value="건성">건성<input type="radio" name="skintype" value="지성">지성<input type="radio" name="skintype" value="민감성">민감성<br />
				<br />
				피부고민1 : <input type="radio" name="skinfuc1" value="미백">미백<input type="radio" name="skinfuc1" value="수분">수분<input type="radio" name="skinfuc1" value="탄력">탄력<input type="radio" name="skinfuc1" value="트러블">트러블<br />
				<br />
				피부고민2 : <input type="radio" name="skinfuc2" value="미백">미백<input type="radio" name="skinfuc2" value="수분">수분<input type="radio" name="skinfuc2" value="탄력">탄력<input type="radio" name="skinfuc2" value="트러블">트러블<br />
				<input type="submit" value="회원가입">&nbsp; &nbsp; <input type="reset" value="취소">
			</form>
			</center>
			</td>
			</center>
		</tr>
		
		<tr>
			<th class="underbar" colspan="2" bordercolor="#FFFFFF"s> 
				<jsp:include page="underbar.html"></jsp:include>
			</th>
		</tr>
	</table>
	
</body>
</html>
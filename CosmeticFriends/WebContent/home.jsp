<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
table{
	border:1px ;
	solid #FFFFFF;
}
.th.categorylist{
	width:20px;
	height:400px;
}
.td{
	position : absolute;
	left:20px;
	width:20px;
	height:20px;
}
</style>

<%
	if(request.getSession()!=null){
		request.getSession().invalidate();
	}
	
%>
<title>Login Page</title>
</head>
<body>

	<table border="1" bordercolor="#FFFFFF">
		<tr>
			<th class="titlebar" bordercolor="#FFFFFF" colspan="2">
				<jsp:include page="titlebar.jsp"></jsp:include>
			</th>
		</tr>
		<tr>
			<th class="categorylist" bordercolor="#FFFFFF">
				<jsp:include page="product_category.html"></jsp:include>
			</th>
			
			<td bordercolor="#FFFFFF">
				<hr width="500" align="center" size="2" color="red">
				<h2 align="center">로그인</h2>
				<hr width="500" align="center" size="2" color="red">
				<left>
				<form action="login_OK" method="post">
				<div align=center style="width:500;">
				<ul style="list-style:none;">
					<li>&nbsp;아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="id" /> </li>
					<li>비밀번호 <input type="password" name="pw" /> </li><br />
					<li><input type="submit" value="로그인" /> </li>
				</ul>
				<br />
				</div>
				</form>
				</left>
			</td>

		</tr>
		
		<tr >
			<th class="underbar" colspan="2" bordercolor="#FFFFFF"> 
				<jsp:include page="underbar.html"></jsp:include>
			</th>
		</tr>
	</table>
	
</body>
</html>
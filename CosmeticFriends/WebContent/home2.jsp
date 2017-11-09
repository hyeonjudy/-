<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%@ page import = "product.ComponentDAO" %>
   <%@ page import = "product.ComponentBean" %>
   <%@ page import = "product.ProductBean" %>
   <%@ page import = "product.ProductDAO" %>
   <%@ page import = "java.util.*" %>
   
<jsp:useBean id="userinfo" class="user.CustomerBean" scope="session"></jsp:useBean>
<jsp:useBean id="toprecommend" class="java.util.ArrayList" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
table{
	border:1px ;
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


<title>Cosmetic Friends</title>
</head>
<body>
<font face="맑은 고딕">
<%
	String id;
	id = userinfo.getId();
%>

	<table border="1" bordercolor="#FFFFFF">
		<tr>
			<th colspan="2" class="titlebar" bordercolor="#FFFFFF" colspan="2">
				<jsp:include page="titlebar2.jsp"></jsp:include>
			</th>

		</tr>
		<tr>
		<td colspan="2" align="center" bordercolor="#FFFFFF"><br><%=userinfo.getId() %>님 환영합니다!!!</td>
		</tr>		
		<tr>
			<th class="categorylist" bordercolor="#FFFFFF">
				<jsp:include page="product_category.html"></jsp:include>
			</th>
			
			<td bordercolor ="#DDDDDD">
			<table>
				<tr colspan="5">
				<td align="center">
				<h2><%=userinfo.getId() %>님의 연령대에 맞는 제품! </h2>
				<hr size=2 color=gray noshade>
				</td>
				</tr>
				<tr>
					<%
					for(int i=0; i<5; i++){
						ProductBean pro = (ProductBean)toprecommend.get(i);
						
					%>
				
					<td>
					<table>	
						<tr>
							<td width="200px">		
								<%=pro.getPname() %>
							</td>
						</tr>
						<tr>
							<td width="200px">
								<a href="/CosmeticFriends/ProductControl?action=product_view&pname=<%=pro.getPname() %>">
								<img class="img1" src="productImages/<%=pro.getPname()%>.jpg" height=200>
								</a>
							</td>
						</tr>
					</table>
					
					<%
						}
					%>
					</td>
				</tr>					
			</table>
			</td>
		</tr>	
		<tr>
			<th class="underbar" colspan="2" bordercolor="#FFFFFF"> 
				<jsp:include page="underbar.html"></jsp:include>
			</th>
		</tr>
	</table>
	</font>
</body>
</html>
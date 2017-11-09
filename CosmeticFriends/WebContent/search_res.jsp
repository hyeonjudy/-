<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ProductBean, java.util.ArrayList"%>
<jsp:useBean id="userinfo" class="user.CustomerBean" scope="session"></jsp:useBean>
<jsp:useBean id="searchlist" class="java.util.ArrayList" scope="request"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	if(userinfo.getId()==null){
	out.println("<script>alert('로그인을 해주세요');history.back();</script>");
	}	
%>
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
	position : absolute;
	left:20px;
	width:20px;
	height:20px;
}
</style>
<title>기능별 검색결과</title>
</head>
<body>
<font face="맑은 고딕">
		<table border="1">
		<tr>
			<td class="titlebar" bordercolor="#FFFFFF" colspan="2" bordercolor="#FFFFFF">
				<jsp:include page="titlebar2.jsp"></jsp:include>
			</td>

		</tr>
		<tr>
		<td bordercolor="#FFFFFF">
			<jsp:include page="product_category.html"></jsp:include>
		</td>
		<td bordercolor="#FFFFFF">
			<table>
				<tr><td colspan="5" bordercolor="#FFFFFF"><%= request.getParameter("search_fuc") %>기능이 검색된 결과
				<hr size=2 color=gray noshade ></td></tr>
				
				<%
				for(int i=0;i<searchlist.size();i+=5){
				%>
				<tr>
				<% for(int j=0; j<5; j++){if((i+j)==searchlist.size())break;%>
					<td bordercolor="#FFFFFF">
					<table>
						<tr>
							<td bordercolor="#DDDDDD" align="center">
								<a href="/CosmeticFriends/ProductControl?action=product_view&pname=<%=searchlist.get(i+j) %>">
								<img src="productImages/<%=searchlist.get(i+j)%>.jpg" height=200></a>
							</td>
						</tr>
						<tr>
							<td bordercolor="#FFFFFF" width="200px" align="center">
								<%=searchlist.get(i+j) %>
							</td>
						</tr>
					</table>
					</td>
				<%} %>
				</tr>
				<%}%>
			</table>
					
		</td>
		</tr>
		<tr>
			<th class="underbar" colspan="2" bordercolor="#FFFFFF"s> 
				<jsp:include page="underbar.html"></jsp:include>
			</th>
		</tr>
</table>
</font>
</body>
</html>
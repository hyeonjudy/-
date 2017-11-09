<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ProductBean"%>
<jsp:useBean id="categorylist" class="java.util.ArrayList" scope="request"></jsp:useBean>
<jsp:useBean id="userinfo" class="user.CustomerBean" scope="session"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% 
	String category = request.getParameter("category");
	if(userinfo.getId()==null){
		out.println("<script>alert('로그인을 해주세요');history.back();</script>");
	}
%>
<title>카테고리 리스트 - <%=category%></title>
<style type="text/css">
 /*<![CDATA[*/
 table.t1 { 
	padding:0;
	margin:0;
 	position: relative;
	left: 5em;
	width: 50em;
	}

 .t1 td {border:1px solid #FFFFFF;padding:7px}
 .t1 th {border-width:1px; border-style:solid; border-color:#DDDDDD; padding:7px; text-align:center; width:200px}

 /*]]>*/
 h3{
 	position: relative;
 	left: 4em;
	width: 50em;
 }
 hr.hr1{
 	position: relative;
	top: 2px;
	left: 4em;
	width: 1200px;
	align:"right";
	height:3px;
 }
 img.img2{
 	border-style:solid;
 	border-color:#DDDDDD;
	border-width:1px;
	margin:1px;"
 }
 	
</style>

</head>
<body>
<FONT FACE="맑은 고딕">
	<jsp:include page="titlebar2.jsp"></jsp:include>
	
	
	<table>
	<tr>
		<td valign="top"><jsp:include page="product_category.html"></jsp:include></td>
		<td>
		
		<table class="t1" border="1" style="border-collapse: collapse" bordercolor="#FFFFFF">
		<tr>
			<h3><%=category%></h3>
			<hr class="hr1" size="2" noshade>
		</tr>
			<%
				for(int i=0; i<categorylist.size();i++){
					ProductBean pb = (ProductBean)categorylist.get(i);
			%>
			<tr>
				<th rowspan="3" ><a href="/CosmeticFriends/ProductControl?action=product_view&pname=<%=pb.getPname() %>">
					 <img class="img1" src="productImages/<%=pb.getPname()%>.jpg" height=200></a></th>
				<td align="right" valign="bottom" width="70px">상품명 : </td>
				<td valign="bottom"><a href="/CosmeticFriends/ProductControl?action=product_view&pname=<%=pb.getPname() %>">
					 <%=pb.getPname() %></a></td>
			</tr>
			<tr>
				<td align="right" width="70px">가격 : </td>
				<td ><%=pb.getPrice()%>원</td>
			</tr>
			<tr>
				<td align="right" valign="top" width="70px">브랜드 : </td>
				<td valign="top"><%=pb.getBrand()%></td>
			</tr>
			<%
				}
			%>
			
			<tr>
			<td colspan="3">
			<jsp:include page="underbar.html"></jsp:include>
			</td>
		</table>
		</td>
		</tr>
	</table>
	</FONT>	
</body>
</html>
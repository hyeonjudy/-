<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ComponentBean"%>
<jsp:useBean id="componentlist" class="java.util.ArrayList" scope="request"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
table. t1{
	position: absolute;
 	left: 10em;
	width: 50em;
	border-style: dotted;
	border-color: olive;
}
table. td{
	border-style: dotted;
	border-color: olive;
	padding:3px;
}
table. tfoot{
	border-color: "#FFFFFF";
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성분 상세보기</title>
</head>
<body>
<font face="맑은 고딕">

<table>
<tr>
	<td colspan="2">
		<jsp:include page="titlebar2.jsp"></jsp:include>
	</td>
</tr>
<tr>
	<td valign="top">
		<jsp:include page="product_category.html"></jsp:include>
	</td>

<td>
	<table class="t1" border="1" style="border-collapse: collapse">
		<thead>
			<tr>
				<td align="center">성분명	</td>
				<td align="center">EWG 등급</td>
				<td align="center">배합 목적</td>
				<td align="center">20가지 주의성분</td>
				<td align="center">알레르기 주의성분</td>
				<td align="center">피부타입별 특이성분</td>
				<td align="center">기능성 성분 여부</td>
			</tr>
		</thead>
		<tbody>
		<%
			for(int i = 0;i<componentlist.size();i++){	
				ComponentBean component = (ComponentBean)componentlist.get(i);
		%>
			<tr>	
				<td align="center" width="230px"><%= component.getCname() %></td>
				<td align="center" width="80px"><%= component.getDangerNum() %></td>
				<td width="300px"><%= component.getDetails() %></td>
				<td width="250px"><% if(component.getDanger20()==null||component.getDanger20().equals("(null)")){%>
					<%}else %><%=component.getDanger20()%></td>
				<td width="150px"><% if(component.getAllergy()==null||component.getAllergy().equals("(null)")){%>
					<%}else %><%=component.getAllergy()%></td>
				<td width="250px"><% if(component.getTypedetails()==null||component.getTypedetails().equals("(null)")){%>
					<%}else %><%=component.getTypedetails()%></td>
				<td width="180px"><% if(component.getFunctional()==null||component.getFunctional().equals("(null)")){%>
					<%}else %><%=component.getFunctional()%></td>
			</tr>
		<%} %>
		</tbody>
		<tfoot>
			<tr>
				<td bordercolor="#FFFFFF"></td>
				<td bordercolor="#FFFFFF" colspan="5" width="500px">
					<jsp:include page="underbar.html"></jsp:include>
				</td>
				<td bordercolor="#FFFFFF"></td>
			</tr>
		</tfoot>
	</table>
	</td>
	</tr>
</table>
</font>

</body>
</html>
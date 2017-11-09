<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문완료</title>
</head>
<body>
	<font face="맑은 고딕">
	<table border="1" bordercolor="#FFFFFF">
		<tr>
			<th bordercolor="#FFFFFF" colspan="2">
				<jsp:include page="titlebar2.jsp"></jsp:include>
			</th>
		</tr>
		<tr>
			<th class="categorylist" bordercolor="#FFFFFF">
				<jsp:include page="product_category.html"></jsp:include>
			</th>
			
			<td bordercolor="#FFFFFF">
				<% request.setCharacterEncoding("UTF-8"); 
				out.println("제품 : "+request.getParameter("pname")+"<br>");
				String item[] =request.getParameterValues("chk_func");
				out.print("선택하신 기능 <br>");
				for(int i =0; i<item.length;i++){
					out.print(item[i]+", ");
				}
				out.print(" <br>에 대한 주문이 완료되었습니다.");
				%>
				<br><br>
				<input type="button" name="back" value="뒤로가기" onClick="javascript:history.go(-1);"/>
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
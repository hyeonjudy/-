<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ProductBean, product.ComponentBean, java.util.ArrayList"%>
<jsp:useBean id="product" class="product.ProductBean" scope="request"></jsp:useBean>
<jsp:useBean id="userinfo" class="user.CustomerBean" scope="session"></jsp:useBean>

<jsp:useBean id="badcomponent" class="java.util.ArrayList" scope="session"></jsp:useBean>
<jsp:useBean id="goodcomponent" class="java.util.ArrayList" scope="session"></jsp:useBean>
<jsp:useBean id="danger20" class="java.util.ArrayList" scope="session"></jsp:useBean>
<jsp:useBean id="fuc" class="java.util.ArrayList" scope="session"></jsp:useBean>
<jsp:useBean id="recommend" class="java.util.ArrayList" scope="session"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	if(userinfo.getId()==null){
	out.println("<script>alert('로그인을 해주세요');history.back();</script>");
	}	
%>
<title>제품 상세 - <%=product.getPname()%></title>
</head>
<style type="text/css">
 table.t1 { 
	padding:0;
	margin:0;
 	position: relative;
 	left: 5em;
	width: 50em;
	}

 .t1 td {border:1px solid #FFFFFF}
 .t1 th {border-width:1px; border-style:solid; border-color:#DDDDDD; padding:7px;}
hr.hr1{
 	position: relative;
	top: 2px;
	width: 1200px;
	align:"right";
	height:3px;
 }
 hr.hr2{
 	position: relative;
	top: 2px;
	left: 0px;
	align:"left";
	height:3px;
 }
</style>
<body>
<FONT FACE="맑은 고딕" size="4px">
<%
	
	String id;
	id = userinfo.getId();	
	
%>
<jsp:include page="titlebar2.jsp"></jsp:include>
	<table>
		<tr>
			<td align="right" valign="top"><jsp:include page="product_category.html"></jsp:include></td>
			<td>
			<table class="t1" border="1" style="border-collapse: collapse" bordercolor="#FFFFFF">
				<tr>
					<th rowspan="2" align="center" width="200px">
						<img src="productImages/<%=product.getPname()%>.jpg" height=200>
					</th>
					<td align="left" height="70px">
						<h2>&nbsp;<%=product.getPname()%></h2>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top">
						&nbsp;판매가 : <%=product.getPrice() %>원
					</td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
					<td colspan = "2">
						<h3><img src="images/product_01.png" height=20> 상세 정보</h3>	
						<hr class="hr1" size="2" noshade>
					</td>
				</tr>
				<tr>
					<td align="center" width="20px" height="50px">용량	</td>
					<td align="left" ><%=product.getCapacity() %>ml</td>
				</tr>
				<tr>
					<td align="center" width="20px" height="50px">설명	</td>
					<td align="left" ><%=product.getDetails() %></td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
					<td align="center" width="20px">성분	</td>
					<td align="left" >
					<%
						ArrayList<String> componentlist = product.getComponent();
						for(int i=0; i<componentlist.size()-1;i++){
					%>
					<%=componentlist.get(i) %>&nbsp;,
					<%} %><%=componentlist.get(componentlist.size()-1)%>
					</td>
				</tr>
				<tr>
					<td align ="right" colspan = "2">
					<span style="line-height:50%"><br></span>
					<a href="/CosmeticFriends/ComponentControl?pname=<%=product.getPname()%>"><img src="images/product_10.png" height=30></a>
					</td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
					<td colspan = "2">
						<h3><img src="images/product_02.png" height=20> <%=userinfo.getId() %> 고객님을 위한 맞춤 정보</h3>
						<hr class="hr1" size="2" noshade>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						&nbsp;&nbsp;<img src="images/product_03.png" height=30>
						<%=userinfo.getSkintype() %> 피부에 좋지 않아요!
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<% 
						if(badcomponent!=null){
							for(int j=0; j<badcomponent.size();j++){ 
								ComponentBean component = (ComponentBean)badcomponent.get(j);
								out.print("&nbsp;&nbsp;&nbsp;&nbsp;"+component.getCname()+" : ");
								String[] details = component.getTypedetails().split("&");
								for(int k=0;k<details.length;k++){
									if(details[k].contains("피하세요")&&details[k].contains(userinfo.getSkintype()))
										out.print(details[k]+"<br>");
								}
							}
						}
					%>
					</td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
					<td colspan="2">
						&nbsp;&nbsp;<img src="images/product_04.png" height=30>
						<%=userinfo.getSkintype() %> 피부에 좋아요!
					</td>
				</tr>
				<tr>
					<td colspan="2">
					
					<% 
						if(goodcomponent!=null){
							for(int j=0; j<goodcomponent.size();j++){ 
								ComponentBean component = (ComponentBean)goodcomponent.get(j);
					
							out.print("&nbsp;&nbsp;&nbsp;&nbsp;"+component.getCname()+" : "); 
							String[] details = component.getTypedetails().split("&");
								for(int k=0;k<details.length;k++){
									if(details[k].contains("좋아요")&&details[k].contains(userinfo.getSkintype()))
										out.print(details[k]+"<br>");
								}
							}
						}
					%>
					</td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
					<td colspan="2">
						&nbsp;&nbsp;<img src="images/product_05.png" height=30>
						20가지 유해성분이 포함되었어요!
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<%
						if(danger20!=null){
							for(int j=0; j<danger20.size();j++){ 
								ComponentBean component = (ComponentBean)danger20.get(j);
								out.print("&nbsp;&nbsp;&nbsp;&nbsp;"+component.getCname()+" : "); 
								out.print(component.getDanger20()+"<br>");
							} 
						}
						%>
					</td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
					<td colspan="2">
						&nbsp;&nbsp;<img src="images/product_06.png" height=30>
						기능성 성분이에요!
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<%
						if(fuc!=null){
							for(int j=0; j<fuc.size();j++){ 
								ComponentBean component = (ComponentBean)fuc.get(j);
								out.print("&nbsp;&nbsp;&nbsp;&nbsp;"+component.getCname()+" : "); 
								out.print(component.getFunctional()+"<br>");
							} 
						}
						%>
					</td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
					<td colspan = "2">
						<h3><img src="images/product_07.png" height=20> 원하는 기능을 선택해주세요</h3>
						<hr class="hr1" size="2" noshade>
					</td>
				</tr>
				<tr>
				<%request.setCharacterEncoding("UTF-8");  %>
					<td colspan="2">
					<form action="order.jsp" method="post" accept-charset="utf-8">
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chk_func" value="미백">미백<br><span style="line-height:50%"><br></span>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chk_func" value="탄력/주름개선">탄력/주름개선<br><span style="line-height:50%"><br></span>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chk_func" value="여드름/트러블개선">여드름/트러블개선<br><span style="line-height:50%"><br></span>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chk_func" value="수분/보습">수분/보습<br><span style="line-height:50%"><br></span>
						<br>
						<input type="hidden" name="pname" value="<%=product.getPname()%>">
						<input type="submit" value="주문하기">
						<br>
					</form>
					</td>
				</tr>
				<tr><td colspan="2"><br></td></tr>
				<tr><td colspan="2"><br></td></tr>
				<tr>
					<td colspan="2">
						<jsp:include page="underbar.html"></jsp:include>
					</td>
				</tr>
				</table>
			</td>
			<td valign="top" width="300px">
			<table class="t1" width="300px">
				<tr>
					<td>
					<h3><img src="images/product_08.png" height=20><%=userinfo.getId() %> 고객님을 위한 추천 제품</h3>
					<hr align="left" style="width: 50%;" size="2" noshade>
					</td>
				</tr>
				<tr>
					<td>
						<%
							if(userinfo.getSelectedfuc1()!=null){
						%>
							<table>
								<tr><td><%=userinfo.getSelectedfuc1() %> 기능에 관련된 추천 제품</td></tr>
								
								<%
								for(int i=0;i<3;i++){
								%>
								<tr>
									<td bordercolor="#DDDDDD">
										<a href="/CosmeticFriends/ProductControl?action=product_view&pname=<%=recommend.get(i) %>">
										<img src="productImages/<%=recommend.get(i)%>.jpg" height=200></a>
									</td>
								</tr>
								<tr>
									<td bordercolor="#FFFFFF">
										
									</td>
								</tr>
								<%}%>
							</table>
						<%}%>
						
					</td>
				</tr>
				<tr>
					<td>
						<%
							if(userinfo.getSelectedfuc2()!=null){
						%>
							<table>
								<tr><td><%=userinfo.getSelectedfuc2() %> 기능에 관련된 추천 제품</td></tr>
								
								<%
								int a, b;
								if(userinfo.getSelectedfuc1()==null){ a = 0; b = 3;}
								else{ a = 3; b = 6;}
								for(int i=a;i<b;i++){
								%>
								<tr>
									<td bordercolor="#DDDDDD">
										<a href="/CosmeticFriends/ProductControl?action=product_view&pname=<%=recommend.get(i) %>">
										<img src="productImages/<%=recommend.get(i)%>.jpg" height=200></a>
									</td>
								</tr>
								<tr>
									<td bordercolor="#FFFFFF">
										
									</td>
								</tr>
								<%}%>
							</table>
						<%}%>
					</td>
				</tr>
			</table>
			</td>
			</tr>
	</table>
	
</FONT>
</body>
</html>
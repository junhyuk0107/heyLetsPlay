<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="hotel.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String loginRight = request.getParameter("loginRight");
if(id == "" || passwd == "" || loginRight == ""){
	out.print("<script>alert('모든 정보를 입력해야합니다'); window.history.go(-1);</script>");
	return;
}
DB.loadConnect();
if(loginRight.isEmpty()) {
	out.print("<script>alert('손님과 점주중에 선택하세요'); window.history.go(-1);</script>"); return;
}
if(loginRight.equals("customer")){
	//고객 로그인
	Customer customer = DB.selectCustomer(id, passwd);
	if(customer == null){
		out.print("<script>alert('id 또는 password가 올바르지 않습니다.'); window.history.go(-1);</script>"); return;
	}
	out.print(customer);
	session.setAttribute("loginRight", "customer");	//고객이 로그인한것임
	session.setAttribute("customer", customer);
	response.sendRedirect("customerIndex.jsp");	//고객 인덱스 페이지로 리다이렉트
}
else if(loginRight.equals("hotel_owner")){
	//점주 로그인
	//Customer customer = null;
	HotelOwner hotel_owner = DB.selectHotelOwner(id, passwd);
	if(hotel_owner == null){
		out.print("<script>alert('id 또는 password가 올바르지 않습니다.'); window.history.go(-1);</script>"); return;
	}
	out.print(hotel_owner);
	session.setAttribute("loginRight", "hotelOwner");	//점주가 로그인한것임
	session.setAttribute("hotelOwner", hotel_owner);
	response.sendRedirect("hostIndex.jsp");		//점주 인덱스 페이지로 리다이렉트
}
else{
	out.print("<script>alert('손님과 점주중에 선택하세요'); window.history.go(-1);</script>"); return;
}
%>
</body>
</html>
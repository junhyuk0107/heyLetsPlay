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
if(loginRight.equals("customer")){
	//고객 로그인
	DB.loadConnect();
	Customer customer = DB.selectCustomer(id, passwd);
	if(customer == null){
		out.print("<script>alert('id 또는 password가 올바르지 않습니다.'); window.history.go(-1);</script>"); return;
	}
	out.print(customer);
}
else if(loginRight.equals("hotel_owner")){
	//점주 로그인
	
}
else{
	out.print("<script>alert('손님과 점주중에 선택하세요'); window.history.go(-1);</script>"); return;
}
%>
</body>
</html>
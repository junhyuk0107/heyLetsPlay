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
	String name = request.getParameter("name");
	String cellphone = request.getParameter("cellphone");
	String email = request.getParameter("email");
	//out.print(id+passwd+name+cellphone+email);
	Customer customer = new Customer(id, passwd, name, cellphone, email);
	DB.loadConnect("hotelreserve");
	int cnt = DB.insertCustomer(customer);
	if(cnt == 0){
		out.print("<script>alert('id가 겹치거나 에러가 일어났습니다'); window.history.go(-1);</script>");
	}
	else
		out.print("<script>alert('회원가입 성공'); location.href='index.html';</script>");
	%>
</body>
</html>
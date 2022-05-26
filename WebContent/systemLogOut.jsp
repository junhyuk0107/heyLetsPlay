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
//모든 세션값을 삭제함
session.removeAttribute("loginRight");
session.removeAttribute("customer");
session.removeAttribute("hotelOwner");

//인텍스 페이지로 리다이렉트
response.sendRedirect("index.jsp");
%>
</body>
</html>
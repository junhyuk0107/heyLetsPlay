<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="hotel.*" %>
<!DOCTYPE html>
<%
//고객 로그인이 되어있지 않으면 index페이지로 돌아감
if((session.getAttribute("loginRight") == null) || (session.getAttribute("loginRight").equals("hotelOwner")))
	response.sendRedirect("index.jsp");
String customerName = null; 
if(session.getAttribute("customer") != null)
	customerName = ((Customer)session.getAttribute("customer")).get_name();
%>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>호텔 예약 홈페이지</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
      <!-- css 순서도 우선 순위에 영향을 미침 -->
      <link rel="stylesheet" href="style.css">
      <script src="hotelReserve.js"></script>
   </head>
   <body>
      <!-- 네비게이션 바-->
      <nav class="navbar">
         <div class="navbar__logo">
            <span>&#x2600;</span> <!-- &#x : 16진수 표기-->
            <a href="index.jsp">Hey!놀자</a>
         </div>
         <ul class="navbar__menu">
            <li><a href="customerHotelSelect.jsp">호텔선택</a></li>
            <li><a href="customerReservationCheck.jsp">예약내역확인</a></li>
            <li><a href="customerReservationCancellationCheck.jsp">취소내역확인</a></li>
         </ul>
         <div class="navbar__icons">
            <li><a href="systemLogOut.jsp">로그아웃</a></li>
         </div>
      </nav>
      <div id="home">
         <br>
         <h1><%=customerName %>님 방문을 환영합니다.</h1>
         <!-- Carousel -->
         <div  id="demo" class="carousel  slide" data-bs-ride="carousel">
            <!-- Indicators/dots -->
            <div class="carousel-indicators">
               <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
               <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
               <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            </div>
            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <img src="https://picsum.photos/1200/400?random=9" alt="Los Angeles" class="d-block" style="width:100%">
               </div>
               <div class="carousel-item">
                  <img src="https://picsum.photos/1200/400?random=10" alt="Chicago" class="d-block" style="width:100%">
               </div>
               <div class="carousel-item">
                  <img src="https://picsum.photos/1200/400?random=11" alt="New York" class="d-block" style="width:100%">
               </div>
            </div>
            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
            </button>
         </div>
      </div>
   </body>
</html>
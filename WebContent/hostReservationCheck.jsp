<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, hotel.*" %>
<!DOCTYPE html>
<%
//호텔 주인이 로그인 되어있지 않으면 index페이지로 돌아감
if((session.getAttribute("loginRight") == null) || (session.getAttribute("loginRight").equals("customer")))
	response.sendRedirect("index.jsp");
String hostName = null;
if(session.getAttribute("hotelOwner") != null)
	hostName = ((HotelOwner)session.getAttribute("hotelOwner")).get_name();
%>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>예약내역확인</title>
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
            <li><a href="hostReservationCheck.jsp">손님 예약내역확인</a></li>
            <li><a href="hostReservationCancellationCheck.jsp">손님 예약취소내역확인</a></li>
         </ul>
         <div class="navbar__icons">
            <li><a href="systemLogOut.jsp">로그아웃</a></li>
         </div>
      </nav>
      
      <div class="row">
         <%
         DB.loadConnect();
         Vector<Reservation> reservations = DB.selectReservationsByName(hostName);
         for(Reservation reservation : reservations){
        	 out.println("<div class='col-sm-4'>");
        	 out.println("	<div class='card'>");
        	 out.println("		<img class='card-img-top' src='img/"+reservation.get_hotel_name()+".jpg' alt='Card image'>");
        	 out.println("		<div class='card-body'>");
    	     out.println("			<h4 class='card-title'>예약 상세</h4>");
    	     out.println("		</div>");
    	     out.println("		<ul class='list-group list-group-flush'>");
    	     out.println("			<li class='list-group-item'>호텔이름: "+reservation.get_hotel_name()+"</li>");
    	     out.println("			<li class='list-group-item'>방: "+reservation.get_room_num()+"호</li>");
    	     out.println("			<li class='list-group-item'>예약일: "+reservation.get_reserve_date()+"</li>");
    	     out.println("			<li class='list-group-item'>시작일: "+reservation.get_start_date_of_use()+"</li>");
    	     out.println("			<li class='list-group-item'>종료일: "+reservation.get_end_of_use_date()+"</li>");
    	     out.println("			<li class='list-group-item'>지불타입: "+reservation.get_payment_type()+"</li>");
    	     out.println("			<li class='list-group-item'>인원수: "+reservation.get_number_of_people()+"</li>");
    	     out.println("			<li class='list-group-item'>업주: "+DB.getHotelOwnerNameByHotelName(reservation.get_hotel_name())+"</li>");
    	     out.println("			<button class='btn btn-danger collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#collapse"+reservations.indexOf(reservation)+"' aria-expanded='false'>예약 취소</button>");
    	     out.println("		</ul>");
        	 out.println("	</div>");
        	 out.println("</div>");
         }
         %>
      </div>
      
   </body>
</html>
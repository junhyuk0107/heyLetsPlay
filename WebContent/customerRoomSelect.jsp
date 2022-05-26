<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, hotel.*" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>방 선택</title>
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
            <a href="systemLogOut.jsp">로그아웃</a>
         </div>
      </nav>
      
      <div class="row">
         <%
         String hotelname = request.getParameter("hotelname");
         DB.loadConnect();
         Vector<Room> rooms = DB.selectRooms(hotelname);
         for(Room room : rooms){
        	 out.println("<div class='col-sm-2'>");
        	 out.println("	<div class='card'>");
        	 out.println("		<img class='card-img-top' src='https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159__340.jpg' alt='Card image'>");
        	 out.println("		<div class='card-body'>");
    	     out.println("			<h4 class='card-title'>"+room.get_hotel_name()+" "+room.get_room_num()+"호</h4>");
    	     out.println("		</div>");
    	     out.println("		<ul class='list-group list-group-flush'>");
    	     out.println("			<li class='list-group-item'>가격: "+room.get_price()+"</li>");
    	     out.println("			<li class='list-group-item'>면적: "+room.get_room_area()+"</li>");
    	     out.println("			<li class='list-group-item'>등록일: "+room.get_registration_date()+"</li>");
    	     out.println("			<li class='list-group-item'>업주: "+DB.getHotelOwnerNameByHotelName(room.get_hotel_name())+"</li>");
    	     out.println("			<button class='btn btn-primary collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#collapse"+room.get_room_num()+"' aria-expanded='false'>방 선택</button>");
    	     out.println("		</ul>");
    	     out.println("		<div class='collapse' id='collapse"+room.get_room_num()+"' style=''>");
    	     out.println("			<div class='card-body'>");
    	     out.println("				<form action='systemRoomReserve.jsp' method='post'>");
    	     out.println("					<label>호텔이름</label>");
    	     out.println("					<input type='text' class='form-control' name='hotel_name' value='"+hotelname+"' readonly>");
    	     out.println("					<label>방 호수</label>");
    	     out.println("					<input type='text' class='form-control' name='room_num' value='"+room.get_room_num()+"' readonly>");
    	     out.println("					<label>시작날짜</label>");
    	     out.println("					<input type='date' class='form-control' name='start_date_of_use' min='2022-01-01' max='2022-12-31'>");
    	     out.println("					<label>마지막날짜</label>");
    	     out.println("					<input type='date' class='form-control' name='end_of_use_date' min='2022-01-01' max='2022-12-31'>");
    	     out.println("					<label>결제종류</label>");
    	     out.println("					<select class='form-select' name='payment_type'>");
    	     out.println("						<option value='신용카드' selected>신용카드</option>");
    	     out.println("						<option value='현금'>현금</option>");
    	     out.println("					</select>");
    	     out.println("					<label>인원수</label>");
    	     out.println("					<select class='form-select' name='number_of_people'>");
    	     out.println("						<option value='1' selected>1</option>");
    	     out.println("						<option value='2'>2</option>");
    	     out.println("						<option value='3'>3</option>");
    	     out.println("						<option value='4'>4</option>");
    	     out.println("						<option value='5'>5</option>");
    	     out.println("					</select>");
    	     out.println("					<button class='btn btn-primary' type='submit'>예약</button>");
    	     out.println("				</form>");
    	     out.println("			</div>");
    	     out.println("		</div>");
    	     Vector<Reservation> reservations = DB.selectReservationsByRoom(room);
    	     out.println("		<ul class='list-group list-group-flush'>");
    	     for(Reservation reservation: reservations)
    	     out.println("			<li class='list-group-item'>예약된 날: "+reservation.get_start_date_of_use()+" ~ "+reservation.get_end_of_use_date()+"</li>");
    	     out.println("		</ul>");
        	 out.println("	</div>");
        	 out.println("</div>");
         }
         %>
      </div>
   </body>
</html>
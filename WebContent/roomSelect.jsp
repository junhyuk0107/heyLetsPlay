<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, hotel.*" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>방 선택</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <!-- css 순서도 우선 순위에 영향을 미침 -->
      <link rel="stylesheet" href="style.css">
      <script>
         function selectHotel(hotelname){
        	 location.href = "roomSelect.jsp?hotelname="+hotelname;
         }
      </script>
   </head>
   <body>
      <!-- 네비게이션 바-->
      <nav class="navbar">
         <div class="navbar__logo">
            <span>&#x2600;</span> <!-- &#x : 16진수 표기-->
            <a href="guestLoginpage.html">Hey!놀자</a>
         </div>
         <ul class="navbar__menu">
            <li><a href="hotelSelect.jsp">호텔선택</a></li>
            <li><a href="ReserveCheck.html">예약내역확인</a></li>
            <li><a href="ReserveCheck.html">예약취소하기</a></li>
         </ul>
         <div class="navbar__icons">
            <a href="index.html">로그아웃</a>
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
    	     out.println("			<h4 class='card-title'>"+room.get_room_num()+"호</h4>");
    	     out.println("		</div>");
    	     out.println("		<ul class='list-group list-group-flush'>");
    	     out.println("			<li class='list-group-item'>가격: "+room.get_price()+"</li>");
    	     out.println("			<li class='list-group-item'>면적: "+room.get_room_area()+"</li>");
    	     out.println("			<li class='list-group-item'>등록일: "+room.get_registration_date()+"</li>");
    	     out.println("		</ul>");
    	     out.println("		<div class='card-body'>");
    	     out.println("			<a href='roomReserve.jsp?hotel_name="+hotelname+"&room_num="+room.get_room_num()+"' class='btn btn-primary'>방 선택</a>");
    	     out.println("		</div>");
        	 out.println("	</div>");
        	 out.println("</div>");
         }
         %>
      </div>
   </body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, hotel.*" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>방 예약</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <!-- css 순서도 우선 순위에 영향을 미침 -->
      <link rel="stylesheet" href="style.css">
   </head>
   <body>
   <%
   request.setCharacterEncoding("utf-8");
   String hotel_name = request.getParameter("hotel_name");
   String room_num = request.getParameter("room_num");
   String start_date_of_use = request.getParameter("start_date_of_use");
   String end_of_use_date = request.getParameter("end_of_use_date");
   String payment_type = request.getParameter("payment_type");
   String number_of_people = request.getParameter("number_of_people");
   
   java.util.Date date = new java.util.Date();
   java.sql.Date todayDate = new java.sql.Date(date.getTime());
   String reserve_date = todayDate.toString();	//현재 날짜
   
   if(hotel_name == null || hotel_name.equals("") || room_num == null || room_num.equals("") || start_date_of_use == null || start_date_of_use.equals("") ||
		   end_of_use_date == null || end_of_use_date.equals("") ||payment_type == null || payment_type.equals("") || number_of_people == null || number_of_people.equals("")){
	   out.print("<script>alert('모든 값을 입력해햐 합니다'); window.history.go(-1);</script>"); return;
   }
   Reservation reservation = new Reservation(hotel_name, Integer.parseInt(room_num), ((Customer)session.getAttribute("customer")).get_c_id(), reserve_date, start_date_of_use, end_of_use_date, payment_type, Integer.parseInt(number_of_people));
   DB.loadConnect();
   int cnt = DB.insertReservation(reservation);
   if(cnt == 1) {
	   
   }
   else {
	   
   }
   out.print(cnt + "<br>");
   out.print(start_date_of_use+"<br>");
   out.print(end_of_use_date+"<br>");
   out.print(reserve_date+"<br>");
   
   %>
   </body>
</html>
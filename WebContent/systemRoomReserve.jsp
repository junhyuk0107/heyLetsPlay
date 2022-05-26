<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, hotel.*" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
   <head>
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
	   response.sendRedirect("customerReservationCheck.jsp");
   }
   else {
	   out.print("<script>alert('날짜가 겹칩니다.'); window.history.go(-1);</script>"); return;
   }
   %>
   </body>
</html>
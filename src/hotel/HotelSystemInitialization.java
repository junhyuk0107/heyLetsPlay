package hotel;

import java.sql.*;

public class HotelSystemInitialization
{	
	static String[] createDatabaseCreateTableSqls = {
		"drop database if exists hotelreserve;",
		"create database hotelreserve;",
		"use hotelreserve;",
		
		"drop table if exists customer;",
		"create table customer("+
			"c_id varchar(40),"+
			"passwd varchar(40),"+
			"name varchar(40),"+
			"cellphone varchar(40),"+
			"email varchar(40),"+
			"primary key(c_id)"+
		");",
		
		"drop table if exists hotel_owner;",
		"create table hotel_owner("+
		   "h_id varchar(40),"+
		   "passwd varchar(40),"+
		   "name varchar(40),"+
		   "cellphone varchar(40),"+
		   "registration_number varchar(40),"+
		   "primary key(H_ID)"+
		");",
		
		"drop table if exists hotel;",
		"create table hotel("+
		   "hotel_name varchar(40),"+
		   "address varchar(40),"+
		   "phone_num varchar(40),"+
		   "stars int,"+
		   "h_id varchar(40),"+
		   "registration_date date,"+
		   "primary key(hotel_name)"+
		");",
		
		"drop table if exists room;",
		"create table room("+
		   "hotel_name varchar(40),"+
		   "room_num int,"+
		   "registration_date date,"+
		   "bed_num int,"+
		   "price int,"+
		   "room_area int,"+
		   "primary key(hotel_name, room_num)"+
		");",
		
		"drop table if exists reservation;",
		"create table reservation("+
		   "reservation_num int,"+
		   "hotel_name varchar(40),"+
		   "room_num int,"+
		   "c_id varchar(40),"+
		   "reserve_date date,"+
		   "start_date_of_use date,"+
		   "end_of_use_date date,"+
		   "payment_type varchar(40),"+
		   "number_of_people int,"+
		   "primary key(reservation_num)"+
		");",
		
		"drop table if exists reservationCancellation;",
		"create table reservationCancellation("+
		   "reservation_cancellation_num int,"+
		   "cancellation_charge int,"+
		   "cancellation_date date,"+
		   "hotel_name varchar(40),"+
		   "room_num int,"+
		   "c_id varchar(40),"+
		   "reserve_date date,"+
		   "start_date_of_use date,"+
		   "end_of_use_date date,"+
		   "payment_type varchar(40),"+
		   "number_of_people int,"+
		   "primary key(reservation_cancellation_num)"+
		");"
	};
	
	public static void main(String[] args) {
		createInitialHotelDatabase();
		System.out.print("asdfasdf");
	}
	static void createInitialHotelDatabase() {
		DB.loadConnect("mysql");
		for (String sql : createDatabaseCreateTableSqls) {
			DB.executeAnyQuery(sql);
		}
	}
}
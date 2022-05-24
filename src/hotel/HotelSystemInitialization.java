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
		
		"drop table if exists reservation_cancellation;",
		"create table reservation_cancellation("+
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
	static String[] insertDefaultDataSqls= {
			"insert into customer values('guest1', '" + "passwd6".hashCode() + "', '나수영', '010-1111-1111', 'nsy1111@gmail.com');",
			"insert into customer values('guest2', '" + "passwd7".hashCode() + "', '이모라', '010-1234-1171', 'emr1111@gmail.com');",
			"insert into customer values('guest3', '" + "passwd8".hashCode() + "', '최영재', '010-5678-1311', 'cyj1111@gmail.com');",
			"insert into customer values('guest4', '" + "passwd9".hashCode() + "', '전새롬', '010-3344-1181', 'jsr1111@gmail.com');",
			"insert into customer values('guest5', '" + "passwd10".hashCode() + "', '나미리', '010-1566-1112', 'mmr1111@gmail.com');",
			
			"insert into hotel_owner values('owner1', '" + "passwd1".hashCode() + "', '홍길동', '010-1111-1111', '123456-1234567');",
			"insert into hotel_owner values('owner2', '" + "passwd2".hashCode() + "', '최주호', '010-1111-1111', '123456-1234567');",
			"insert into hotel_owner values('owner3', '" + "passwd3".hashCode() + "', '차승윤', '010-1111-1111', '123456-1234567');",
			"insert into hotel_owner values('owner4', '" + "passwd4".hashCode() + "', '전은재', '010-1111-1111', '123456-1234567');",
			"insert into hotel_owner values('owner5', '" + "passwd5".hashCode() + "', '최준혁', '010-1111-1111', '123456-1234567');",
			
			"insert into hotel values('한신호텔', '경기도 화성시 병점동', '010-1111-1111', 5, 'owner1', '2015-10-29');",
			"insert into hotel values('힐든 가든인 서울 강남', '서울특별시 서초구 강남대로 253', '010-1111-1111', 5, 'owner2', '2015-11-09');",
			"insert into hotel values('속초 컨피네스 비치 호텔', '강원도 속초시 해오름로 171', '010-1111-1111', 5, 'owner3', '2016-03-20');",
			"insert into hotel values('신라스테이 삼성', '서울특별시 강남구 영동대로 506', '010-1111-1111', 5, 'owner4', '2016-05-11');",
			"insert into hotel values('호텔 아르떼', '경기도 수원시 팔달구 인계로108번길 37', '010-1111-1111', 5, 'owner5', '2016-12-25');",
			
			"insert into room values('한신호텔', 101, '2015-10-29', 2, 80000, 18);",
			"insert into room values('한신호텔', 102, '2015-10-29', 2, 80000, 18);",
			"insert into room values('한신호텔', 201, '2015-10-29', 2, 80000, 18);",
			"insert into room values('한신호텔', 202, '2015-10-29', 2, 80000, 18);",
			"insert into room values('한신호텔', 301, '2015-10-29', 2, 80000, 18);",
			"insert into room values('한신호텔', 302, '2015-10-29', 2, 80000, 18);",
			"insert into room values('힐든 가든인 서울 강남', 101, '2015-11-09', 2, 120000, 22);",
			"insert into room values('힐든 가든인 서울 강남', 102, '2015-11-09', 2, 120000, 22);",
			"insert into room values('힐든 가든인 서울 강남', 103, '2015-11-09', 2, 120000, 22);",
			"insert into room values('속초 컨피네스 비치 호텔', 101, '2016-03-20', 3, 100000, 18);",
			"insert into room values('속초 컨피네스 비치 호텔', 102, '2016-03-20', 3, 100000, 18);",
			"insert into room values('신라스테이 삼성', 101, '2016-05-11', 2, 100000, 16);",
			"insert into room values('신라스테이 삼성', 102, '2016-05-11', 2, 100000, 16);",
			"insert into room values('신라스테이 삼성', 201, '2016-05-11', 2, 100000, 16);",
			"insert into room values('신라스테이 삼성', 202, '2016-05-11', 2, 100000, 16);",
			"insert into room values('호텔 아르떼', 101, '2016-12-25', 2, 90000, 20);",
			"insert into room values('호텔 아르떼', 102, '2016-12-25', 2, 90000, 20);",
			"insert into room values('호텔 아르떼', 103, '2016-12-25', 2, 90000, 20);",
			
			"insert into reservation_cancellation values(1, 20000, '2022-03-04', '한신호텔', 101, 'owner1', '2022-03-01', '2022-03-22', '2022-03-23', '신용카드', 3);",
			"insert into reservation_cancellation values(2, 25000, '2022-04-04', '신라스테이 삼성', 101, 'owner2', '2022-04-01', '2022-04-22', '2022-04-23', '신용카드', 3);"
	};
	public static void main(String[] args) {
		createInitialHotelDatabase();
		insertDefaultData();
		System.out.print("asdfasdf");
	}
	static void createInitialHotelDatabase() {
		DB.loadConnect("mysql");
		for (String sql : createDatabaseCreateTableSqls) {
			DB.executeAnyQuery(sql);
		}
	}
	static void insertDefaultData() {
		DB.loadConnect("hotelreserve");
		for (String sql : insertDefaultDataSqls) {
			DB.insertAnyQuery(sql);
		}
	}
}
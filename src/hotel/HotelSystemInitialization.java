package hotel;

import java.sql.*;

public class HotelSystemInitialization
{	
	static String[] createDatabaseCreateTableSqls = {
		"drop database if exists hotelreserve;",
		"create database hotelreserve;",
		"use hotelreserve;",
		
		"drop table if exists 고객;",
		"create table 고객("+
			"G_ID varchar(40),"+
			"PW varchar(40),"+
			"이름 varchar(40),"+
			"전화번호 varchar(40),"+
			"이메일 varchar(40),"+
			"primary key(G_ID)"+
		");",
		
		"drop table if exists 업주;",
		"create table 업주("+
		   "H_ID varchar(40),"+
		   "PW varchar(40),"+
		   "이름 varchar(40),"+
		   "전화번호 varchar(40),"+
		   "주민번호 varchar(40),"+
		   "primary key(H_ID)"+
		");",
		
		"drop table if exists 호텔;",
		"create table 호텔("+
		   "호텔이름 varchar(40),"+
		   "주소 varchar(40),"+
		   "전화번호 varchar(40),"+
		   "평점 int,"+
		   "H_ID varchar(40),"+
		   "등록날짜 date,"+
		   "primary key(호텔이름)"+
		");",
		
		"drop table if exists 방;",
		"create table 방("+
		   "호텔이름 varchar(40),"+
		   "방호수 int,"+
		   "등록날짜 date,"+
		   "침대개수 int,"+
		   "가격 int,"+
		   "방면적 int,"+
		   "primary key(호텔이름, 방호수)"+
		");",
		
		"drop table if exists 예약;",
		"create table 예약("+
		   "예약번호 int,"+
		   "호텔이름 varchar(40),"+
		   "방호수 int,"+
		   "G_ID varchar(40),"+
		   "예약날짜 date,"+
		   "사용시작일 date,"+
		   "사용종료일 date,"+
		   "결제종류 varchar(40),"+
		   "인원수 int,"+
		   "primary key(예약번호)"+
		");",
		
		"drop table if exists 예약취소;",
		"create table 예약취소("+
		   "예약취소번호 int,"+
		   "위약금 int,"+
		   "취소날짜 date,"+
		   "호텔이름 varchar(40),"+
		   "방호수 int,"+
		   "G_ID varchar(40),"+
		   "예약날짜 date,"+
		   "사용시작일 date,"+
		   "사용종료일 date,"+
		   "결제종류 varchar(40),"+
		   "인원수 int,"+
		   "primary key(예약취소번호)"+
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
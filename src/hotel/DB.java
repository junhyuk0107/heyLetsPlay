package hotel;

import java.sql.*;

public class DB
{
	static  Connection con = null;
	static String URL = "jdbc:mysql://localhost:3306/" ;
	
	//DB로드하는 함수. 성공하면 true 실패하면 false를 반환
	public static boolean loadConnect(String database)
	{
		try { Class.forName("com.mysql.jdbc.Driver");} 
		catch ( java.lang.ClassNotFoundException e ) {
			System.err.println("Driver load 에러: " + e.getMessage() );
			e.printStackTrace();                      
		}
		try {
			   con  = DriverManager.getConnection(URL + database, "root", "onlyroot");
			   return true;
		} 
		catch( SQLException e ) { System.err.println("conn 에러:" + e.getMessage() ); }
		return false;
	}
	
	//모든 sql을 실행하는 메소드
	public static void executeAnyQuery(String sql) 
	{
		try {
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.execute(sql);
		} catch(SQLException ex ) {
			System.err.println("\n SQL exec error in executeAnyQuery(): " + ex.getMessage() );
			System.out.println("에러구문: " + sql);
			ex.printStackTrace();
		}
	}
}
package com.bank.servlets;

import java.sql.*;
public class verifyLogin{
		public static boolean checkLogin(int uid,String uname,String upass) throws ClassNotFoundException{
			boolean status=false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", 
																				"root", "root");
		PreparedStatement ps=conn.prepareStatement("select * from new where uid=? and uname=? and upass=? ");
		ps.setInt(1, uid);
		ps.setString(2,uname);
		ps.setString(3,upass);
		ResultSet rs=ps.executeQuery();
		status=rs.next();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
}
}
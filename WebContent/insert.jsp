<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gringotts/New Account</title>
</head>
<body>


	<%
	

    	
	try{
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		PreparedStatement ps1=null;
		/*ResultSet rs1=null;*/
		
Class.forName("com.mysql.jdbc.Driver");
		
		// Step 2: Build connection
	 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", 
																			"root", "root");
	
	String uname= request.getParameter("uname");
	String upass=request.getParameter("upass");
	int uamount= Integer.parseInt(request.getParameter("uamount"));
	String uaddress=request.getParameter("uaddress");
	int uphone= Integer.parseInt(request.getParameter("uphone"));
	
	ps=conn.prepareStatement("insert into new (uname,upass,uaddress,uphone,uamount)values(?,?,?,?,?)");
	ps.setString(1,uname);
	ps.setString(2,upass);
	ps.setInt(5,uamount);
	ps.setString(3,uaddress);
	ps.setInt(4,uphone);
	
	
	if(ps.executeUpdate()==0){
		out.println("not inserted...");
	}
	else{
		out.println("Your Account has been created.. :)");
		ps1=conn.prepareStatement("select * from new where uname=? and upass=?;");
		ps1.setString(1,uname);
		ps1.setString(2,upass);
		rs=ps1.executeQuery();
		while (rs.next()){
		int uid=rs.getInt(1);
		out.print("Your Account ID is : "+uid);
		}
	}
	
	}
	catch(SQLException e){
		e.printStackTrace();
	}		
	catch(NumberFormatException e){
		e.printStackTrace();
	}
%>

</body>
</html>
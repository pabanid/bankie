<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gringotts/Close</title>
</head>
<body>
<%

try{
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
	
	// Step 2: Build connection
 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root","root");
int uid=Integer.parseInt(request.getParameter("uid"));
String uname= request.getParameter("uname");
	String upass=request.getParameter("upass");
	boolean status=verifyLogin.checkLogin(uid, uname, upass);
	if(status==true){	
	ps=conn.prepareStatement("delete from new where uid='"+uid+"'");
	/*ps.setInt(1,uid);*/
	ps.executeUpdate();
	%>
	<jsp:forward page="goodbye.jsp"></jsp:forward><%
	rs=ps.executeQuery();

	}
	else{%>
	<jsp:forward page="wrong.jsp"></jsp:forward><%
		request.setAttribute("balance", "Please Check your Username");
	
	
	}
}
catch(SQLException e){
	e.printStackTrace();
}		
catch(NumberFormatException e){
	e.printStackTrace();
}
%>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="com.bank.servlets.verifyLogin" %>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gringotts/Balance</title>
</head><style>.container{
			background-color:darkgoldenrod;
			margin-top:1%;
			opacity:.5;
			border:2px solid black;
			margin-left:32%;
			width:35%;
			height:335px;
			
			}
			.tb{
			position:absolute;
			top:60%;
			border:1px solid black;
			margin-left:30px;
			background-color:chocolate;
			width:30%;}
			h2{
				margin-top:1%;
				text-align:center;
				-webkit-text-stroke:1px white;
				text-shadow:1px 1px 2px white;
				font-size:40px;
			}
			</style>
<body>
<%@ include file ="1.html" %>
<div class="container">

<form action="savings.jsp" method="post">


<h2>Fetch Your Balance</h2>
<table class="tb">
<tr><td>Input your User ID  :</td><td><input type="text" name="uid" placeholder="UserID" required/></td></tr><br>
<tr><td>Input your Username  :</td><td><input type="text" name="uname" placeholder="Username" required/></td></tr><br>
<tr><td>Enter your Password.:</td><td><input type="password" name="upass" placeholder="Password" required/></td></tr><br>
<tr><td><input type="submit" value="Submit" name="submit"/></td></tr>
</table>
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
	
		out.print("<br>");
		out.print("<br>");
		out.print("<br>");
		out.print("Welcome  "+uname);
		
	
	ps=conn.prepareStatement("select * from new where uid=?;");
	ps.setInt(1,uid);
	rs=ps.executeQuery();
	
	out.print("<table>");
	out.print("<br>");
	out.print("<br>");
	out.print("<tr><th>ACCOUNT NO.</th><th>USER NAME</th><th>AMOUNT</th></tr>");
	while (rs.next()){
		int account_no=rs.getInt(1);
		session.setAttribute("uid",account_no);
		
		out.print("<tr>");
		out.print("<td>" + rs.getInt(1) + "</td>");
		out.print("<td>" + rs.getString(2) + "</td>");
		out.print("<td>" + rs.getInt(6) + "</td>");
		out.print("</tr>");
	}
	out.print("</table>");

	}
	else{
		out.print("Please check your Username");
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
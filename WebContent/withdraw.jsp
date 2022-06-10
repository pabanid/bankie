<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gringotts/Withdraw</title>
</head>
<style>.container{
			background-color:darkgoldenrod;
			margin-top:1%;
			opacity:.5;
			border:2px solid black;
			margin-left:32%;
			width:35%;
			height:300px;
			
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
			table{
			margin-top:.2px;}
			h4{align:center;
				margin-top:20px;
				-webkit-text-stroke:.5px black;
				margin-left:20px;}
			</style>
<body>
<%@ include file ="1.html" %>
<div class="container">

<form action="withdraw.jsp" method="post">


<h2>Withdraw Your Money</h2>
<table class="tb">
<tr><td>Input your User ID  :</td><td><input type="text" name="uid" placeholder="UserID" required/></td></tr><br>
<tr><td>Input your Username  :</td><td><input type="text" name="uname" placeholder="Username" required/></td></tr><br>
<tr><td>Enter your Password.:</td><td><input type="password" name="upass" placeholder="Password" required/></td></tr><br>
<tr><td>Withdrawal Money:</td><td><input type="text" name="withdraw" placeholder="withdrawal money" required/></td></tr><br>
<tr><td><input type="submit" value="Submit" name="submit"></td></tr>
<br><br><br>
<h4>After submitting, you will be redirected to the balance enquiry page....</h4>
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
int withdraw=Integer.parseInt(request.getParameter("withdraw"));
String uname= request.getParameter("uname");
	String upass=request.getParameter("upass");
	boolean status=verifyLogin.checkLogin(uid, uname, upass);
	if(status==true){

		
	
	ps=conn.prepareStatement("select * from new where uid=?;");
	ps.setInt(1,uid);
	rs=ps.executeQuery();
	int newamount=0;
		if(rs.next()){

		newamount=rs.getInt(6)-withdraw;
	}

	PreparedStatement ps1=conn.prepareStatement("Update new set uamount=? where uid='"+uid+"'");
	//ps1.setInt(2,uid);
	
	ps1.setInt(1,newamount);
	ps1.executeUpdate();
	
	
	

	if(ps1.executeUpdate()==0){
		out.print("not inserted...");
	}
	else{
		%>
		<jsp:forward page="savings.jsp"></jsp:forward><%
		ResultSet rs1=ps1.executeQuery();
	}
	
	
	/*while (rs1.next()){
		 uid=rs1.getInt(1);
		session.setAttribute("uid",uid);
		
		out.print("<tr>");
		out.print("<td>" + rs1.getInt(1) + "</td>");
		out.print("<td>" + rs1.getString(2) + "</td>");
		out.print("<td>" + rs1.getInt(6) + "</td>");
		out.print("</tr>");
	}
	out.print("</table>");*/
	}
	else{
		%>
		<jsp:forward page="wrong.jsp"></jsp:forward><%
		/*out.print("Please check your Username");*/
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
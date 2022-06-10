<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gringotts/Transfer</title>
</head>
<style>.container{
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
			h4{align:center;
				margin-top:20px;
				-webkit-text-stroke:.5px black;
				margin-left:20px;}</style>
<body>
<%@ include file ="1.html" %>
<div class="container">

<form action="transfer.jsp" method="post">


<h2>Trasnfer Your Money</h2>
<table class="tb">
<tr><td>Input your User ID  :</td><td><input type="text" name="uid" placeholder="UserID" required/></td></tr><br>
<tr><td>Input your Username  :</td><td><input type="text" name="uname" placeholder="Username" required/></td></tr><br>
<tr><td>Enter your Password:</td><td><input type="password" name="upass" placeholder="Password" required/></td></tr><br>
<tr><td>Transfer Money:</td><td><input type="text" name="transfer" placeholder="transfer money" required/></td></tr><br>
<tr><td>Transfer to  :</td><td><input type="text" name="uid1" placeholder="UserID" required/></td></tr><br>
<tr><td><input type="submit" value="Submit" name="submit"></td></tr>
<br><br><br>
<h4>After submitting, you will be redirected to the balance enquiry page....</h4>
</table>
<%
try{
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	ResultSet rs1=null;
Class.forName("com.mysql.jdbc.Driver");
	
	// Step 2: Build connection
 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root","root");
int uid=Integer.parseInt(request.getParameter("uid"));
int uid1=Integer.parseInt(request.getParameter("uid1"));
int transfer=Integer.parseInt(request.getParameter("transfer"));
String uname= request.getParameter("uname");
	String upass=request.getParameter("upass");
	boolean status=verifyLogin.checkLogin(uid, uname, upass);
	if(status==true){
		out.print("welcome  "+uname);
		
	
	ps=conn.prepareStatement("select * from new where uid=?;");
	ps.setInt(1,uid);
	PreparedStatement ps1=conn.prepareStatement("select * from new where uid=?;");
	ps1.setInt(1,uid1);
	rs=ps.executeQuery();
	int newamount=0;
	int newamount2=0;
	if(rs.next()){

		newamount=rs.getInt(6)-transfer;
		rs1=ps1.executeQuery();
		
		}
	
	if(rs1.next()){
	newamount2=rs1.getInt(6)+transfer;
	}
	PreparedStatement ps2=conn.prepareStatement("Update new set uamount=? where uid='"+uid+"'");
	//ps1.setInt(2,uid);
	
	ps2.setInt(1,newamount);
	ps2.executeUpdate();
	PreparedStatement ps3=conn.prepareStatement("Update new set uamount=? where uid='"+uid1+"'");
	//ps1.setInt(2,uid);
	
	ps3.setInt(1,newamount2);
	ps3.executeUpdate();
	/*ResultSet rs1=ps1.executeQuery();*/
	if(ps3.executeUpdate()==0){
		out.print("not transferred...");
	}
	else{
	%>
<jsp:forward page="savings.jsp"></jsp:forward>
<%
	/*
	PreparedStatement ps2=null;
	ResultSet rs2=null;
	ps2=conn.prepareStatement("select * from new where uid=?;");
	ps2.setInt(1,uid1);
	rs2=ps2.executeQuery();
	int newamount2=0;
	if(rs2.next()){

		
	}

	PreparedStatement ps3=conn.prepareStatement("Update new set uamount=? where uid='"+uid1+"'");
	//ps1.setInt(2,uid);
	
	ps3.setInt(1,newamount2);
	ps3.executeUpdate();
	ResultSet rs3=ps3.executeQuery();
	if(ps3.executeUpdate()==0){
		out.print("not inserted...");
	}
	else{
		out.print("inserted congo :)");
	}*/
	}
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
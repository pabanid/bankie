<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gringotts/Deposit</title>
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
			h4{align:center;
				margin-top:20px;
				-webkit-text-stroke:.5px black;
				margin-left:20px;}
			}</style>
<body>
<%@ include file ="1.html" %>
<div class="container">

<form action="deposit1.jsp" method="post">


<h2>Deposit Money</h2>
<table class="tb">
<tr><td>Input your User ID  :</td><td><input type="text" name="uid" placeholder="UserID" required/></td></tr><br>
<tr><td>Input your Username  :</td><td><input type="text" name="uname" placeholder="Username" required/></td></tr><br>
<tr><td>Enter your Password.:</td><td><input type="password" name="upass" placeholder="Password" required/></td></tr><br>
<tr><td>Deposit Money:</td><td><input type="text" name="deposit" placeholder="deposit money" required/></td></tr><br>
<tr><td><input type="submit" value="Submit" name="submit"></td></tr>
<br><br><br>
<h4>After submitting, you will be redirected to the balance enquiry page....</h4>
</table>


</body>
</html>
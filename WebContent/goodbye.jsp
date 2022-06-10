<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gringotts/Goodbye</title>
</head>
<style>.d{
margin-top:30%;}
h3{color:white;}
.container{
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
			width:30%;}</style>
<body>
<%@ include file ="1.html" %>
<div class d>

<h3>Your account has been closed, thank you for being a part of Gringotts Family !</h3>


</div>


<%@page import="java.io.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="com.bank.servlets.verifyLogin" %>
</body>
</html>
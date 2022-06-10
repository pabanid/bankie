<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gringotts/New Account</title>
</head>
<style>.container{
			background-color:darkgoldenrod;
			margin-top:1%;
			opacity:.5;
			border:2px solid black;
			margin-left:32%;
			width:35%;
			height:320px;
			
			}
			h2{
				margin-top:1%;
				margin-left:80px;
				-webkit-text-stroke:1px white;
				text-shadow:1px 1px 2px white;
				font-size:40px;
			}
			.tb{
					position:absolute;
					top:58%;
					border:1px solid black;
					background-color:chocolate;
					margin-left:30px;
					width:30%;
					text-decoration:bold;
					
					}</style>
<body>
<%@ include file ="1.html" %>
<div class="container">

<form action="insert.jsp" method="post">


<h2>Register with Us</h2>
<table class="tb">
<tr><td>Input your Username  :</td><td><input type="text" name="uname" placeholder="Username" required/></td></tr><br>
<tr><td>Enter your Password.:</td><td><input type="password" name="upass" placeholder="Password" required/></td></tr><br>
<tr><td>Retype entered Password:</td><td><input type="password" name="repass" placeholder="Retype Password" required/></td></tr><br>
<tr><td>Enter the Amount.</td><td><input type="text" name="uamount" placeholder="Amount"></td></tr><br>
<tr><td>Enter your Address:</td><td><input type="text" name="uaddress" placeholder="Address"></td></tr><br>
<tr><td>Enter Phone no.:</td><td><input type="text" name="uphone" placeholder="Phone Number"></td></tr>
<tr><td><input type="submit" value="Submit" name="submit"/></td>
<td><input type="reset" value="Reset" name="reset"/></td></tr>
</table>
</form>

</div>
</body>
</html>
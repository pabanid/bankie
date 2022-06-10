<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gringotts/Deposit</title>
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
int deposit=Integer.parseInt(request.getParameter("deposit"));
String uname= request.getParameter("uname");
	String upass=request.getParameter("upass");
	boolean status=verifyLogin.checkLogin(uid, uname, upass);
	if(status==true){
		out.print("welcome  "+uname);
		
	
	ps=conn.prepareStatement("select * from new where uid=?;");
	ps.setInt(1,uid);
	rs=ps.executeQuery();
	int newamount=0;

	if(rs.next()){

		newamount=rs.getInt(6)+deposit;
	}

	PreparedStatement ps1=conn.prepareStatement("Update new set uamount=? where uid='"+uid+"'");
	//ps1.setInt(2,uid);
	
	ps1.setInt(1,newamount);
	ps1.executeUpdate();

	if(ps1.executeUpdate()==0){
		out.print("not inserted...");
	}
	else{
		
		/*while (rs.next()){
			 uid=rs.getInt(1);
			session.setAttribute("uid",uid);
			
			out.print("<tr>");
			out.print("<td>" + rs.getInt(1) + "</td>");
			out.print("<td>" + rs.getString(2) + "</td>");
			out.print("<td>" + rs.getInt(6) + "</td>");
			out.print("</tr>");
		}*/
		%>
		<jsp:forward page="savings.jsp"></jsp:forward>
		<%
		ResultSet rs1=ps1.executeQuery();
	
		/*out.print("<table>");
		out.print("<tr><th>ACCOUNT NO</th><th>USER NAME</th><th>AMOUNT</th></tr>");
		
		out.print("</table>");*/
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
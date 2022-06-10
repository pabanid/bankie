<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Gringotts/Home</title>
</head>
<style>
		.q{margin-top:30%;}
.mySlides {display:none;}
.e{
	border:2px solid grey;
	width:65%;
	margin-left:250px;
position:inline;}
}
		</style>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
<body>

<%@ include file ="1.html" %>
<div class=e>
<div class="w3-content w3-section" style="max-width:800px">
  <img class="mySlides" src="img1.jpeg" style="width:100%">
  <img class="mySlides" src="img2.jpeg" style="width:100%">
  <img class="mySlides" src="img3.jpeg" style="width:100%">
</div>

</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
<div class=q>

<footer class="footer-distributed">

			<div class="footer-right">

				<a href="#" class="facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
				<a href="#" class="twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
				<a href="#" class="instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a>
				<a href="#" class="github"><i class="fa fa-github" aria-hidden="true"></i></a>

			</div>

			<div class="footer-left">

				<p class="footer-links">
					 © Gringotts-The Most Trustable Bank
				</p>
			</div>

		</footer>
</div>

</body>
</html>
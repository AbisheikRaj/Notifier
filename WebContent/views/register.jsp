<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel = "stylesheet" href = "/Notifier/css/signup.css?version=1" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>

	setTimeout(function() {
		$('.alert').fadeOut(600);
	}, 1500);

	function validate(e) {

		var fname = document.getElementById("First_Name").value;
		var lname = document.getElementById("Last_Name").value;
		var email = document.getElementById("Email").value;
		var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
		var country = document.getElementById("Country").value;
		var mobile = document.getElementById("Mobile_Number").value;
		var phoneno = /^\d{10}$/;
		var password = document.getElementById("Password").value;
		var rpassword = document.getElementById("Re-Enter_Password").value;
		if (fname == "") {
			document.getElementById("fname").innerHTML = "Please Enter Your Firstname";
			return false;
		}
		if (!isNaN(fname)) {
			document.getElementById("fname").innerHTML = "Please Enter the Valid Firstname";
			return false;
		}

		if (lname == "") {
			document.getElementById("lname").innerHTML = "Please Enter Your Lastname";
			return false;
		}
		if (!isNaN(lname)) {
			document.getElementById("lname").innerHTML = "Please Enter Valid Lastname";
			return false;
		}

		if (!email.match(validRegex)) {
			document.getElementById("email").innerHTML = "Please Enter Valid Email";
			return false;
		}
		if (country == "") {
			document.getElementById("country").innerHTML = "Please Enter Your Country";
			return false;
		}

		if (mobile == "") {
			document.getElementById("mobile").innerHTML = "Please Enter Your Mobile Number";
			return false;
		}
		if (!mobile.match(phoneno)) {
			document.getElementById("mobile").innerHTML = "Please Enter Valid Mobile Number";
			return false;
		}
		if (password == "") {
			document.getElementById("pass").innerHTML = "Please Enter the Password";
			return false;
		}
		if (rpassword == "") {
			document.getElementById("rpass").innerHTML = "Please Enter the Re-Enter Password";
			return false;
		}
		if (password != rpassword) {
			document.getElementById("rpass").innerHTML = "Password does not match";
			return false;
		}
	}
</script>
</head>
<body>
	<%
	if (session.getAttribute("Error") != null) {
	%>
	<div class="alert alert-danger" role="alert" style = "margin : 50px;">
		${Error}</div>
	<%
	session.setAttribute("Error", null);
	}
	%>
	<div class = "form">
	  <form action = "<%= request.getContextPath()  %>/Register" method = "post" onsubmit = "return validate();">
	  	  <p class="h1">Registration</p>
		  <div class="form-group">
		    <label for="First_Name">First Name</label>
		    <input type="text" class="form-control" id="First_Name" name = "First_Name" placeholder="FirstName" >
		    <div id = "fname"></div>
		  </div>
		  <div class="form-group">
		    <label for="Last_Name">Last Name</label>
		    <input type="text" class="form-control" id="Last_Name" name = "Last_Name" placeholder="LastName">
		    <div id = "lname"></div>
		  </div>
		  <div class="form-group">
		    <label for="Email">Email ID</label>
		    <input type="email" class="form-control" id="Email" name = "Email" placeholder="Email ID">
		    <div id = "email"></div>
		  </div>
		  <div class="form-group">
		    <label for="Password">Password</label>
		    <input type="password" class="form-control" id="Password" name = "Password" placeholder="Password">
		    <div id = "pass"></div>
		  </div>
		  <div class="form-group">
		    <label for="Re-Enter_Password">Re-Enter Password</label>
		    <input type="password" class="form-control" id="Re-Enter_Password" placeholder="Re-Enter Password">
		    <div id = "rpass"></div>
		  </div>
		  <div class="form-group">
		    <label for="Country">Country</label>
		    <input type="text" class="form-control" id="Country" name = "Country" placeholder="Country">
		    <div id = "country"></div>
		  </div>
		  <div class="form-group">
		    <label for="Mobile_Number">Mobile Number</label>
		    <input type="text" class="form-control" id="Mobile_Number" name = "Mobile_Number" placeholder="Mobile Number">
		    <div id = "mobile"></div>
		  </div>
		  <div class = "new_user">
		  	<input type="submit" class="btn btn-primary" value = "Register" style = "background-color : orange; border : none; box-shadow : none;">
		  	<a href = "/Notifier/Login.jsp" > Already Have An Account </a>
		  </div>
		</form>
	</div>
</body>
</html>
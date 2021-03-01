<%@page import="com.example.Notifier.model.Client"%>
<%@page import="com.example.Notifier.Service.LoginService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel = "stylesheet" href = "/Notifier/css/Edit.css?version=1" />
<script>
function validate(e) {
	
	var fname = document.getElementById("First_Name").value;
	var lname = document.getElementById("Last_Name").value;
	var country = document.getElementById("Country").value;
	var mobile = document.getElementById("Mobile_Number").value;
	var password = document.getElementById("Password").value;
	var rpassword = document.getElementById("Rpassword").value;
	var phoneno = /^\d{10}$/;
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
	
	if (country == "") {
		document.getElementById("country").innerHTML = "Please Enter Your Country";
		return false;
	}
	if (password == "") {
		document.getElementById("pass").innerHTML = "Please Enter Your Password";
		return false;
	}
	if (rpassword == "") {
		document.getElementById("rpass").innerHTML = "Please Enter the Re-Password";
		return false;
	}
	
	if (password !== rpassword) {
		document.getElementById("rpass").innerHTML = "Password does not match";
		return false;
	}
	if (mobile == "") {
		document.getElementById("mobile").innerHTML = "Please Enter Your Mobile Number";
		return false;
	}
	if (! mobile.match(phoneno)) {
		document.getElementById("mobile").innerHTML = "Please Enter Valid Mobile Number";
		return false;
	}
}

</script>
</head>
<body>
	<% 
	   LoginService service = new LoginService();
	   String email = session.getAttribute("email").toString();
	   Client c = (Client) service.get(email);
	   HttpSession s = request.getSession();
	   s.setAttribute("firstname", c.getFirstname());
	   s.setAttribute("lastname", c.getLastname());
	   s.setAttribute("email", c.getEmail());
	   s.setAttribute("country", c.getCountry());
	   s.setAttribute("mobile", c.getMobilenumber());
	   s.setAttribute("password", c.getPassword());
	%>
	<div class = "form_section">
		<form action="<%= request.getContextPath() %>/EditProfile" method="post" onsubmit="return validate();">
			<p class="h1">Edit Profile</p>
			<div class="form-group">
				<label for="First_Name">First Name</label> <input type="text"
					class="form-control" id="First_Name" name="First_Name"
					placeholder="FirstName" value = "${firstname}">
				<div id="fname"></div>
			</div>
			<div class="form-group">
				<label for="Last_Name">Last Name</label> <input type="text"
					class="form-control" id="Last_Name" name="Last_Name"
					placeholder="LastName" value = "${lastname}">
				<div id="lname"></div>
			</div>
			<div class="form-group">
				<label for="Password">Password</label> <input type="password"
					class="form-control" id="Password" name="Password" placeholder="Password" value = "${password}">
				<div id="pass" style = "color : red; font-weight : bold;"></div>
			</div>
			<div class="form-group">
				<label for="Re-Enter Password">Re-Enter Password</label> <input type="password"
					class="form-control" id="Rpassword" name="Rpassword" placeholder="Re-Enter the Password" value = "${password}">
				<div id="rpass" style = "color : red; font-weight : bold;"></div>
			</div>
			<div class="form-group">
				<label for="Country">Country</label> <input type="text"
					class="form-control" id="Country" name="Country"
					placeholder="Country" value = "${country}">
				<div id="country"></div>
			</div>
			<div class="form-group">
				<label for="Mobile_Number">Mobile Number</label> <input type="text"
					class="form-control" id="Mobile_Number" name="Mobile_Number"
					placeholder="Mobile Number" value = "${mobile}">
				<div id="mobile"></div>
			</div>
			<div class="edit_user">
				<input type="submit" class="btn btn-primary" value="Edit" style = "margin-right : 10px;">
				<a href = "/Notifier/views/home.jsp"><button type="button" class="btn btn-secondary">Back</button></a>
			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/Notifier/css/Login.css" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script type="text/javascript">
	setTimeout(function() {
	    $('.alert').fadeOut(600);
	}, 1500);

	
	function validate() {
		var email = document.getElementById("Email").value;
		var pass = document.getElementById("Password").value;
		
		var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
		
		if (email == "") {
			document.getElementById("email").innerHTML = "Please Enter Your E-mail ID";
			return false;
		} 
		
		if (!email.match(validRegex)) {
			document.getElementById("email").innerHTML = "Invalid E-mail ID";
			return false;
		}
		
		if (pass == "") {
			document.getElementById("pass").innerHTML = "Password is Required";
			return false;
		}
	}
</script>

<title>Login</title>
</head>
<body>
	<%
	if (session.getAttribute("message") != null) {
	%>
	<div class="alert alert-success" role="alert" style = "margin : 50px;">${message}</div>
	<%
	session.setAttribute("message", null);
	}
	%>
	<%
	if (session.getAttribute("Error") != null) {
	%>
	<div class="alert alert-danger" role="alert" style = "margin : 50px;">
		${Error}</div>
	<%
	session.setAttribute("Error", null);
	}
	%>
	<div class="form">
		<form action="<%=request.getContextPath()%>/Login" method="post">
			<p class="h1">Login</p>
			<div class="form-group">
				<label for="Email">Email address</label> <input type="email"
					class="form-control" id="Email" name="Email"
					placeholder="Email ID">
				<span id = "email"></span>
			</div>
			<div class="form-group">
				<label for="Password">Password</label> 
				<input type="password" class="form-control" id="Password" name="Password" placeholder="Password">
				<span id = "pass"></span>
			</div>
			<div class="new_user">
				<button type="submit" class="btn btn-primary" onClick = "return validate();">Login</button>
				<a href="/Notifier/views/register.jsp" style = "text-decoration : none;"> Create An Account </a>
			</div>
		</form>
	</div>
</body>
	
</html>
<%@page import="com.example.Notifier.model.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<link rel="stylesheet" href="/Notifier/css/home.css?v=1" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/Notifier/js/home.js?v=1"></script>
</head>
<body background = "/Notifier/images/background.png" style = "backdrop-filter: saturate(1.8) blur(8px);">
	<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("/Notifier/Login.jsp");
	}
	%>
	<div class="top_view">
		<h1 style = "color : orange;">Note</h1><h1>book</h1>
		<h3>
			<span class="badge badge-secondary">Notifier</span>
		</h3>
		<div class="dropdown">
				<a href = "" data-toggle="modal" data-target="#exampleModal"><span class="material-icons" style = "padding-right : 10px; padding-top : 10px;color : black; text-decoration : none;"> circle_notifications </span></a>
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">${username}
				</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" data-toggle="modal" data-target="#password" data-toggle="modal"
					data-target="#password" href = ""><b>Profile</b></a>
				<a class="dropdown-item" href="<%=request.getContextPath()%>/Logout"><b>Logout</b></a>
			</div>
		</div>
	</div>

	<div class="modal fade" id="password" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Edit Profile</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<% 
				if (session.getAttribute("validation_message") != null) {
				%>
				<div>
					<h5 style = "color : red; margin-top : 10px; margin-left : 15px;">Invalid username and password</h5>
				</div>
				<% session.setAttribute("validation_message", null);} %>
				<div class="modal-body">
					<form action="<%=request.getContextPath()%>/edit_validation" method="post">
						<div class="form-group">
							<label for="Password">Password</label> <input type="password"
								class="form-control" id="Password" name="Password"
								placeholder="Password"> <span id="pass"></span>
						</div>
						<div class="new_user">
							<button type="submit" class="btn btn-primary"
								onClick="return validate();">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel"><b>Remainders</b></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <c:forEach items="${list_of_notes}" var="remainder_note">
						<div class="card">
							<div class="card-body"><b>Tag : </b><p style = "color : green;">${remainder_note.tag}</p></div>
							<div class="card-body"><b>Title : </b><p style = "color : orange;">${remainder_note.title}</p></div>
							<div class="card-body"><b>Remainder Date : </b><b style = "color : red;">${remainder_note.remainder_date}</b></div>
						</div>
				</c:forEach>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	

	<div class="main_section">
		<div class="list_of_notes">

			<div id="myNav" class="overlay">
				<h1>List Of Notes</h1>
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;
				</a>
				<div class="overlay-content">
					<c:forEach items="${list_of_notes}" var="note">
						<div class="card">
							<div class="card-body">${note.tag}</div>
							<div class="card-body">${note.title}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- <span
				style="font-size: 30px; cursor: pointer; position: relative; left: 10px; top: 20px;"
				onclick="openNav()">&#9776;</span> -->
		</div>

		<div class="body_section">
			<div class="top_section">
				<h1>Notebook Section</h1>
				<div class = "button_style">
					<button type="button" class="btn btn-success"
						onclick="myFunction();" style = "margin-right : 10px;">Show / Hide</button>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#create_a_note">New</button>
				</div>
			</div>


			<!-- Cards -->
			<div id="cards_visibility">
				<c:forEach items="${list_of_notes}" var="note">
					<div class="cards_list">
						<div class="card bg-light mb-3">
							<div class="card-header"><h3>${note.tag}</h3></div>
							<div class="card-body">
								<h4 class="card-title" style = "color : orange;">${note.title}</h4>
								<p class="card-text"><b>Description :</b><b style = "color : violet;"> ${note.description}</b></p>
								<p class="card-text"><b>Start Date :</b><b style = "color : green;"> ${note.start_date}</b></p>
								<p class="card-text"><b>End Date :</b><b style = "color : dodgerblue;"> ${note.end_date}</b></p>
							</div>
							<div class = "button_operations">
								<a class = "edit" href = "/Notifier/views/EditNotes.jsp?tag=${note.tag}&title=${note.title}&start=${note.start_date}&end=${note.end_date}&desc=${note.description}&remainder=${note.remainder_date}"><button type="button" class="btn btn-dark">Edit</button></a>
								<a class = "delete" href = "<%= request.getContextPath() %>/DeleteNotes?title=${note.title}"><button type="button" class="btn btn-danger">Delete</button></a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- End Cards -->
		</div>

		


		<!-- Modal -->
		<div class="modal fade" id="create_a_note" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle" style = "color : orange;">Create</h5>
							<h5 class="modal-title" id="exampleModalLongTitle">Note</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="<%=request.getContextPath()%>/AddNotes"
							 method="post" onsubmit = "return validate_notes();">
							<div class="form-group">
								<label for="title">Title : </label> <input type="text"
									class="form-control" name="title" id="title"
									placeholder="Title">
								<small id="emailHelp" class="form-text text-muted">Title must be unique</small>
								<span id = "title_msg" style = "color : red; font-weight : bold;"></span>
							</div>
							<div class="form-group">
								<label for="tag">Tag : </label> <input type="text"
									class="form-control" name="tag" id="tag" placeholder="@Tag">
								<span id = "tag_msg" style = "color : red; font-weight : bold;"></span>
							</div>
							<div class="form-group row">
								<label for="start_date" class="col-4 col-form-label">Start
									Date : </label>
								<div class="col-10">
									<input class="form-control" type="date" name="start_date"
										placeholder="DD-MM-YYYY" id="start_date">
									<span id = "start" style = "color : red; font-weight : bold;"></span>
								</div>
							</div>
							<div class="form-group row">
								<label for="end_date" class="col-4 col-form-label">End
									Date : </label>
								<div class="col-10">
									<input class="form-control" type="date" name="end_date"
										placeholder="DD-MM-YYYY" id="end_date">
									<span id = "end" style = "color : red; font-weight : bold;"></span>
								</div>
							</div>
					
							<div class="form-group row">
								<label for="remainder_date" class="col-4 col-form-label">Remainder
									Date : </label>
								<div class="col-10">
									<input class="form-control" type="date" name="remainder_date"
										placeholder="DD-MM-YYYY" id="remainder_date">
									<span id = "remainder" style = "color : red; font-weight : bold;"></span>
								</div>
							</div>

							<div class="form-group">
								<label for="description">Description : </label>
								<textarea class="form-control" id="description"
									name="description" rows="3" placeholder="Description"></textarea>
								<span id = "desc" style = "color : red; font-weight : bold;"></span>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<input type="submit" class="btn btn-primary" value="Add">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal  -->
	</div>
</body>

</html>
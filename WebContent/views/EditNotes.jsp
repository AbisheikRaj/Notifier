<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Notes</title>
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

<link rel = "stylesheet" href = "/Notifier/css/EditNotes.css?version=1"/>
<script>
	function validate_notes() {
		var title = document.getElementById("title").value;
		var tag = document.getElementById("tag").value;
		var start_date = document.getElementById("start_date").value;
		var end_date = document.getElementById("end_date").value;
		var remainder_date = document.getElementById("remainder_date").value;
		var description = document.getElementById("description").value;

		if (title == "") {
			document.getElementById("title_msg").innerHTML = "Please Enter the Title";
			return false;
		}
		if (!isNaN(title)) {
			document.getElementById("title_msg").innerHTML = "Please Enter the Valid Title";
			return false;
		}

		if (tag == "") {
			document.getElementById("tag_msg").innerHTML = "Please Enter the Tag";
			return false;
		}

		if (start_date == "") {
			document.getElementById("start").innerHTML = "Please Enter the Start_Date";
			return false;
		}

		if (end_date == "") {
			document.getElementById("end").innerHTML = "Please Enter the End_Date";
			return false;
		}

		if (remainder_date == "") {
			document.getElementById("remainder").innerHTML = "Please Enter the Remainder_Date";
			return false;
		}

		if (description == "") {
			document.getElementById("desc").innerHTML = "Please Enter the Description";
			return false;
		}
	}
</script>
</head>
<body>
	<% 
	String tag = request.getParameter("tag");
	String title = request.getParameter("title");
	String remainder = request.getParameter("remainder");
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String desc = request.getParameter("desc");
	HttpSession s = request.getSession();
	s.setAttribute("tag", tag);
	s.setAttribute("title", title);
	s.setAttribute("remainder", remainder);
	s.setAttribute("start", start);
	s.setAttribute("end", end);
	s.setAttribute("desc", desc);
	%>
	<div class = "edit_form">
		<form action = "<%= request.getContextPath()%>/EditNotes" method = "post" onsubmit = "return validate_notes();">
			<h1>Edit Notes</h1>
			<div class="form-group">
				<label for="title">Title : </label> <input type="text"
					class="form-control" name="title" id="title" placeholder="Title" value = "${title}">
				<small id="emailHelp" class="form-text text-muted">Title must be unique</small>
				<span id = "title_msg" style = "color : red; font-weight : bold;"></span>
			</div>
			<div class="form-group">
				<label for="tag">Tag : </label> <input type="text"
					class="form-control" name="tag" id="tag" placeholder="@Tag" value = "${tag}">
				<span id = "tag_msg" style = "color : red; font-weight : bold;"></span>
			</div>
			<div class="form-group row">
				<label for="start_date" class="col-4 col-form-label">Start
					Date : </label>
				<div class="col-10">
					<input class="form-control" type="date" name="start_date"
						id="start_date" value = "${start}"/>
					<span id = "start" style = "color : red; font-weight : bold;"></span>
				</div>
			</div>
			<div class="form-group row">
				<label for="end_date" class="col-4 col-form-label">End Date
					: </label>
				<div class="col-10">
					<input class="form-control" type="date" name="end_date"
						 id="end_date" value = "${end}" />
					<span id = "end" style = "color : red; font-weight : bold;"></span>
				</div>
			</div>
			<div class="form-group row">
				<label for="remainder_date" class="col-6 col-form-label">Remainder :</label>
				<div class="col-10">
					<input class="form-control" type="date" name="remainder_date"
						 id="remainder_date" value = "${remainder}" /> 
					<span id = "remainder" style = "color : red; font-weight : bold;"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="description">Description : </label>
				<textarea class="form-control" id="description" name="description"
					rows="3" placeholder="Description">${desc}</textarea>
				<span id = "desc" style = "color : red; font-weight : bold;"></span>
			</div>
			<div class = "button_submit">
				<input type="submit" class="btn btn-primary" value="Edit">
			</div>
		</form>
	</div>
</body>
</html>

setTimeout(function() {
	$('.alert').fadeOut(600);
}, 1500);

var x = 0;
function myFunction() {

	var x = document.getElementById("cards_visibility");
	if (x.style.display === "none") {
		x.style.display = "flex";

	} else {
		x.style.display = "none";

	}
}

function openNav() {
	document.getElementById("myNav").style.width = "20%";
}

function closeNav() {
	document.getElementById("myNav").style.width = "0%";
}

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


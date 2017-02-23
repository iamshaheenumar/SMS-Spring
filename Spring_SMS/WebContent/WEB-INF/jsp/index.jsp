<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SMS-Register</title>

<!--meta-tag for google authentication using client ID  -->
<meta name="google-signin-client_id" content="695592406680-d0829hvp35t3olive1kdc62e0reeof31.apps.googleusercontent.com">


<!-- Material Design Lite CDN -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.blue-red.min.css" /> 
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>


<!-- Bootstrap CDN-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Custom Styles -->
<style>
	body{
	  background-image: url("https://www.clipartsgram.com/image/207500865-background-images-for-websites-23.jpg");
	  background-color: #EFEFEF;
	  text-align: center;
	  font:sans-serif;
	  color:#333;
	}
	
	.material-icons.md-48 { font-size: 100px; }

	i.material-icons{
	  margin-top:1em;
	  text-align:inherit;
	  padding:0.25em;
	  border: 8px solid;
	  border-radius: 50%;
	  
	}
	#google-signin{
	  text-align: -moz-center;
	}
	#btnSignIn,#btnSignUp{
	  margin-top: 1em;
	  width: 8em;
	}
	#btnSignIn{
		margin-right:0.5em;
	}
	#btnSignUp{
		margin-left:0.5em;
	}
	hr{
		border-color:#333;
	}

	
	
/*	CSS	for SignIn modal		*/
	
	.modal-dialog{
	  
	  margin:30px 0 0 90px;
	}
	.panel-login {
	    border-color: #ccc;
		-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
		-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
		box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	}
	.panel-login>.panel-heading {
		color: #00415d;
		background-color: #fff;
		border-color: #fff;
		text-align:center;
	}
	.panel-login>.panel-heading a{
		text-decoration: none;
		color: #666;
		font-weight: bold;
		font-size: 15px;
		-webkit-transition: all 0.1s linear;
		-moz-transition: all 0.1s linear;
		transition: all 0.1s linear;
	}
	.panel-login>.panel-heading a.active{
		color: #029f5b;
		font-size: 18px;
	}
	.panel-login>.panel-heading hr{
		margin-top: 10px;
		margin-bottom: 0px;
		clear: both;
		border: 0;
		height: 1px;
		background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
		background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
		background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
		background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	}
	.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
		height: 45px;
		border: 1px solid #ddd;
		font-size: 16px;
		-webkit-transition: all 0.1s linear;
		-moz-transition: all 0.1s linear;
		transition: all 0.1s linear;
	}
	.panel-login input:hover,
	.panel-login input:focus {
		outline:none;
		-webkit-box-shadow: none;
		-moz-box-shadow: none;
		box-shadow: none;
		border-color: #ccc;
	}
	.btn-login {
		background-color: #59B2E0;
		outline: none;
		color: #fff;
		font-size: 14px;
		height: auto;
		font-weight: normal;
		padding: 14px 0;
		text-transform: uppercase;
		border-color: #59B2E6;
	}
	.btn-login:hover,
	.btn-login:focus {
		color: #fff;
		background-color: #53A3CD;
		border-color: #53A3CD;
	}
	.forgot-password {
		text-decoration: underline;
		color: #888;
	}
	.forgot-password:hover,
	.forgot-password:focus {
		text-decoration: underline;
		color: #666;
	}
	
	.btn-register {
		background-color: #1CB94E;
		outline: none;
		color: #fff;
		font-size: 14px;
		height: auto;
		font-weight: normal;
		padding: 14px 0;
		text-transform: uppercase;
		border-color: #1CB94A;
	}
	.btn-register:hover,
	.btn-register:focus {
		color: #fff;
		background-color: #1CA347;
		border-color: #1CA347;
	}
		
</style>

<script type="text/javascript">

	$(function() {
				
		$('#BtnSignUp').click(function(e) {
			console.log("Cliked Sign up");
			if($("#login-form-link").hasClass("active")==true){
				$('#login-form-link').removeClass('active');
				$('#register-form-link').addClass('active');				
			}
			e.preventDefault();
		});
		$('#BtnSignIn').click(function(e) {
			console.log("Cliked Sign in");
			$('#register-form-link').removeClass('active');
			$('#login-form-link').addClass('active');
			e.preventDefault();
		});	

		
		
		$('#login-form-link').click(function(e) {
	    	$("#login-form").delay(100).fadeIn(100);
	 		$("#register-form").fadeOut(100);
			$('#register-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		$('#register-form-link').click(function(e) {
			$("#register-form").delay(100).fadeIn(100);
	 		$("#login-form").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
	
	
	});


</script>

</head>
<body>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
	<div class="container">
        <div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Sign In</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Sign Up</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="#" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="#" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" action="#" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
   </div>
 </div>

<!-- Modal end -->



<div class="container-fluid ">
	<div class="row">
		<i class="material-icons md-48">school</i>
		<h1 style="font-weight: bold;">School Management System</h1>
		<h3>ABC Public School</h3>
		
	</div>
	<hr>
	
	
	<div class="row">		
		<div class="col-md-4 col-md-offset-4">
			<!-- Button-Sign In with google -->
			<div id="google-signin"></div>
		</div>
	</div>	
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<!-- Mdl Button -->
			<button id="btnSignIn" data-toggle="modal" data-target="#myModal" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
	  			Sign In
			</button>
			<!-- Mdl Button -->
			<button id="btnSignUp" data-toggle="modal" data-target="#myModal" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
		 		Sign Up
			</button>
		</div>

	</div>
		
		
 	
		
	

</div>


<!-- Scripts for google Authentication -->
<script>
    function onSuccess(googleUser) {
      var profile = googleUser.getBasicProfile();
      console.log('Logged in as: ' + profile.getName());
      console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

      // The ID token you need to pass to your backend:
      var id_token = googleUser.getAuthResponse().id_token;
      console.log("ID Token: " + id_token);
      
      var xhr = new XMLHttpRequest();
      xhr.open('POST', 'http://localhost:8080/Spring_SMS/GoogleAuth');
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      xhr.onload = function() {
        console.log('Status: ' + xhr.status);
		if(xhr.status==200){
			window.location.href = "http://localhost:8080/Spring_SMS/studentLogin";
		}
      };
      xhr.send('idtoken=' + id_token);

    }
    function onFailure(error) {
      console.log(error);
    }
    
    
    function renderButton() {
      gapi.signin2.render('google-signin', {
        'scope': 'profile email',
        'width': 240,
        'height': 50,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }


</script>

<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>

</body>
</html>
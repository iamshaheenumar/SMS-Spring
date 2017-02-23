<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--meta-tag for google authentication using client ID  -->
<meta name="google-signin-client_id" content="695592406680-d0829hvp35t3olive1kdc62e0reeof31.apps.googleusercontent.com">

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>

<script>
	//Google SignOut
	$("#BtnSignOut").click(function(){
		console.log('Clicked');
	    
	        var auth2 = gapi.auth2.getAuthInstance();
	        auth2.signOut();
	});



	//side-nav click
	$("#menu-toggle").click(function(e) {
	        e.preventDefault();
	        $("#wrapper").toggleClass("active");
	});


</script>



<style rel="stylesheet" type="text/css">

  .row{
    margin-left:0px;
    margin-right:0px;
  }
  .well{
    margin-top: 25px
  }

  #wrapper {
      padding-left: 70px;
      transition: all .4s ease 0s;
      height: 100%
  }

  #sidebar-wrapper {
      margin-left: -150px;
      left: 70px;
      width: 200px;
      background: #222;
      position: fixed;
      height: 100%;
      z-index: 10000;
      transition: all .4s ease 0s;
  }

  .sidebar-nav {
      display: block;
      float: left;
      width: 200px;
      list-style: none;
      margin: 0;
      padding: 0;
  }
  #page-content-wrapper {

      padding-left: 50px;
      margin-left: 0;
      width: 100%;
      height: auto;
  }
  #wrapper.active {
      padding-left: 150px;
  }
  #wrapper.active #sidebar-wrapper {
      left: 150px;
  }

  #page-content-wrapper {
    width: 100%;
  }

  #sidebar_menu li a, .sidebar-nav li a {
      color: #999;
      display: block;
      float: left;
      text-decoration: none;
      width: 200px;
      background: #252525;
      border-top: 1px solid #373737;
      border-bottom: 1px solid #1A1A1A;
      -webkit-transition: background .5s;
      -moz-transition: background .5s;
      -o-transition: background .5s;
      -ms-transition: background .5s;
      transition: background .5s;
  }
  .sidebar_name {
      padding-top: 25px;
      color: #fff;
      opacity: .7;
  }

  .sidebar-nav li {
    line-height: 40px;
    text-indent: 20px;
  }

  .sidebar-nav li a {
    color: #999999;
    display: block;
    text-decoration: none;
  }

  .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255,255,255,0.2);
    text-decoration: none;
  }

  .sidebar-nav li a:active,
  .sidebar-nav li a:focus {
    text-decoration: none;
  }

  .sidebar-nav > .sidebar-brand {
    height: 65px;
    line-height: 60px;
    font-size: 18px;
  }

  .sidebar-nav > .sidebar-brand a {
    color: #999999;
  }

  .sidebar-nav > .sidebar-brand a:hover {
    color: #fff;
    background: none;
  }

  #main_icon{
     float:right;
     padding-right: 25px;
     padding-top:20px;
  }
  .sub_icon{
     float:right;
     padding-right: 25px;
     padding-top:10px;
  }
  .content-header {
    height: 65px;
    line-height: 65px;
  }

  .content-header h1 {
    margin: 0;
    margin-left: 20px;
    line-height: 65px;
    display: inline-block;
  }
  th.sub{
    text-align: left;
  }
  td,th{
    text-align: center;
  }



</style>


<title>Student Login</title>
</head>
<body>
  <div id="wrapper" class="active">
    <!-- Sidebar -->
            <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <ul id="sidebar_menu" class="sidebar-nav">
           <li class="sidebar-brand"><a id="menu-toggle" href="#">Menu<span id="main_icon" class="glyphicon glyphicon-align-justify"></span></a></li>
        </ul>
        <ul class="sidebar-nav" id="sidebar">
          <li><a>Profile<span class="sub_icon glyphicon glyphicon-link"></span></a></li>
           <ul class="sidebar-nav" id="sidebar">
                <li class="active"><a>Marks<span class="sub_icon glyphicon glyphicon-link"></span></a></li>
                <li><a>Attendence<span class="sub_icon glyphicon glyphicon-link"></span></a></li>
           </ul>
          <li><a>Messages<span class="sub_icon glyphicon glyphicon-link"></span></a></li>
          <li><a>Settings<span class="sub_icon glyphicon glyphicon-link"></span></a></li>
        </ul>
      </div>

      <!-- Page content -->
      <div id="page-content-wrapper">
        <!-- Keep all page content within the page-content inset div! -->
        <div class="page-content inset">
            <div class="row">
              <div class="col-md-12">
               <p class="well lead">
               	 Welcome Shaheen 
               	 <!-- "http://localhost:8080/Spring_SMS/" -->
               	 <a id="BtnSignOut" href="#" class="btn btn-primary btn-md pull-right">
          			<span class="glyphicon glyphicon-log-out"></span> Log out
        		</a>
        	 </p>
              <table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th class="sub">Subject</th>
                    <th>Mark Scored</th>
                    <th>Total Mark</th>
                  </tr>
                </thead>
                <tbody>

                <c:forEach var="GetMarkBean" items="${list}">
                	<tr class=<c:choose>
							  		<c:when test="${GetMarkBean.intMarksObtained_ < 35}">
							    		"danger"
							  		</c:when>
							  		<c:when test="${GetMarkBean.intMarksObtained_ > 90}">
							    		"success"
							  		</c:when>
							  		<c:otherwise>
										"info"			    
							  		</c:otherwise>
								</c:choose>>
                    	<th>${GetMarkBean.intIndex}</th>
                    	<th class="sub">${GetMarkBean.strSubjectName_}</th>
                    	<td>${GetMarkBean.intMarksObtained_}</td>
                    	<td>${GetMarkBean.intTotalMarks_}</td>
                 	</tr>
                </c:forEach>

                </tbody> 
              </table>

              </div>
            </div>

       </div>
     </div>
</div>



<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>

</body>
</html>
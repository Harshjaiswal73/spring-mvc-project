<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="../common/common_links.jsp"></jsp:include>
<style>
 #card1:hover{
 background-color:grey;
 }
 #card2:hover{
 background-color:grey;
 }
 #card3:hover{
 background-color: grey;
 }
 #card4:hover{
 background-color:grey;
 }
 #card5:hover{
 background-color:grey;
 }
 #card6:hover{
 background-color: grey;
 }
</style>
</head>
<body>
<div class="container-fluid">
<!-- include header -->
<jsp:include page="../common/studentheader.jsp"></jsp:include>
<!-- end of header -->
<div class="row">
<div class="col-sm-12"style="height:500px;">
<!-- dashbord Start -->
<div class="row" style="padding-top: 15px;padding-bottom: 15px;">
<div class="col-sm-1"></div>
<div class="col-sm-10">
<div class="row">
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card1"class="card" style="width:18rem;">
<i class="bi bi-house-door" style="font-size: 60px"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="dashboard"style="text-decoration:none;font-size:30px;font-weight:600;">Home</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card2" class="card" style="width: 18rem;card:2;">
<i class="bi bi-view-stacked" style="font-size: 60px"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="viewassign"style="text-decoration:none;font-size:30px;font-weight:600;">View Assignment</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card3" class="card" style="width: 18rem;id:card3;">
<i class="bi bi-person-circle" style="font-size: 60px"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="feedback"style="text-decoration:none;font-size:30px;font-weight:600;">Feedback</a>
    </p>
  </div>
</div>
</div>
</div>
<div class="row mt-4">
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card4"class="card" style="width: 18rem;id:card4">
<i class="bi bi-house-door" style="font-size: 60px"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="changepass"style="text-decoration:none;font-size:30px;font-weight:600;">Change Password</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card5" class="card" style="width: 18rem;id:card5">
<i class="bi bi-person-circle" style="font-size: 60px"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="profile"style="text-decoration:none;font-size:30px;font-weight:600;">Profile</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card6" class="card" style="width: 18rem;id:card6;">
<i class="bi bi-box-arrow-right" style="font-size: 60px"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="logout"style="text-decoration:none;font-size:30px;font-weight:600;">Logout</a>
    </p>
  </div>
</div>
</div>
</div>
</div>
</div>
<div class="col-sm-1"></div>
</div>
<!-- dashbord end -->
</div>
</div>
<!-- Start Footer -->
<jsp:include page="../common/studentfooter.jsp"></jsp:include>
<!-- end of footer -->
</div>
</body>
</html>
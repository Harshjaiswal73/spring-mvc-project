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
 background-color:goldenrod;
 }
 #card2:hover{
 background-color:goldenrod;
 }
 #card3:hover{
 background-color: goldenrod;
 }
 #card4:hover{
 background-color:goldenrod;
 }
 #card5:hover{
 background-color:goldenrod;
 }
 #card6:hover{
 background-color: goldenrod;
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
<div class="row" style="padding-top:60px;padding-bottom: 15px;">
<div class="col-sm-1"></div>
<div class="col-sm-10">
<div class="row">
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card1"class="card" style="width:18rem;background-color:black;">
<i class="bi bi-house-door" style="font-size: 60px;color:goldenrod;"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="dashboard"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Home</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card2" class="card" style="width: 18rem;background-color:black;id:card2;">
<i class="bi bi-view-stacked" style="font-size: 60px;color:goldenrod;"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="viewassign"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">View Assignment</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card3" class="card" style="width: 18rem;background-color:black;id:card3;">
<i class="bi bi-rss"style="font-size: 60px;color:goldenrod;"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="feedback"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Feedback</a>
    </p>
  </div>
</div>
</div>
</div>
<div class="row mt-4">
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card4"class="card" style="width: 18rem;background-color:black;id:card4">
<i class="bi bi-pass" style="font-size: 60px;color:goldenrod;"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="changepass"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Change Password</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card5" class="card" style="width: 18rem;background-color:black;id:card5">
<i class="bi bi-person-circle" style="font-size: 60px;color:goldenrod;"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="profile"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Profile</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div id="card6" class="card" style="width: 18rem; background-color:black; id:card6;">
<i class="bi bi-box-arrow-right" style="font-size: 60px;color:goldenrod;"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="logout"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Logout</a>
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
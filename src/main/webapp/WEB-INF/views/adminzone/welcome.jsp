<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to admin Zone</title>
<jsp:include page="../common/common_links.jsp"></jsp:include>
 <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            top: 0;
            width:68%;
            background-color: #343a40;
            padding-top: 20px;
            
        }
        .sidebar a {
            color: #adb5bd;
        }
        .sidebar a:hover {
            color: #fff;
        }
        .content {

            padding: 20px;
        }
    </style>
</head>
<body> 
<div class="container-fluid">
<jsp:include page="../common/adminheader.jsp"></jsp:include>
<div class="row"style="min-height:600px;">
<div class="col-sm-3"style="padding: 0;margin: 0;">
<div class="sidebar">
    <h2 class="text-white text-center"></h2>
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link active" href="#">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../admin/uploadassignment">Upload Assignment</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../admin/downtask">Student Submission</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../admin/studymaterial">Study Material</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../admin/email">Send Email</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../admin/notification">Notification</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Response management</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Setting</a>
        </li>
    </ul>
    </div>
    </div>
    <div class="col-sm-9">
    <div class="row">
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div class="card" style="width: 18rem;background-color: black;">
<i class="bi bi-house-door"style="font-size:60px;color:goldenrod;"></i>
  <div class="card-body">
    <p class="card-text">
    <a href="#"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Home</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div class="card" style="width: 18rem;background-color:black;">

  <div class="card-body">
  <i class="bi bi-upload"style="font-size:60px;color:goldenrod;"></i>
    <p class="card-text">
    <a href="../admin/uploadassignment"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">upload Assignment</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div class="card" style="width: 18rem;background-color: black;">

  <div class="card-body">
  <i class="bi bi-backpack"style="font-size:60px;color:goldenrod;"></i>
    <p class="card-text">
    <a href="../admin/downtask"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Student Submission</a>
    </p>
  </div>
</div>
</div>
</div>
 <div class="row">
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div class="card" style="width: 18rem;background-color:black;">

  <div class="card-body">
  <i class="bi bi-highlighter"style="font-size:60px;color:goldenrod;"></i>
    <p class="card-text">
    <a href="../admin/studymaterial"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Study Material</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div class="card" style="width: 18rem;background-color:black;">
  <div class="card-body">
  <i class="bi bi-envelope"style="font-size:60px;color:goldenrod;"></i>
    <p class="card-text">
    <a href="../admin/email"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Send Email</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div class="card" style="width: 18rem;background-color: black;">
  <div class="card-body">
  <i class="bi bi-bell"style="font-size:60px;color:goldenrod;"></i>
    <p class="card-text">
    <a href="../admin/notification"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Notification</a>
    </p>
  </div>
</div>
</div>
</div>
 <div class="row">
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div class="card" style="width: 18rem;background-color: black;">
  <div class="card-body">
  <i class="bi bi-kanban"style="font-size:60px;color:goldenrod;"></i>
    <p class="card-text">
    <a href="viewassign"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Response Management</a>
    </p>
  </div>
</div>
</div>
<div class="col-sm-4 d-flex justify-content-center text-center" style="padding:1%;">
<div class="card" style="width: 18rem;background-color: black;">

  <div class="card-body">
  <i class="bi bi-gear"style="font-size:60px;color:goldenrod;"></i>
    <p class="card-text">
    <a href="feedback"style="text-decoration:none;font-size:30px;font-weight:600;color:white;">Setting</a>
    </p>
  </div>
</div>
</div>
</div>
     </div>
</div>
</div>


<!-- footer -->
<jsp:include page="../common/adminfooter.jsp"></jsp:include>
</body>
</html>
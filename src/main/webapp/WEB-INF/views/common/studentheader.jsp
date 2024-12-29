
<%@page import="org.springframework.web.bind.annotation.RequestMethod"%>
<div class="row"style="background-color:black;height: 100px;">
<div class="col-sm-2">
 <img src="resources/images/logo.png" height="100px"style="margin-left: 130px;height: 200px;margin-top: -45px;"/>
</div>
<div class="col-sm-8 text-end"style="margin-top:30px;">

<h2 style="color:white;"><i class="bi bi-mortarboard-fill"></i>Welcome to Student Zone</h2>
</div>
<div class="col-sm-2 text-center"style="margin-top: 30px;">

<% 
  String pname=request.getAttribute("picname").toString();
  String name=request.getAttribute("uname").toString();
%>
<img alt=""src="./resources/userpics/<%=pname%>"style="width:45%;height:100px;border-radius:50%;"/> 
<p <%=name%> style="font-weight: 700; font-size: 20px;color:white;color:white;"></p>
</div>
</div>
<div class="row"style="width:100%;">
<div class="col-sm-12"style="background-color:black;">
<!-- start navbar -->
<nav class="navbar navbar-expand-lg color-darkblue bg-light">
  <div class="container-fluid"style="background-color: black;">
    <a class="navbar-brand ml-20" href="#"style="margin-left: 11%;color:white;">E-Programmer</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown"style="margin-left:32vw;">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="dashboard"style="color:white;">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="viewassign"style="color:white;">View Assignment</a>
        </li>
       <!--   <li class="nav-item">
          <a class="nav-link active" href="#">Stud Material</a>
        </li> -->
         <li class="nav-item">
          <a class="nav-link active" href="upload"style="color:white;">Upload Assignment</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="feedback"style="color:white;">Feedback</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"style="color:white;">
            Settings
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="profile">My Profile</a></li>
            <li><a class="dropdown-item" href="changepass">Change Password</a></li>
            <li><a class="dropdown-item" href="logout">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- end navbar -->
</div>
</div>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="common/common_links.jsp"></jsp:include>
<style>
.form-control
{
  margin-top:30px;
  height:50px;
}
</style>
</head>
<body>
  <div class="container-fluid"> 
  <jsp:include page="common/header.jsp"></jsp:include>
    <div class="row">
     <div class="col-sm-12"style="padding-top:50px;padding-bottom:70px;background-image:url('../Eprogrammer/resources/images/andras-vas-Bd7gNnWJBkU-unsplash.jpg');">
     <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-4">
      <!-- <img alt="" src="#" style="height:100%; width:100%;mix-blend-mode: darken;">-->
      </div>
      <div class="col-sm-4"style="background-color:whitesmoke;margin-top:50px;font-family:serif;padding-top:10px;border-radius:5%;border: 5px double white;
    box-shadow: 0px 0px 5px 5px gray;height:450px;">
        <form action="processLogin" method="post">
       <h3 class="text-center">User Login</h3>
       <hr style="height:2px;color:black;background-color:black;"/>
       <select class="form-control"name="UserType">
       <option value="">User Type</option>
       <option value="STUDENT">Student</option>
       <option value="ADMIN">Admin</option>
       </select>
       <input type="email" name="UserId"placeholder="User Id" required="required" class="form-control"/>
       <input type="password"name="Pass" placeholder="password" required="required" class="form-control"/>
       <center>
          <input type="submit" value="Login" class="btn btn-primary mt-3 w-100" style="height:40px;"/>
       </center>
       <center><a href="#"style="margin-top:30px;">Forget Password</a><br></center>
       <%
         String res="";
       if(request.getAttribute("msg")!=null)
    	   res=request.getAttribute("msg").toString();
       %>
       <p class="text-center bg-light text-danger h5"><%=res %></p>
       </form> 
      </div>
           <div class="col-sm-2"></div>
     </div>
    </div>
    </div>
    <!--main part end-->
    <jsp:include page="common/footer.jsp"></jsp:include>
   </div>
</body>
</html>
<%@page import="com.google.protobuf.Message"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="common/common_links.jsp"></jsp:include>
</head>
<body>
<div class="container-fluid">
 <jsp:include page="common/header.jsp"></jsp:include>
    <div class="row">
     <div class="col-sm-12">
     <h2 class="text-center" style="text-decoration:underline;font-style:italic;">Student Registration Form</h2>
     <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-8 regform" style="background-color:#76d7c4;padding:20px;margin:10px;">
      <%
      String message="";
        if(request.getAttribute("msg")!=null)
        	message=request.getAttribute("msg").toString();
      %>
      <p class="text-center bg-primary text-white h3"><%=message%></p>
       <form action="SaveReg" method="post" enctype="multipart/form-data">
        <div class="row">
         <div class="col-sm-6">
          <input type="text" name="Name" placeholder="Name" class="form/control"/>
          </div>
           <div class="col-sm-6">
            <span class="form-control">Gender:
             <input type="radio"name="Gender" value="male"/>Male
             <input type="radio" name="gender" value="female"/>Female
            </span>
           </div>
        </div>
        <div class="row">
         <div class="col-sm-6">
         <select name="course" class="form-control">
          <option value="">Select Course</option>
          <option>BCA</option>
          <option>MCA</option>
          <option>Diploma(CS/IT)</option>
         </select>
         </div>
        </div>
       </form>
     </div>
     </div>
    </div>
    <!-- main part end -->
    <jsp:include page="common/footer.jsp"></jsp:include>
   </div>
</body>
</html>
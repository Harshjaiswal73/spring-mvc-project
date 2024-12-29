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
  .regform .row
  {
    margin-top:10px;
    margin-bottom:15px;
  }
</style>
<script>
 $(document).ready(function(){
	 $("#ImgRefresh").click(function(){
		 $.get("CaptchaGenerator",null,function(){
			 $("#ImgCaptcha").attr("src","CaptchaGenerator");
		 })
	 });
 });
</script>
</head>
<body>
<div class="container-fluid">
 <jsp:include page="common/header.jsp"></jsp:include>
    <div class="row">
     <div class="col-sm-12">
     <h2 class="text-center" style="text-decoration:underline;margin-top:100px;font-family:serif;">Student Registration Form</h2>
     <%
       String message="";
     if(request.getAttribute("msg")!=null)
     {
    	 message=request.getAttribute("msg").toString();
     }
     %>
     <p class="text-center color-blue"><%=message %></p>
     <div class="row">
      <div class="col-sm-3"></div>
      <div class="col-sm-6 regform" style="background-color:aliceblue;padding:20px;margin:10px;border: 5px double white;
    box-shadow: 0px 0px 5px 5px gray;margin-bottom: 80px;">
       <form action="SaveRegsi" method="post" enctype="multipart/form-data">
        <div class="row">
        <div class="col-sm-6">
          <input type="email" name="EmailId" placeholder="Email Id" class="form-control"/>
         </div>
         <div class="col-sm-6">
          <input type="text" name="Name" placeholder="Name" required="required" class="form/control"style="width:100%;height:100%;border:2px;border-radius:5px;"/>
          </div>
          </div>
          <div class="row">
           <div class="col-sm-6">
            <span class="form-control">Gender:
             <input type="radio"name="Gender" value="male"/>Male
             <input type="radio" name="Gender" value="female"/>Female
            </span>
           </div>
           <div class="col-sm-6">
            <input type="text" name="clgName" placeholder="College Name" required="required" class="form/control"style="width:100%;height:100%;border-radius:5px;border:2px;">
           </div>
          </div>
        <div class="row">
         <div class="col-sm-6">
         <select name="course" class="form-control"required="required">
          <option value="">Select Course</option>
          <option value="BCA">BCA</option>
          <option value="MCA">MCA</option>
          <option value="Diploma(CS/IT)">Diploma(CS/IT)</option>
         </select>
         </div>
         <div class="col-sm-6">
         <select name="courseyear" class="form-control"required="required">
          <option value="">Select Year</option>
          <option value="First Year">First Year</option>
          <option value="Second Year">Second Year</option>
          <option value="Third Year">Third Year</option>
         </select>
        </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
           <input type="text" name="DOB" placeholder="Date of Birth" required="required" class="form-control"/>
          </div>
          <div class="col-cm-6"style="margin-top:20px;">
          <span class="form-control">
          photo:
          <input type="file" name="Stupic"/>
          </span>
          </div>
        </div>
        <div class="row">
         <div class="col-sm-6">
          <input type="number" name="MobileNo" placeholder="Mobile No" required="required" class="form-control"/>
         </div>
        </div>
        <div class="row">
         <div class="col-sm-12">
          <textarea rows="3" name="Address" required="required" placeholder="Type your address here" class="form-control"></textarea>
         </div>
        </div>
        <div class="row">
         <div class="col-sm-6">
          <input type="password" required="required" name="pass" placeholder="password" class="form-control"/>
         </div>
         <div class="col-sm-6">
          <input type="password" name="Comfpass" placeholder="Confirm Password" class="form-control"/>
         </div>
        </div>
        <!-- Start Captcha code section -->
        <div class="row">
         <div class="col-sm-6">
          <span class="form-control">
          Captcha code: <img alt="captchacode" width="150px" height="40px"
              src="CaptchaGenerator" id="ImgCaptcha" width="35px" height="30px">
          <img alt="" src="resources/images/refresh.png" id="ImgRefresh" height="30px"style="margin-left: 250px;margin-top: -65px;">
          </span>
         </div>
         <div class="col-sm-6">
         <input type="text" name="CaptchaCode" placeholder="Type Captcha code here" class="form-control"/> 
         </div>
        </div>
        <!-- End Captcha Code section -->
        <div class="row-text-center">
        <div class="col-sm-6">
         <input type="submit" name="Register"value="Register Now" class="btn-btn-primary"/>
        </div>
        <div class="col-sm-6">
        <input type="reset" value="Clear All" class="btn btn-danger"style="margin-left:400px;margin-top:-70px;"/>
        </div>
        </div>
       </form>
     </div>
     <div class="col-sm-2"></div>
     </div>
    </div>
    </div>
    <!-- main part end -->
    <jsp:include page="common/footer.jsp"></jsp:include>
   </div>
</body>
</html>
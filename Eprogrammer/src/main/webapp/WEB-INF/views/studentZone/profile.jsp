<%@page import="java.sql.ResultSet"%>
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
.form-control
{
 margin-top:2%;
}
</style>
</head>
<body>
<div class="container-fluid">
<!-- include header -->
<jsp:include page="../common/studentheader.jsp"></jsp:include>
<!-- end of header -->
<div class="row profile" style="background-image: url('/Eprogrammer/resources/images/young2.png');
min-height: 600px;background-repeat: norepeat;background-size:cover;">
<div class="col-sm-2"></div>
<div class="col-sm-8 frm"style="background-color: whitesmoke;min-height: 600px;padding: 20px;margin: 15px;border: 5px double white;
    box-shadow: 0px 0px 5px 5px gray;">
<h2 class="text-center text-dark">My Profile</h2>
<hr/>
<%
 ResultSet rs=(ResultSet)request.getAttribute("udata");
 rs.next();
String res="";
if(request.getAttribute("msg")!=null)
	res=request.getAttribute("msg").toString();
%>
<form action="saveprof" method="post"enctype="multipart/Form-data">
<div class="row">
<div class="col-sm-8">
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Name</label>
  <input type="text" class="form-control" id="exampleFormControlInput1"
  name="Name" placeholder="name@example.com" value="<%=rs.getString("name") %>">
</div>
<div class="mb-3">
  <label for="tgen" class="form-label">Gender</label>
  <span class="form-control" id="tgen">
  <%
    if(rs.getString("gender").equalsIgnoreCase("Male"))
    { 	
  %>
      <input type="radio" name="Gender" value="Male"checked="checked"/>Male
      <input type="radio" name="Gender" value="Female"/>Female 
      <%
    }
    else
    {
      %> 
  <input type="radio" name="Gender" value="Female"checked="checked"/>Female
  <%
    }
  %>
  
  </span>
</div>
<div class="mb-3">
  <label for="tcourse" class="form-label">Course</label>
  <select name="course" class="form-control" id="tcourse">
           <option value="">Select Course</option>
          <option value="BCA">BCA</option>
          <option value="MCA">MCA</option>
          <option value="Diploma(CS/IT)">Diploma(CS/IT)</option>
  </select>
</div>

<div class="mb-3">
  <label for="tcyear" class="form-label">year</label>
           <select name="Year" class="form-control" id="tcyear">
          <option value="">Select Year</option>
          <option value="First Year">First Year</option>
          <option value="Second Year">Second Year</option>
          <option value="Third Year">Third Year</option>
         </select>
</div>
<div class="mb-3">
  <label for="tdob" class="form-label">Dob</label>
  <input type="text" name="DOB" placeholder="Date of Birth"
   class="form-control"id="tdob"value="<%=rs.getString("dob") %>"/>
</div>
<div class="mb-3">
  <label for="tmobile" class="form-label">Mobile No</label>
  <input type="number" name="MobileNo" placeholder="Mobile No" 
  class="form-control"id="tmobile"value="<%=rs.getString("mobileno") %>"/>
</div>


<!-- stupic start -->

<!-- stupic end -->
</div>
<div class="col-sm-4 text-center">
<img src="resources/userpics/<%=rs.getString("pic_filename") %>" style="width:60%;height:100px;border-radius: 50%;"/>
<br>
<input type="file" name="userpics"/>
<br><br>
<span class="text-primary h5">Hello,<%=rs.getString("name") %></span>
<br>
Email Id:<%=rs.getString("email_id") %>
</div>
</div>
<input type="submit"value="Update Profile" class="btn btn-primary w-40"/>
<script>
$(document).ready(function() {
	$("#tcourse").val("<%=rs.getString("course")%>");
	$("#tcyear").val("<%=rs.getString("year")%>");
})
</script>
</form>

</div>
<div class="col-sm-2"></div>
</div>
<!-- start footer -->
<jsp:include page="../common/studentfooter.jsp"></jsp:include>
<!-- end footer -->
</div>
</head>
<body>

</body>
</html>
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

<!-- start of change password -->
<div class="row"style="min-height:480px;">
<div class="col-sm-4">

</div>
<div class="col-sm-4 text-center text-light"style="background-color:whitesmoke;padding:2%;border-radius: 10px;
max-height: 350px;margin: 20px;margin-top:60px;border: 5px double white;
    box-shadow: 0px 0px 5px 5px gray;">
<h1>Change Password</h1>
<form action="UpdatePass" method="post">
<input type="password" placeholder="Enter Your old password" class="form-control"name="Curpass"/>
<input type="password" placeholder="Enter your new password" class="form-control"name="Newpass"/>
<input type="password" placeholder="Re-Enter Your new password" class="form-control"name="Confpass"/>
<input type="submit" value="Update" class="btn btn-primary w-50 mt-3"/>
</form>
<% 
  String res="";
if(request.getAttribute("msg")!=null)
	res=request.getAttribute("msg").toString();
%>
<p class="text-center bg-light text-danger h5"
  style="margin:15px"><%=res %></p>
</div>
<div class="col-sm-4"></div>
</div>
<!-- end of change password -->
<!-- start footer -->
<jsp:include page="../common/studentfooter.jsp"></jsp:include>
<!-- end password -->

</div>
</body>
</html>
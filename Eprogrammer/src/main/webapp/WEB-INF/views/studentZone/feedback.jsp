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
  width: 40%;
}
</style>
</head>
<body>
<div class="container-fluid">
<!-- include header -->
<jsp:include page="../common/studentheader.jsp"></jsp:include>
<!-- end of header -->
<%
  String message="";
if(request.getAttribute("msg")!=null)
	message=request.getAttribute("msg").toString();
%>
<div class="row">
<div class="col-sm-12"style="text-align: center;height:450px;">
<!-- feedback form start -->
<div class="mb-3 text-center"style="text-align: center;border: 5px double white;
    box-shadow: 0px 0px 5px 5px gray;width: 50%;margin-top:50px;margin-left:25%;background-color:aliceblue;height:300px;">
   <h5>Please send Your valuable feedback</h5>
   <p class="text-center text-black h4" style="padding:5px;margin:3px;width: 40%;margin-left: 30%;"><%=message%></p>
   <form action="saveFeedback" method="post"enctype="multipart/form-data">
  <label for="exampleFormControlInput1" class="form-label"></label>
  <center>
  <input name="title" class="form-control" id="exampleFormControlInput1" placeholder="title/Topic of Feedback"style="width:82%;">
  </center>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label"></label>
  <center>
  <textarea name="fmsg" class="form-control" id="exampleFormControlTextarea1" placeholder="Type Your feedback Here..." rows="3"style="width:82%;"></textarea>
  </center>
</div>
<input class="btn-btn primary" type="submit"value="send Feedback">
</div>
</form>

<!-- feedback form end -->
</div>
</div>
<!-- Start footer section  -->
<jsp:include page="../common/studentfooter.jsp"></jsp:include>
<!-- End footer section -->
</div>
</body>
</html>
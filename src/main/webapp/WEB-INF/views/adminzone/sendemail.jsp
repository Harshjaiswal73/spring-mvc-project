<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="../common/common_links.jsp"></jsp:include>
<style>
.form-control{
 margin-bottom: 30px;
 margin-top:30px;
}
</style>
</head>

<body>
<div class="container-fluid">
<!-- header -->
<jsp:include page="../common/adminheader.jsp"></jsp:include>
<div class="row"style="min-height:450px;padding-top:15px;padding-bottom:20px;">
<div class="col-sm-4"style="height:500px;"></div>
<div class="col-sm-4 text-center"style="background-color:whitesmoke;border-radius: 10px;height:450px;margin-top:50px;
border: 5px double white;
    box-shadow: 0px 0px 5px 5px gray;">
<%
 String res="";
if(request.getAttribute("msg")!=null)
	res=request.getAttribute("msg").toString();
%>
<h1 class="text-center text-black">Send Email</h1>
<p class="text-center bg-light text-danger h5"><%=res%></p>

<form action="send"method="post"style="margin-top:50px;">
<input type="text"placeholder="Send to"name="sendto" required="required" class="form-control mt-2"/>
<input type="text"placeholder="Subject of the email"name="subject"class="form-control mt-2"/>
<textarea rows="" cols=""placeholder="Message"name="message"class="form-control mt-2"required="required"></textarea>
<input type="submit"class="btn btn-primary mt-2 w-50"value="Send Email">
</form>
</div>
<div class="col-sm-4"></div>
</div>

<!-- footer -->
<jsp:include page="../common/adminfooter.jsp"></jsp:include>
</div>
</body>
</html>
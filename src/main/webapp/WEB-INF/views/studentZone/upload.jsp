<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="../common/common_links.jsp"></jsp:include>
</head>
<body>
<div class="container-fluid mx-0 px-0">
<jsp:include page="../common/studentheader.jsp"></jsp:include>
<div class="row"style="min-height:600px;background-color: smokewhite;">
<div class="col-sm-4"></div>
<div class="col-sm-4"style="background-color:whitesmoke;border: 5px double white;
    box-shadow: 0px 0px 5px 5px gray;border-radius:3%;margin-top:70px;margin-bottom:70px;height:450px;">
<form action="uploadfile" method="post" enctype="multipart/form-data">
<h1 class="text-center">Upload</h1>
<hr>
<%
String s="";
if(request.getAttribute("msg")!=null)
	s=request.getAttribute("msg").toString();
%>
<p class="text-center h4 bg-primary text-white"><%=s%></p>
<input type="text"name="Title" placeholder="Title/Topic" class="form-cntrol w-100"/><br><br>
<input type="text"name="description"placeholder="Description"class="form-control w-100"/><br><br>
<span class="form-control">
Choose file:
<input type="file" name="upload"/><br><br>
</span><br><br>
<input type="submit" value="upload File"class="btn btn-primary w-40"/><br><br>
</form>
</div>
<div class="col-sm-4"></div>
</div>
<!-- start footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- end footer -->
</div>
</body>
</html>
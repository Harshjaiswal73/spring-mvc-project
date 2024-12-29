<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
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
<div class="container-fluid">
<!-- header -->
<jsp:include page="../common/adminheader.jsp"></jsp:include>
<div class="row">
<div class="col-sm-4"style="height:700px;"></div>
<div class="col-sm-4 text-center"style="background-color: whitesmoke;padding: 
15px;margin-top: 5%;border-radius:15px;height:350px;border: 5px double white;
    box-shadow: 0px 0px 5px 5px gray;height: 500px;">
<h1>Add Notification</h1>
<%
  String message="";
ResultSet rs=(ResultSet)request.getAttribute("data");
int x=1;
if(request.getAttribute("msg")!=null)
{
	message=request.getAttribute("msg").toString();
}
%>
<p><%=message%></p>
<form action="../admin/addnotification"method="post">
<textarea class="form-control mt-3"name="massage"placeholder="Type here a notification..."></textarea>
<input type="submit"class="btn btn-success mt-4"value="Add Notification">
<%
 String res="";
if(request.getAttribute("msg")!=null)
	res=request.getAttribute("msg").toString();
%>
<p class="text-center bg-light text-danger h5"
         style="margin:15px"><%=res%></p>
</form>
<table class="table table-stripped mt-3">
<tr>
<th>SNO.</th><th>Message</th><th>Added On</th><th>Delete</th>
</tr>
<%
 while(rs.next()){
%>
<tr>
<td><%=x%></td>
<td><%=rs.getString("newsmsg") %></td>
<td><%=rs.getString("postedon") %></td>
<td><a href="deletenoti?ni=<%=rs.getString("newsid")%>">Delete</a></td>
</tr>
 <%
  x++;
 }
 %>
</table>

</div>
<div class="col-sm-4"></div>
</div>



<!-- footer -->
<jsp:include page="../common/adminfooter.jsp"></jsp:include>
</div>

</body>
</html>
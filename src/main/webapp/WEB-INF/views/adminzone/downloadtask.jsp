<%@page import="java.sql.ResultSet"%>
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
<jsp:include page="../common/adminheader.jsp"></jsp:include>
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
<%
  ResultSet rs=(ResultSet)request.getAttribute("task");
%>
<p class="text-center h4 text-info;"
 style="text-decoration:underline;margin:15px;">Download Submitted Assignments</p>
<table class="tbl table table-stripped table-hover"
  style="margin-top:30px;margin-bottom:30px;">
 <tr>
 <th style="background-color: navy;color:white;">submissionid</th>
 <th style="background-color: navy;color:white;">title</th>
 <th style="background-color: navy;color:white;">descrption</th>
 <th colspan="3" style="background-color: navy;color:white;">submittedby</th>
 <th style="background-color: navy;color:white;">submittedon</th>
  <th style="background-color: navy;color:white;">date & Time</th>
 <th style="background-color: navy;color:white;">Download</th>
 </tr>
 <%
  while(rs.next())
  {
  %>
  <tr>
  <td><%=rs.getInt("submissionid") %></td><td><%=rs.getString("title") %></td>
  <td colspan="3"><%=rs.getString("descrption") %></td><td><%=rs.getString("submittedby") %></td>
  <td><%=rs.getString("filename") %></td><td><%=rs.getString("submittedon") %></td>
   <td>
     <a href="../admin/download?filename=<%=rs.getString("filename") %>">Download</a>
   </td>
  </tr>
  <%
  }
 %>
 
</table>
</div>
</div>
</div>
<jsp:include page="../common/studentfooter.jsp"></jsp:include>
</body>
</html>
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
  ResultSet rs=(ResultSet)request.getAttribute("stu");
%>
<p class="text-center h4 text-info;"
 style="text-decoration:underline;margin:15px;">Manage Students</p>
<table class="tbl table table-stripped table-hover"
  style="margin-top:30px;margin-bottom:30px;">
 <tr>
 <th style="background-color:navy;color:white;">email_id</th>
 <th style="background-color:navy;color:white;">name</th>
 <th style="background-color:navy;color:white;">gender</th>
 <th style="background-color:navy;color:white;">college</th>
 <th style="background-color:navy;color:white;">course</th>
 <th style="background-color:navy;color:white;">year</th>
 <th style="background-color:navy;color:white;">dob</th>
 <th style="background-color:navy;color:white;">pic_filename</th>
 <th style="background-color:navy;color:white;">mobileno</th>
 <th colspan="2" style="background-color:navy;color:white;">address</th>
 <th style="background-color:navy;color:white;">registered_on</th>
 </tr>
 <%
  while(rs.next())
  {
  %>
  <tr>
  <td><%=rs.getString("email_id") %></td><td><%=rs.getString("name") %></td>
  <td><%=rs.getString("gender") %></td><td><%=rs.getString("college") %></td>
  <td><%=rs.getString("course") %></td><td><%=rs.getString("year") %></td>
  <td><%=rs.getString("dob") %></td><td><img src="../resources/userpics/<%=rs.getString("pic_filename")%>"
  style="width:80px;height:80px;border-radius:10%;"/></td>
  <td><%=rs.getString("mobileno") %></td><td colspan="2"><%=rs.getString("address") %></td>
    <td><%=rs.getString("registered_on") %></td>
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
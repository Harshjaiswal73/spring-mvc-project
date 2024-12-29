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
<div class="col-sm-1"style="height:700px;"></div>
<div class="col-sm-10">
<%
  ResultSet rs=(ResultSet)request.getAttribute("fdata");
%>
<p class="text-center h4 text-info;"
 style="text-decoration:underline;margin:15px;">Manage Feedback</p>
<table class="tbl table table-stripped table-hover"
  style="margin-top:30px;margin-bottom:30px;">
 <tr>
 <th style="background-color: navy;color:white;">Sr.No.</th>
 <th style="background-color: navy;color:white;">Submitted By</th>
 <th style="background-color: navy;color:white;">Title</th>
 <th style="background-color: navy;color:white;">Description</th>
  <th style="background-color: navy;color:white;">Feedback Dt</th>
 </tr>
 <%
 int i=1;
  while(rs.next())
  {
  %>
  <tr>
  <td><%=i %></td>
  <td><%=rs.getString("Topic") %></td>
  <td><%=rs.getString("Message")%></td>
  <td><%=rs.getString("user_id")%></td>
  <td ><%=rs.getString("Feedback_DT") %>
  </tr>
  <%
  i++;
  }
 %>
</table>
</div>
</div>
</div>
<jsp:include page="../common/studentfooter.jsp"></jsp:include>
</body>
</html>
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
  ResultSet rs=(ResultSet)request.getAttribute("enq");
%>
<p class="text-center h4 text-info;"
 style="text-decoration:underline;margin:15px;">Manage Enquiry</p>
<table class="tbl table table-stripped table-hover"
  style="margin-top:30px;margin-bottom:30px;">
 <tr>
 <th style="background-color: navy;color:white;">EnquiryId</th>
 <th style="background-color: navy;color:white;">Name</th>
 <th style="background-color: navy;color:white;">Email Id</th>
 <th style="background-color: navy;color:white;">Mobile No</th>
 <th style="background-color: navy;color:white;"colspan="3">message</th>
 <th style="background-color: navy;color:white;">Date&time</th>
 </tr>
 <%
  while(rs.next())
  {
  %>
  <tr>
  <td><%=rs.getInt("enquiryid") %></td><td><%=rs.getString("name") %></td>
  <td><%=rs.getString("emailid") %></td><td><%=rs.getString("mobileno") %></td>
  <td colspan="3"><%=rs.getString("message") %></td><td><%=rs.getString("enquiry_dt") %></td>
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
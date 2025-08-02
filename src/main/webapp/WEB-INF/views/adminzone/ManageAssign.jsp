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
<!-- start view assignment -->
<div class="row">
<div class="col-sm-1"style="height:700px;"></div>
<div class="col-sm-10">
<%
  ResultSet rset=(ResultSet)request.getAttribute("assign");
%>
<p class="text-center h4 text-info;"
 style="text-decoration:underline;margin:15px;">View Tasks</p>
<table class="tbl table table-stripped table-hover"
  style="margin-top:30px;margin-bottom:30px;">
 <tr>
 <th style="background-color: navy;color:white;">Task Id</th>
 <th style="background-color: navy;color:white;">Title</th>
 <th style="background-color: navy;color:white;">Description</th>
 <th style="background-color: navy;color:white;">uploaded on</th>
 <th style="background-color: navy;color:white;">Download Task</th>
 </tr>
 <%
  while(rset.next())
  {
  %>
  <tr>
  <td><%=rset.getInt("uploadid")%></td><td><%=rset.getString("title") %></td>
  <td><%=rset.getString("description")%></td><td><%=rset.getString("submissiondb")%></td>
  <td><a href="../admin/download?filename=<%=rset.getString("filename")%>">Download</a></td>
  </tr>
  <%
  }
 %>
</table>
</div>
</div>
<!-- End view assignment -->

</div>
<jsp:include page="../common/studentfooter.jsp"></jsp:include>
</body>
</html>
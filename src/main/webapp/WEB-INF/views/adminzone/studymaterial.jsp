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
  margin-bottom:30px;
}
</style>
</head>
<body>
<div class="container-fluid">
<jsp:include page="../common/adminheader.jsp"></jsp:include>
<div class="row"style="min-height:400px;">
<div class="col-sm-12" style="background-size: cover;">
    <div class="row" style="background-color:smokewhite; height:81.3%; width:100%; position:absolute; z-index:1;">

    </div>
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4 text-center text-black p-4" style="background-color:whitesmoke; margin-top:50px ;
         border-radius:10px; position:relative; z-index:1;border: 5px double white;
    box-shadow: 0px 0px 5px 5px gray;">
            <h4>Upload Study Material</h4><hr style="height: 3px;position:relative; z-index:1;" />
                    <%
          String s="";
        if(request.getAttribute("msg")!=null)
        	s=request.getAttribute("msg").toString();
        %>
        <p class="text-center bg-info text-black h5" style="margin:3px;"><%=s%></p>
                           <form action="../admin/savestudy" method="post" enctype="multipart/form-data">
                               <input type="text" name="subject" placeholder="Name of subject" class="form-control" />
                               <input type="text" name="title" placeholder="Title/Topic" class="form-control" />              
                               <textarea class="form-control" name="descript" placeholder="Description"></textarea>
                               <span class="form-control">
                                   Assignment File:
                                   <input type="file" name="Studyfile" />
                               </span>
                               <input type="submit" value="Upload File" class="btn btn-primary w-5" />
                           </form>
            <h4 class="bg-info text-white"></h4>
        </div>
        <div class="col-sm-4"></div>
    </div>
</div>
</div>
<!-- include footer -->
<jsp:include page="../common/adminfooter.jsp"></jsp:include>
<!-- End footer -->
</div>
</body>
</html>
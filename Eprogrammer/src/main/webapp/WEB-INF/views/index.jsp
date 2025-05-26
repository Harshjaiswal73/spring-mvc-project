<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E Programmer</title>
<jsp:include page="common/common_links.jsp"></jsp:include>
</head>
<body>
   <div class="container-fluid" style="background-color:lavender;">
     <jsp:include page="common/header.jsp"></jsp:include>
     <!-- Start main div -->
     <div class="row main"style="background-color: aliceblue;">
      <div class="col-sm-12"style="margin-top:20px;">
       <div class="row news"style="background-color:white;width:100%;position:fixed;z-index:2;margin-left:-30px;">
         <div class="col-sm-12">
         <%
            ResultSet rs=null;
         int x=1;
         if(request.getAttribute("noti")!=null)
         {
        	 rs=(ResultSet)request.getAttribute("noti");
         }
         %>
          <marquee style="color:black;" direction="left" onmouseover="stop()"onmouseout="start()"scrollamount="10">Timely Course Updates: Keep learners informed about new modules, schedule changes, and upcoming deadlines.
          <%
             while(rs.next())
             {
          %>
          <i class="bi bi-code-slash"></i><%=rs.getString("newsmsg") %>
          <%
           if(x==1)
           {
          %>
          <!--  <img src="<c:url value="/resources/images/new.img.gif"/>"width="40px" height="35px" />-->
              <%
              x++;
                }
             }
          %>
<!--           <i class="bi bi-code-slash"></i>  --> 
          </marquee>
         </div>
       </div>
       
        <div class="row slider"style="background-color: white;margin-top:45px;"/>
          <div class="col-sm-12"style="margin:0;padding:0;">
          <div id="carouselExampleIndicators" class="carousel slide"style="z-index:5" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/images/programminghub3.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/images/Project.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/images/deskcomputer.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
  
</div>
        </div> 
        <div class="row content"style="background-color:aliceblue;color:black;margin-top: 10px;">
          <div class="col-sm-12"style="width: 90%;margin-left: 65px;">
               <h1 style="margin:50px;margin-top:10px;font-family:serif;">Introduction</h1>
     <p class="intro2q"style="font-size:18px;font-style:italic;">Now a Days Professional - education scenario is rapidly changing and demanding. Industry
       requirements are to much ambitious and for fulfilling those industry requirements one have to be 
       more and more skilled in this respective field. Gripping of subject, knowledge about real world facts,
       familiarity with the real time problems and and solutions are the key ways to cope with above challenges.</p>
       
       <p class="text2"style="font-style:italic;"> This portal is enacting as a bridge of communication amongst students of different fields and different colleges.
       E-Programmer is a unique Web Portal personalized to meet all requirements of students of different fields at a 
       Single platform -Which would keep you up-to-date in academic education education and would be accessible from any
       place of the world. E-Programmer can  be defined as a portal that stores and Provides materials for online learning,
       performance and assessment etc.</p>
       
      <p class="text3"style="font-style:italic;"> Online learning refers to instruction that is delivered electronically through various Multimedia and Internet Platforms and 
       applications. It is used interchangeably with other terms such as web-based learning. e-learning computer-assisted instruction
       and Internet-based learning
       Online Learning allows students to have greater control over their learning process in terms of time and place.</p>
     </span>
          </div> 
        </div>
        </div>
     </div>
    
     <!-- End main div -->
     <jsp:include page="common/footer.jsp"></jsp:include>
   </div>
</body>
</html>
<!-- Start Enquiry Modal -->
  <div class="modal" tabindex="-1" id="exampleModal"aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content"style="background-color:whitesmoke;">
      <div class="modal-header">
        <h5 class="modal-title">How may I help you?</h5>
        <button type="button" class="btn-close bg-danger" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form action="SaveEnquiry"method="post">
          <input type="text" name="Name" placeholder="type your name here" class="form-control"/>
          <br>
          <input type="email" name="EmailId" placeholder="Type your EmailId here"class="form-control"/>
          <br>
          <input type="number" name="MobileNo" placeholder="Type your mobile number here" class="form-control"/>
          <br>
          <textarea name="Query" placeholder="type your query/concern here" class="form-control" rows="4"></textarea>
          <br>
          <button type="submit" class="btn btn-primary">Save Enquiry</button>
         </form>
      </div>
    </div>
  </div>
</div>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" 
data-bs-target="#exampleModal"style="position:fixed;top:5px;z-index:20;
left:1250px;width:100px;background-color: darkcyan">Enquiry</button>
<!-- End: Enquiryn Modal -->
<% 
  if(request.getAttribute("msg")!=null)
  {%>
  <script>
  alert("<%=request.getAttribute("msg").toString()%>");
  </script>
	  
  <%}
%>
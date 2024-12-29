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
   <div class="container-fluid" style="background-color:skyblue;">
     <jsp:include page="../common/header.jsp"></jsp:include>
     <!-- start developer page -->
       <div class="wrapper">
     <div class="row text-white"style="font-size: 30px; margin-left:5%;margin-top:15%;margin-left: 95px;">Hello</div>
    <div class="static-txt"style="margin-left:95px;font-size:50px;">I'm a</div>
    <div style="display:inline-flex;margin-left:97px;font-size:40px;color:purple" class="f_size_1"><div class=" typing" style="border:0; "></div></div>
  </div>
  <div class="imgbox">
   <img src="resources/images/Developerimg.jpg"style="border-radius: 50%;height: 300px;margin-left:900px;width: 300px;margin-top:-140px;">
  </div>
       <div class="name text-center"style="font-size:20px;color:aliceblue;margin-right: 55%;">Name &nbsp:&nbsp<span style="color:black;">Harsh Jaiswal</span></div>
       <div class="name text-center"style="font-size:20px;color:aliceblue;margin-left: -26%;">College Name &nbsp:&nbsp<span style="color:black;">Jagatpur post graduate college jagatpur varanasi</span></div>
       <div class="name text-center"style="font-size:20px;color:aliceblue;margin-right:50%;">Email &nbsp:&nbsp<span style="color:black;">hj336802@gmail.com</span></div>
       <div class="name text-center"style="font-size:20px;color:aliceblue;margin-right:49.5%;">Project Name &nbsp:&nbsp<span style="color:black;">E-Programmer</span></div>
       <div class="name text-center"style="font-size:20px;color:aliceblue;margin-right:66%;width:100%;">Description &nbsp:&nbsp<span style="color:#4070f4;"></span><p style="color:black">Online learning refers to instruction that is 
       delivered electronically through various Multimedia and Internet Platforms and 
       applications. It is used interchangeably with other terms such as web-based learning. 
       e-learning computer-assisted instruction
       and Internet-based learning</p></div>
       
      <!-- start Footer -->
      <jsp:include page="../common/footer.jsp"></jsp:include>
      <!-- end footer -->
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.12/typed.min.js" referrerpolicy="no-referrer"></script>
 <script>
     // typing animation start
     var typed = new Typed(".typing", {
         strings: ["Web Developer","UI/UX Designer","Coder"],
         typeSpeed: 200,
         BackSpeed: 60,
         loop: true,
     });
 </script>
</body>
</html>
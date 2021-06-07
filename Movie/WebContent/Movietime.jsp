<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Movie.Ticketingtime" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>CGV 영화 예매 도우미 프로그램</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/small-business.css" rel="stylesheet">

</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		String theatername = null, agelimit = null, moviename = null, situation = null, address = null;
		if(request.getParameter("theatername") != null){
			theatername = request.getParameter("theatername");
		}
		if(request.getParameter("agelimit") != null){
			agelimit = request.getParameter("agelimit");
		}
		if(request.getParameter("moviename") != null){
			moviename = request.getParameter("moviename");
		}
		if(request.getParameter("situation") != null){
			situation = request.getParameter("situation");
		}
		if(request.getParameter("address") != null){
			address = request.getParameter("address");
		}
	%>
	
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="http://localhost:8077/Movie/">CGV 영화 예매 도우미 프로그램</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
        		<ul class="navbar-nav ml-auto">
          			<li class="nav-item active">
            			<a class="nav-link" href="http://localhost:8077/Movie/index.jsp">Home
              				<span class="sr-only"></span>
            			</a>
          			</li>
          			<li class="nav-item">
            			<a class="nav-link" href="http://localhost:8077/Movie/MovieSchedule.jsp">상영 시간표</a>
          			</li>
          			<li class="nav-item">
            			<a class="nav-link" href="http://localhost:8077/Movie/searchcgv.jsp">영화관 찾기</a>
          			</li>
          			<li class="nav-item">
            			<a class="nav-link" href="http://localhost:8077/Movie/rank.jsp">영화 순위</a>
          			</li>
        		</ul>
			</div>
		</div>
  	</nav>
  	
  	<%
  		Ticketingtime ticketingtime = new Ticketingtime(theatername, agelimit, moviename, situation, address);
  		String[] select = ticketingtime.getSeat();
  	%>
  	
  	<table border="1" bordercolor="black" width ="400" height="<%=100*select.length %>" align = "center" >
		<tr bgcolor="gray" align ="center">
			<p><td colspan = "4" span style="color:white">시간 선택</td></p>
    	</tr>
    	<%
    		if(select.length == 0){
    	%>
    	<%
    		}
    		else{
    			for(int i = 0; i < select.length; i++){
    		    	%>
    		    		<tr>
    		    			<td><a href="Ticketing.jsp?theatername=<%=theatername%>&moviename=<%=moviename%>&movietime=<%=select[i]%>"><%=select[i] %></a></td>
    		    		</tr>
    		    	<%
    		    }
    		}%>
	</table>
	
	<%
		//theatername, moviename, text;
		System.out.println(theatername + " " + agelimit + " " + moviename + " " + situation + " " + address);
		for(int i = 0; i < select.length; i++){
			System.out.println(select[i]);
		}
	%>
</body>
</html>
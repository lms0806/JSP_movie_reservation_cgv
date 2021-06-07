<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Movie.Movietime"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
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
		String number = null, name = null, area = null;
		if(request.getParameter("theaternumber") != null){
			number = request.getParameter("theaternumber");
		}
		if(request.getParameter("theatername") != null){
			name = request.getParameter("theatername");
		}
		if(request.getParameter("area") != null){
			area = request.getParameter("area");
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
  		Date time = new Date();
  		String today = new SimpleDateFormat("yyyyMMdd").format(time);
  	%>
  	
  	
  	<%
  		Movietime movietime = new Movietime(area, number, name, Integer.parseInt(today));
  		String[][] movieinfo = movietime.getMovieinfo();
  		String[][] moviekind = movietime.getMoviekind();
  		String[] movieinfomation = movietime.getMovieinfomationstring();
  		String address = movietime.getAddress();
  	//movieinfo : 영화에 대하여, 
  	%>
  	
  	<table border="1" bordercolor="black" width ="<%=130*movieinfo.length %>" height="500" align = "center" >
    	<tr bgcolor="gray" align ="center">
			<p><td colspan = "<%=movieinfo.length %>" span style="color:white">영화 리스트</td></p>
    	</tr>
    	<tr>
    	<%
    		for(int i = 0; i < movieinfo.length; i++){
    	%>
    		<td><a href="Movieinfo.jsp?moviename=<%=movieinfo[i][1]%>&movieinfo=<%=movieinfomation[i]%>"><%=movieinfo[i][1] %></a></td>
    	<%
    		}
    	%>
    	</tr>
    	<tr>
    	<%
    		for(int i = 0; i < movieinfo.length; i++){
    	%>
    		<td>
    	<%
    			for(int j = 0; j < moviekind[i].length; j++) {			
    	%>
    				<%=moviekind[i][j] %><br>
      	<%
    			}
    	%>
    		</td>
    	<%
    		}
    	%>
    	</tr>
    	<tr>
    	<%
    		for(int i = 0; i < movieinfo.length; i++){
    	%>
    		<td><%=movieinfo[i][0] %></td>
    	<%
    		}
    	%>
    	</tr>
    	<tr>
    	<%
    		for(int i = 0; i < movieinfo.length; i++){
    	%>
    		<td><%=movieinfo[i][2] %></td>
    	<%
    		}
    	%>
    	</tr>
    	<tr>
    	<%
    		for(int i = 0; i < movieinfo.length; i++){
    	%>
    		<td><a href="Movietime.jsp?theatername=<%=name %>&agelimit=<%=movieinfo[i][0] %>&moviename=<%=movieinfo[i][1] %>&situation=<%=movieinfo[i][2] %>&address=<%=address%>" class="btn btn-primary">예매하기</a></td>
    	<%
    		}
    	%>
    	</tr>
	</table>
  	<%
  		for(int i = 0; i < movieinfo.length; i++){
  			System.out.println(movieinfo[i][0]);
  		}
  		//System.out.println(number + " " + name + " " + area);
  		System.out.println(today);
  	%>
</body>
</html>
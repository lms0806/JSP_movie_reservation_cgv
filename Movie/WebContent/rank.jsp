<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="Movie.MovieRank" %>
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
  		Calendar day = Calendar.getInstance();
  		day.add(Calendar.DATE , -1);
  		String yesterday = new SimpleDateFormat("yyyyMMdd").format(day.getTime());
  		day.add(Calendar.DATE , -6);
  		String lastweek = new SimpleDateFormat("yyyyMMdd").format(day.getTime());
  	%>
  	
	<%
  		String[] titles = {"순위", "영화 제목", "개봉일", "누적관객수"};
  	%>
  	
  	<%
  		String movieday = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=3762d327cdcaee4cf1208c3c6995199b&targetDt="+yesterday;
  		String movieweek = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=3762d327cdcaee4cf1208c3c6995199b&targetDt="+lastweek;
  		String title = "일간 박스 오피스" ;
  		String title1 = "주간 박스 오피스";
  	%>
  	
  	<%
  		MovieRank movierankday = new MovieRank(1,movieday);
  		String moviedaylist[][] = movierankday.getstrss();
  	%>
  	
  	<table border="1" bordercolor="black" width ="500" height="300" align = "center" >
		<tr bgcolor="gray" align ="center">
			<p><td colspan = "4" span style="color:white"><%= title %></td></p>
    	</tr>
    	<tr align = "center" bgcolor="#F0F8FF">
    		<% for(int i = 0; i < 4; i++){%>
				<td><%=titles[i]%></td>
			<% }%>
    	</tr>
    	<% for(int i = 0; i < moviedaylist.length; i++) { %>
    	<tr>
    		<% for(int j = 0; j < moviedaylist[i].length; j++){ %>
    			<td> <%=moviedaylist[i][j] %> </td>
    		<% } %>
    	</tr>
    	<% } %>
	</table>
  	
  	<%
  		MovieRank movierankweek = new MovieRank(0,movieweek);
  		String movieweeklist[][] = movierankweek.getstrss();
  	%>
  	
	<table border="1" bordercolor="black" width ="500" height="300" align = "center" >
		<tr bgcolor="gray" align ="center">
			<p><td colspan = "4" span style="color:white"><%= title1 %></td></p>
    	</tr>
    	<tr align = "center" bgcolor="#F0F8FF">
    		<% for(int i = 0; i < 4; i++){%>
				<td><%=titles[i]%></td>
			<% }%>
    	</tr>
    	<% for(int i = 0; i < movieweeklist.length; i++) { %>
    	<tr>
    		<% for(int j = 0; j < movieweeklist[i].length; j++){ %>
    			<td> <%=movieweeklist[i][j] %> </td>
    		<% } %>
    	</tr>
    	<% } %>
	</table>
	
</body>
</html>
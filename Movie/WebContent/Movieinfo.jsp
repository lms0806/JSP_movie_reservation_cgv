<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Movie.Movieinfomation"%>
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
		String moviename = null, movieinfo = null;
		if(request.getParameter("moviename") != null){
			moviename = request.getParameter("moviename");
		}
		if(request.getParameter("movieinfo") != null){
			movieinfo = request.getParameter("movieinfo");
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
  		Movieinfomation movieinfomation = new Movieinfomation(moviename, movieinfo);
  		String percent = movieinfomation.getPercent();
  		String[] spec = movieinfomation.getSpec();
  		String story = movieinfomation.getStory();
  		String[] evaluation = movieinfomation.getEvaluation();
  		String img = movieinfomation.getImgs();
  	%>
  	
  	<table style = "position: absolute; left: 20%; top: 10%" border="1" bordercolor="black" width ="500" height="600" >
		<tr bgcolor="gray" align ="center">
			<p><td colspan = "4" span style="color:white">영화내용</td></p>
    	</tr>
    	<tr>
    		<td><%=percent %></td>
    	</tr>
    	<tr>
    		<td>
    		<%
    			for(int i = 0; i < spec.length; i++){
    		%>
    				<%=spec[i] %><br>
    		<%
    			}
    		%>
    		</td>
    	</tr>
    	<tr>
    		<%
    			String[] storys = story.split("\\. |! |\\? ");
    		%>
    		<td>
    		<%
    			for(int i = 0; i < storys.length; i++){
    		%>
    				<%=storys[i] + "."%><br>
    		<%
    			}
    		%>
    		</td>
    	</tr>
    	<tr>
    		<td>
    		<%
    			for(int i = 0; i < evaluation.length; i++){
    		%>
    			<%=evaluation[i] %><br>
    		<%
    			}
    		%>
    		</td>
    	</tr>
	</table>
  	
  	<img style = "position: absolute; right: 20%; top: 10%" src=<%=img %> width="400" height="600"></img>

</body>
</html>
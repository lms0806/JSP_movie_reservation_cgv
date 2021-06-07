<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		String theatername = null, moviename = null, movietime = null;
		if(request.getParameter("theatername") != null){
			theatername = request.getParameter("theatername");
		}
		if(request.getParameter("moviename") != null){
			moviename = request.getParameter("moviename");
		}
		if(request.getParameter("movietime") != null){
			movietime = request.getParameter("movietime");
		}
		movietime = movietime.split("잔")[0];
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
  	
  	<div class = "container" style = "padding-top : 3%;">
		<div class = "col-Lg-4"></div>
		<div class = "col-Lg-4">
			<div class = "jumbotron" style = "padding-top : 20px;">
				<form method = "post" action = "Seat.jsp?theatername=<%=theatername%>&moviename=<%=moviename%>&movietime=<%=movietime%>">
					<h3 style = "text-align: center;">예매 화면</h3>
					<div style = "vertical-align: middle; text-align : center;" class = "form-group">
						<p>성인 : 11000원</p>
						<select name = "movieperson" style="width:100px; height:40px" name="language" >
							<option value="none">성인</option>
    						<%
    							for(int i = 1; i <= 9; i++){
    						%>
    								<option value="<%=i%>"><%=    i%></option>		
    						<%
    							}
    						%>
  						</select>
  						<p>청소년 : 9000원</p>
  						<select name = "movieperson1" style="width:100px; height:40px" name="language" >
							<option value="none">청소년</option>
    						<%
    							for(int i = 1; i <= 9; i++){
    						%>
    								<option value="<%=i%>"><%=    i%></option>		
    						<%
    							}
    						%>
  						</select>
  					</div>
  					<div class = "form-group">
						<input type = "text" class = "form-control" placeholder = "카드번호" name = "cardnum" maxlength = "20"> 
					</div>
					<input type = "submit" class = "btn btn-primary form-control" value = "좌석 선택">
				</form>
			</div>
		</div>
		<div class = "col-Lg-4"></div>
	</div>
</body>
<script>
	document.getElementById("result").innerText = document.getElementById("movieperson").value;
</script>

</html>
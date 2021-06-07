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
		//로그인한사람이라면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
            			<a class="nav-link" href="http://localhost:8077/Movie">Home
              				<span class="sr-only"></span>
            			</a>
          			</li>
          			<li class="nav-item">
            			<a class="nav-link" href="http://localhost:8077/Movie/movielist.jsp">상영 시간표</a>
          			</li>
          			<li class="nav-item">
            			<a class="nav-link" href="http://localhost:8077/Movie/searchcgv.jsp">영화관 찾기</a>
          			</li>
          			<li class="nav-item">
            			<a class="nav-link" href="http://localhost:8077/Movie/rank.jsp">영화 순위</a>
          			</li>
        		</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a href="login.jsp">로그인</a></li>
							<li class="nav-item"><a href="searchinfo.jsp">아이디/비밀번호 찾기</a></li>
							<li class="nav-item"><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
  	</nav>
  	
  	<div class = "container" style = "padding-top : 3%;">
		<div class = "col-Lg-4"></div>
		<div class = "col-Lg-4">
			<div class = "jumbotron" style = "padding-top : 20px;">
				<form method = "post" action = "loginAction.jsp">
					<h3 style = "text-align: center;">로그인화면</h3>
					<div class = "form-group">
						<input type = "text" class = "form-control" placeholder = "아이디" name = "userID" maxlength = "20"> 
					</div>
					<div class = "form-group">
						<input type = "password" class = "form-control" placeholder = "비밀번호" name = "userPassword" maxlength = "20"> 
					</div>
					<input type = "submit" class = "btn btn-primary form-control" value = "로그인">
				</form>
			</div>
		</div>
		<div class = "col-Lg-4"></div>
	</div>
</body>
</html>
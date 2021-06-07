<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="Movie.MovieSchedule"%>
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
<style type="text/css">
body{
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
</style>
<body>
	<%
		//로그인한사람이라면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
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
        		<%
				//로그인안된경우
						if (userID == null) {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href = "searchinfo.jsp">아이디/비밀번호 찾기</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
				<%
					} else {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
					</li>
				</ul>
				<%
					}
				%>
			</div>
		</div>
  	</nav>
  	
  	<%
  		String[] title = {"서울", "경기", "인천", "강원", "대전/충청", "대전/충청", "대구", "부산/울산", "부산/울산", "경상", "광주/전라/제주", "광주/전라/제주", "광주/전라/제주"};
		String[] titles = {"서울", "경기", "인천", "강원", "대전/충청", "대구", "부산/울산", "경상", "광주/전라/제주"};
  	%>
  	
<div class="container">

	<ul class="tabs">
		<%
			for(int i = 0; i < titles.length; i++) {
		%>
				<li class="tab-link <%if(i == 0) {%>current<%}%>" data-tab="tab-<%=i+1%>"><%= titles[i] %></li>
		<%
			}
		%>
	</ul>

	<%
		MovieSchedule movieschedule = new MovieSchedule();
		String strs[] = movieschedule.getmovieschedule();
		String strss[] = movieschedule.getmovieschedulenumber();
		String strsss[] = movieschedule.getmovieschedulearea();
	%>
	<%
		for(int i = 0; i < strs.length; i++){
	%>
		<div id="tab-<%=i+1 %>" class="tab-content <%if(i == 0) {%>current<%}%>">
	<%
			String[] name = strs[i].split(" / ");
			String[] number = strss[i].split(" / ");
			String[] area = strsss[i].split(" / ");
			for(int j = 0; j < name.length; j++){
		
	%>
			<a href="MovieList.jsp?theaternumber=<%= number[j] %>&theatername=<%=name[j]%>&area=<%=area[j]%>"><%= name[j] %></a>
	<%
			}
	%>
		</div>
	<%
		}
	%>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})
</script>
</body>
</html>
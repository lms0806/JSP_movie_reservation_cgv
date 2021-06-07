<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reservation.ReservationDAO"%>
<%@ page import="reservation.Reservation" %>
<%@ page import="java.util.ArrayList"%>
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

	<script type="text/javascript" src="jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="jquery-barcode.js"></script>

</head>
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
			<a class="navbar-brand" href="http://localhost:8077/Movie">CGV 영화 예매 도우미 프로그램</a>
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
            			<a class="nav-link" href="http://localhost:8077/Movie/MovieSchedule.jsp">상영 시간표</a>
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
							<li class="nav-item"><a href="login.jsp">로그인</a></li>
							<li class="nav-item"><a href="searchinfo.jsp">아이디/비밀번호 찾기</a></li>
							<li class="nav-item"><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
				<%
					} else {
				%>
				<ul class="nav-item navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a href="Myinfo.jsp">내정보</a></li>
							<li class="nav-item"><a href="logoutAction.jsp">로그아웃</a></li>
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
  		ReservationDAO reservationDAO = new ReservationDAO();
  		ArrayList<Reservation> arr = reservationDAO.getList(userID);
  	%>
  	
  	<%
  		for(int i = 0; i < arr.size(); i++){
  			System.out.println(arr.get(i).getId());
  			System.out.println(arr.get(i).getMovietheater());
  			System.out.println(arr.get(i).getMoviename());
  			System.out.println(arr.get(i).getMovietime());
  			System.out.println(arr.get(i).getMovieseat());
  			System.out.println(arr.get(i).getMovieprice());
  			System.out.println(arr.get(i).getMovieperson());
  			System.out.println(arr.get(i).getCardnum());
  		}
  	%>
  	<table style="table-layout:fixed; word-break : break-all;" border="1" bordercolor="black" width ="900" height="<%=arr.size()*100 %>" align = "center" >
		<tr bgcolor="gray" align ="center">
			<p><td colspan = "9" span style="color:white">영화 예매 내역</td></p>
    	</tr>
    	<tr>
    		<td>아이디</td>
    		<td>극장명</td>
    		<td>영화 이름</td>
    		<td>영화 시간</td>
    		<td>영화 좌석</td>
    		<td>가격</td>
    		<td>예매인원</td>
    		<td>카드번호</td>
    		<td>삭제</td>
    	</tr>
    	<%
    		for(int i = 0; i < arr.size(); i++){
    	%>
    		<tr>
    			<td align=center><%=arr.get(i).getId()%></td>
    			<td align=center><%=arr.get(i).getMovietheater()%></td>
    			<td align=center><%=arr.get(i).getMoviename()%></td>
    			<td align=center><%=arr.get(i).getMovietime().split(" ")[0]%> <br> <%=arr.get(i).getMovietime().split(" ")[1]%></td>
    			<td align=center><%=arr.get(i).getMovieseat()%></td>
    			<td align=center><%=arr.get(i).getMovieprice()%></td>
    			<td align=center><%=arr.get(i).getMovieperson()%></td>
    			<td align=center><%=arr.get(i).getCardnum()%></td>
    			<td align=center><a href="deleteAction.jsp?id=<%=arr.get(i).getId()%>&theatername<%=arr.get(i).getMovietheater()%>&moviename=<%=arr.get(i).getMoviename()%>&movieseat=<%=arr.get(i).getMovieseat()%>" class="btn btn-primary">삭제</a></td>
    		</tr>
    	<%
    		}
    	%>
	</table>
	
</body>
</html>
package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReservationDAO {
	private Connection conn;
	private PreparedStatement pstmt;//보안을 위해 사용
	private ResultSet rs;
	
	public ReservationDAO() {
		try {
			String dbURL = "";
			String dbID = "";
			String dbPassword = "";
			Class.forName("");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from user where userID = ?";//한번 꼬아서 사용하기 위해 "?" 사용
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}
				else {
					return 0;//비밀번호 불일치
				}
			}
			return -1; //아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2;//데이터베이스 오류
	}
	
	public int join(Reservation reservation) {
		String SQL = "insert into reservation values(?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, reservation.getId());
			pstmt.setString(2, reservation.getMovietheater());
			pstmt.setString(3, reservation.getMoviename());
			pstmt.setString(4, reservation.getMovietime());
			pstmt.setString(5, reservation.getMovieseat());
			pstmt.setInt(6, reservation.getMovieprice());
			pstmt.setInt(7, reservation.getMovieperson());
			pstmt.setInt(8, reservation.getCardnum());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public String all(Reservation reservation) {
		String SQL = "select * from reservation where id = ?";//한번 꼬아서 사용하기 위해 "?" 사용
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, reservation.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(!rs.getString(1).equals(null)) {
					return rs.getString(1); //로그인 성공
				}
			}
			return null; //아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;//데이터베이스 오류
	}
	
	public ArrayList<Reservation> getList(String userID){
		String SQL = "select * from reservation where id = ?";
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);//게시글 갯수
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Reservation reservation = new Reservation();
				reservation.setId(rs.getString(1));
				reservation.setMovietheater(rs.getString(2));
				reservation.setMoviename(rs.getString(3));
				reservation.setMovietime(rs.getString(4));
				reservation.setMovieseat(rs.getString(5));
				reservation.setMovieprice(rs.getInt(6));
				reservation.setMovieperson(rs.getInt(7));
				reservation.setCardnum(rs.getInt(8));
				list.add(reservation);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete(int id, String theater) {
		String SQL = "delete from reservation where id = ?  and movietheater = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			pstmt.setString(2, theater);
			return pstmt.executeUpdate(); //첫번째 게시물인 경우
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
}

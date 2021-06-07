package reservation;

public class Reservation {
	private String id;
	private String movietheater;
	private String moviename;
	private String movietime;
	private String movieseat;
	private int movieprice;
	private int movieperson;
	private int cardnum;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMovietheater() {
		return movietheater;
	}
	public void setMovietheater(String movietheater) {
		this.movietheater = movietheater;
	}
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public String getMovietime() {
		return movietime;
	}
	public void setMovietime(String movietime) {
		this.movietime = movietime;
	}
	public String getMovieseat() {
		return movieseat;
	}
	public void setMovieseat(String movieseat) {
		this.movieseat = movieseat;
	}
	public int getMovieprice() {
		return movieprice;
	}
	public void setMovieprice(int movieprice) {
		this.movieprice = movieprice;
	}
	public int getMovieperson() {
		return movieperson;
	}
	public void setMovieperson(int movieperson) {
		this.movieperson = movieperson;
	}
	public int getCardnum() {
		return cardnum;
	}
	public void setCardnum(int cardnum) {
		this.cardnum = cardnum;
	}
}

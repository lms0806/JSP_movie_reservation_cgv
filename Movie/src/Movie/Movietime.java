package Movie;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Movietime {
	String address = "http://www.cgv.co.kr/common/showtimes/iframeTheater.aspx";
	String str = new String();
	String strs = new String();
	String[][] strss;
	
	String[][] movieinfo;
	String[] movieinfomationstring;
	String[][] moviekind;
	String[] counttimeseat;
	String[][] wherehow;
	public Movietime(String s, String s1, String s2, int times) {
		address+="?areacode="+s;
		address+="&theaterCOde="+s1;
		address+="&date="+times;
		address+="&screencodes=&screenratingcode=&regioncode=";//파싱할 주소
		str = s2;//영화관 이름
		try {
			Document doc = Jsoup.connect(address).get();
			int idx = 0;
			
			Elements checkage = doc.select("div").select(".info-movie").select(".ico-grade");
			int number = checkage.size();
			movieinfo = new String[number][3];
			
			for(Element element : checkage) {
				movieinfo[idx][0] = element.text().toString();
				idx++;
			}//이용가 제한
			
			Elements moviename = doc.select("li").select("div").select(".info-movie").select("a");
			idx = 0;
			for(Element element : moviename) {
				movieinfo[idx][1] = element.text().toString();
				idx++;
			}//영화제목
			
			Elements show = doc.select("div").select(".info-movie").select(".round ");
			idx = 0;
			for(Element element : show) {
				if(!element.text().toString().substring(0,1).equals("D")) {
					movieinfo[idx][2] = element.text().toString();
					idx++;
				}
			}//상영중인지 아닌지
			
			Elements movieinfomationsite = doc.select("li").select("div").select(".info-movie").select("a");
			idx = 0;
			movieinfomationstring = new String[number];
			for(Element element : movieinfomationsite) {
				movieinfomationstring[idx] = element.getElementsByAttribute("href").attr("href");
				idx++;
			}//영화에 대한 정보가 있는 사이트
			
			
			Elements movieinfomation = doc.select("div").select(".info-movie").select("i");//
			int number1 = movieinfomation.size()/3;
			moviekind = new String[number1][3];
			idx = 0;
			int count1 = 0;
			for(Element element : movieinfomation) {
				moviekind[idx][count1] = element.text().toString();
				count1++;
				if(count1 == 3) {
					count1 = 0;
					idx++;
				}
			}//상영관 좌석
			
			/*Elements moviename = doc.select("li").select("div").select(".info-movie").select("a");
			idx = 0;
			for(Element element : moviename) {
				movieinfo[idx][1] = element.text().toString();
				System.out.println(movieinfo[idx][1]);
				idx++;
			}//영화제목*/
			
			Elements counttime = doc.select("div").select(".info-timetable").select("li");
			int number2 = counttime.size();
			counttimeseat = new String[number2+1];
			idx = 0;
			for(Element element : counttime) {
				counttimeseat[idx+1] = element.text().toString();
				idx++;
			}//영화 시간,남은 좌석
			
			Elements moviewhere = doc.select("div").select(".info-hall").select("ul").select("li");//
			int number3 = moviewhere.size()/3;
			wherehow = new String[number3][3];
			idx = 0;
			count1 = 0;
			for(Element element : moviewhere) {
				wherehow[idx][count1] = element.text().toString();
				count1++;
				if(count1 == 3) {
					count1 = 0;
					idx++;
				}
			}//2d,3관,총 몇석
			
			
			/*for(int i = 0; i < movieinfomationstring.length; i++) {
				System.out.println(movieinfomationstring[i]);
			}
			
			for(int i = 0; i < moviekind.length; i++) {
				for(int j = 0; j < moviekind[i].length; j++) {
					System.out.print(moviekind[i][j] + " ");
				}
				System.out.println();
			}
			
			for(int i = 0; i < counttimeseat.length; i++) {
				System.out.println(counttimeseat[i]);
			}
			
			for(int i = 0; i < wherehow.length; i++) {
				for(int j = 0; j < wherehow[i].length; j++) {
					System.out.print(wherehow[i][j] + " ");
				}
				System.out.println();
			}*/
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String[][] getMovieinfo() {
		return movieinfo;
	}
	public String[] getMovieinfomationstring() {
		return movieinfomationstring;
	}
	public String[][] getMoviekind() {
		return moviekind;
	}
	public String[] getCounttimeseat() {
		return counttimeseat;
	}
	public String[][] getWherehow() {
		return wherehow;
	}
	
	public void setMovieinfo(String[][] movieinfo) {
		this.movieinfo = movieinfo;
	}
	public void setMovieinfomationstring(String[] movieinfomationstring) {
		this.movieinfomationstring = movieinfomationstring;
	}
	public void setMoviekind(String[][] moviekind) {
		this.moviekind = moviekind;
	}
	public void setCounttimeseat(String[] counttimeseat) {
		this.counttimeseat = counttimeseat;
	}
	public void setWherehow(String[][] wherehow) {
		this.wherehow = wherehow;
	}
}
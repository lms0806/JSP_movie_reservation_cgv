package Movie;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class MovieSchedule{
	private final static String address = "http://www.cgv.co.kr/reserve/show-times/";//파싱하고자 하는 사이트
	String str = new String();
	String[] title = {"서울", "경기", "인천", "강원", "대전/충청", "대전/충청", "대구", "부산/울산", "부산/울산", "경상", "광주/전라/제주", "광주/전라/제주", "광주/전라/제주"};
	String[] titles = {"서울", "경기", "인천", "강원", "대전/충청", "대구", "부산/울산", "경상", "광주/전라/제주"};
	int[] titlenum = {1, 2, 202, 12, 3, 205, 11, 5, 207, 204, 4, 6, 206};
	
	String[] s;
	String[] s1;
	String[] area = new String[9];
	String[] name = new String[9];
	String[] code = new String[9];
	
	public MovieSchedule()  {
		try {
			Document doc = Jsoup.connect(address).get();
			Elements contents = doc.select("div").select("#contents").select("script");
			
			str = contents.toString();
			String[] regioncode = str.split("RegionCode\":");
			String[] theatercode = str.split("TheaterCode\":");//해당하는 var 부분 가져옴
			String[] theatername = str.split("TheaterName\":");
			
			s = new String[regioncode.length-2];//극장 위치(ex)서울, 경기)
			s1 = new String[theatercode.length-1];//극장 코드 번호
			String[] s2 = new String[theatername.length-1];//극장 위치
			
			for(int i = 0; i < s.length; i++) {
				s[i] = regioncode[i+1].substring(regioncode[i+1].indexOf("\"")+1, regioncode[i+1].indexOf("\","));//대분류(ex) 서울 : 01);
				
				for(int j = 0; j < titlenum.length; j++) {
					if(s[i].substring(0,1).equals("0")) {
						s[i] = s[i].substring(1);
					}
					if (s[i].indexOf(",") >= 0){
						s[i] = s[i].substring(0,1);
					}
					if(s[i].equals(Integer.toString(titlenum[j]))){
						s[i] = title[j];
					}
				}
			}//지역명 가져옴
			
			for(int i = 1; i < titles.length; i++) {
				for(int j = 0; j < s.length; j++) {
					if(s[j].equals(titles[i])) {
						s[j] = " ";
						break;
					}
				}
			}
			s[0] = " ";
			int j = 0;
			for(int i = 0; i < s.length; i++) {
				if(!s[i].equals(" ")) {
					s[j] = s[i];
					j++;
				}
			}//지역명 1개씩 삭제(더 가져옴)
			
			for(int i = 0; i < s1.length; i++) {
				s1[i] = theatercode[i+1].substring(1,5);//영화관 코드
			}//영화관 코드 가져오기
			for(int i = 0; i < s2.length; i++) {
				s2[i] = theatername[i+1].substring(theatername[i+1].indexOf("\"")+1, theatername[i+1].indexOf("\","));//영화관 명
			}//영화관 명 가져오기
			
			for(int i = 0; i < name.length; i++) {
				name[i] = "";
				code[i] = "";
				area[i] = "";
			}
			for(int i = 0; i < s2.length; i++) {
				if(s[i].equals("서울")) {
					area[0] += s[i] + " / ";
					name[0] += s2[i] + " / ";
					code[0] += s1[i] + " / ";
				}
				else if(s[i].equals("경기")) {
					area[1] += s[i] + " / ";
					name[1] += s2[i] + " / ";
					code[1] += s1[i] + " / ";
				}
				else if(s[i].equals("인천")) {
					area[2] += s[i] + " / ";
					name[2] += s2[i] + " / ";
					code[2] += s1[i] + " / ";
				}
				else if(s[i].equals("강원")) {
					area[3] += s[i] + " / ";
					name[3] += s2[i] + " / ";
					code[3] += s1[i] + " / ";
				}
				else if(s[i].equals("대전/충청")) {
					area[4] += s[i] + " / ";
					name[4] += s2[i] + " / ";
					code[4] += s1[i] + " / ";
				}
				else if(s[i].equals("대구")) {
					area[5] += s[i] + " / ";
					name[5] += s2[i] + " / ";
					code[5] += s1[i] + " / ";
				}
				else if(s[i].equals("부산/울산")) {
					area[6] += s[i] + " / ";
					name[6] += s2[i] + " / ";
					code[6] += s1[i] + " / ";
				}
				else if(s[i].equals("경상")) {
					area[7] += s[i] + " / ";
					name[7] += s2[i] + " / ";
					code[7] += s1[i] + " / ";
				}
				else if(s[i].equals("광주/전라/제주")) {
					area[8] += s[i] + " / ";
					name[8] += s2[i] + " / ";
					code[8] += s1[i] + " / ";
				}
			}//지역별 영화관
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public String[] getmovieschedule() {
		return name;
	}
	public void setmovieschedule(String[] strs) {
		this.name = strs;
	}
	public String[] getmovieschedulenumber() {
		return code;
	}
	public void setmovieschedulenumber(String[] code) {
		this.code = code;
	}
	public String[] getmovieschedulearea() {
		return area;
	}
	public void setmovieschedulearea(String[] area) {
		this.area = area;
	}
}
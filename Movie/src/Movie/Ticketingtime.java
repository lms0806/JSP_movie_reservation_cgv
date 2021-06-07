package Movie;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ticketingtime {
	String[] seat;
	public Ticketingtime(String theater, String age, String name, String show, String address) {
		try {
			Document doc = Jsoup.connect(address).get();
			int idx = 0;
			int size = 0;
			int num = 0;
			int bt = 0;
			
			Elements test = doc.select("div.col-times");
			String[] tests = new String[test.size()];
			String[] testname = new String[tests.length];
			String[] testsplit;
			
			for(Element element : test) {
				tests[idx] = element.text().toString();
				testname[idx] = tests[idx].substring(tests[idx].indexOf("상 ")+2, tests[idx].indexOf("중")-3);
				tests[idx] = tests[idx].split("봉 ")[1];
				idx++;
			}
			
			
			for(int i = 0; i < testname.length; i++) {
				if(testname[i].equals(name)) {
					num = i;
					break;
				}
			}
			
			testsplit = tests[num].split(" ");
			for(int i = 0; i < testsplit.length; i++) {
				if(testsplit[i].contains("잔여좌석") && !testsplit[i].contains("마감")) {
					size++;
				}
			}
			
			seat = new String[size];
			for(int i = 0; i < testsplit.length; i++) {
				if(testsplit[i].contains("잔여좌석") && !testsplit[i].contains("마감")) {
					seat[bt] = testsplit[i];
					bt++;
				}
			}
			
			for(int i = 0; i < seat.length; i++) {
				System.out.println(seat[i]);
			}
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public String[] getSeat() {
		return seat;
	}
	public void setSeat(String[] seat) {
		this.seat = seat;
	}
}

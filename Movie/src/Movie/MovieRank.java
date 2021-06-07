/* 선택창에서 받은 정보를 활용해 주간,일간 박스오피스 순위 보여줌 */
package Movie;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class MovieRank {
	static int sel;
	String[][] strss = new String[10][4];
	   
	public MovieRank(int num, String address) {
		try {
			   Document doc = Jsoup.connect(address).timeout(12000).get();
			   Elements maincontents;
			   
			   if(num == 0) {
				   maincontents = doc.select("weeklyBoxOffice");
			   }
			   else {
				   maincontents = doc.select("dailyBoxOffice");
			   }
			   Elements contents = maincontents.select("movieNm");
			   
			   int idx = 0;
			   for(Element element : contents) {
				   if(idx < 10) {
					   strss[idx][1] = element.text().toString();
					   strss[idx][0] = Integer.toString(idx+1);
				   }
				   else {
					   break;
				   }
				   idx++;
			   }
			   
			   Elements content = maincontents.select("openDt");
			   idx = 0;
			   for(Element element : content) {
				   if(idx < 10) {
					   strss[idx][2] = element.text().toString();
				   }
				   else {
					   break;
				   }
				   idx++;
			   }
			   
			   Elements cont = maincontents.select("audiAcc");
			   idx = 0;
			   for(Element element : cont) {
				   if(idx < 10) {
					   strss[idx][3] = element.text().toString();
				   }
				   else {
					   break;
				   }
				   idx++;
			   }
			   
			   setstrss(strss);
			   
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public String[][] getstrss(){
		return strss;
	}
	public void setstrss(String[][] strss){
		this.strss = strss;
	}
}
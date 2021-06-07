package Movie;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Movieinfomation{
	String percent;
	String[] spec;
	String story;
	String[] evaluation;
	String imgs;
	public Movieinfomation(String moviename,String movieinfomationstring) {
		String address = "http://www.cgv.co.kr" + movieinfomationstring;
		
		try {
			Document doc = Jsoup.connect(address).get();
			
			Elements percentelment = doc.select("strong").select(".percent");
			percent = percentelment.text().toString();
			//System.out.println(percent);//예매율
			
			Element specelement = doc.select("div").select(".spec").first();
			String str = "";
			int idx = 0;
			str += specelement.text().toString();
			
			spec = str.split(" / ");
			
			//System.out.println(spec);
			
			Elements stroyelement = doc.select("div").select(".sect-story-movie");
			story = stroyelement.text().toString();
			//System.out.println(story);
			
			Elements evaluationelement = doc.select("span").select(".tooltip");
			evaluation = new String[2];
			idx = 0;
			for(Element element : evaluationelement){
				if(idx < 2) {
					evaluation[idx] = element.text().toString();
				}
				idx++;
			}//사전기대자수, 실관람평지수
			
			Elements evaluationnumelement = doc.select("span").select(".percent");
			idx = 0;
			for(Element element : evaluationnumelement){
				if(idx > 0) {
					evaluation[idx-1] += " " + element.text().toString();
				}
				idx++;
			}//사전기대자수%, 실관람평지수%
			
			Element img = doc.select("span").select(".thumb-image").first();
			//.getElementsByTag("img")
			imgs = img.getElementsByAttribute("src").attr("src");
			
			/*System.out.println(percent);//예매율
			
			for(int i = 0; i < spec.length; i++) {
				System.out.println(spec[i]);//설명
			}
			
			System.out.println(story);//줄거리
			
			for(int i = 0; i < evaluation.length; i++) {
				System.out.println(evaluation[i]);//사전기대자수, 실관람평지수
			}
			
			System.out.println(imgs);//이미지 링크*/
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public String getPercent() {
		return percent;
	}
	public void setPercent(String percent) {
		this.percent = percent;
	}
	public String[] getSpec() {
		return spec;
	}
	public void setSpec(String[] spec) {
		this.spec = spec;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String[] getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String[] evaluation) {
		this.evaluation = evaluation;
	}
	public String getImgs() {
		return imgs;
	}
	public void setImgs(String imgs) {
		this.imgs = imgs;
	}
}
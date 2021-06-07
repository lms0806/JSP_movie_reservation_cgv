package Movie;

import java.awt.Image;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;

public class Movieimage {
	Image image = null;
	public Movieimage(String moviename, String imgs) {
		
		try {
			URL url = new URL(imgs);
			image = ImageIO.read(url);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
}

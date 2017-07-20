package com.tour.rank;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;
@Component
public class YoutubeManager {
	public String youtubeGetLink(String title){
		String url="";
		try {
			Document doc = Jsoup.connect("https://www.youtube.com/results?search_query="+title).get();
			Elements te=doc.select("h3.yt-lockup-title a");
			Element tElem=te.get(0);
			String temp=tElem.attr("href");
			String ti=tElem.attr("title");
			temp=temp.substring(temp.lastIndexOf("=")+1, temp.length());
			url="https://www.youtube.com/embed/"+temp;
		} catch (Exception e) {
		}
		return url;
	}
}

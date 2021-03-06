package com.tour.R;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Component;
@Component
public class RManager {
	public void barchart(){
		try {
			RConnection rc = new RConnection();
			//rc.voidEval("library(rJava)");
			//rc.voidEval("library(googleVis)");
			rc.voidEval("data<-read.table(\"/home/sist/tour_data/tour_result\")");
			rc.voidEval("png(\"/home/sist/springDev/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TourProject/resources/barchart.png\")");
			rc.voidEval("barplot(data$V2,names.arg=data$V1,col=rainbow(6),main='방문객 체감 날씨')");
			//rc.voidEval("Pie<-gvisPieChart(data)");
			//rc.voidEval("plot(Pie)");
			rc.voidEval("dev.off()");
			rc.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void wordCloud(){
		try{
			RConnection rc = new RConnection();
			rc.voidEval("library(rJava)");
			rc.voidEval("library(KoNLP)");
			rc.voidEval("library(wordcloud)");
			rc.voidEval("data<-readLines(\"/home/sist/tour_data/naver.txt\")");//한줄씩 읽어오기
			rc.voidEval("png(\"/home/sist/springDev/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TourProject/resources/wordcloud.png\")");
			rc.voidEval("data2<-sapply(data,extractNoun,USE.NAMES = F)");//명사형 자르기
			rc.voidEval("data3<-unlist(data2)");//데이터 섞기
			rc.voidEval("data4<-Filter(function(x){nchar(x)>=2},data3)");//2글자 이상 인것만 보여주기
			rc.voidEval("data5<-table(data4)");//같은 갯수 나오게
			rc.voidEval("wordcloud(names(data5),freq=data5, scale=c(5,1), rot.per=0.25, min.freq=3, random.order = F, random.color = T, colors = rainbow(15))");
			rc.voidEval("dev.off()");
			rc.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
}

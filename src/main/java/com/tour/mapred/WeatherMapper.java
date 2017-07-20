package com.tour.mapred;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import java.io.*;

public class WeatherMapper extends Mapper<LongWritable, Text, Text, IntWritable>{
	private final IntWritable one=new IntWritable(1);
	private Text res = new Text();
	@Override
	protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, Text, IntWritable>.Context context)
			throws IOException, InterruptedException {
		FileReader fr = new FileReader("/home/sist/tour_data/weather_data");
		int i=0;
		String data="";
		String[] mydata={
			"따뜻한날씨",
			"더운날씨",
			"선선한날씨",
			"추운날씨"
		};
		while((i=fr.read())!=-1){
			data+=String.valueOf((char)i);
		}
		String[] feel = data.split("\n");
		Pattern[] p=new Pattern[feel.length];
		for(int j=0;j<p.length;j++){
			p[j]=Pattern.compile(feel[j]);
		}
		Matcher[] m= new Matcher[feel.length];
		for(int j=0;j<m.length;j++){
			m[j]=p[j].matcher(value.toString());
			while(m[j].find()){
				if(j>=0 &&j<=9)res.set(mydata[0]);
				else if(j>=10 && j<=22)res.set(mydata[1]);
				else if(j>=23 && j<=30)res.set(mydata[2]);
				else if(j>=31 && j<=80)res.set(mydata[3]);
				context.write(res, one);
			}
		}
	}
	
	

}

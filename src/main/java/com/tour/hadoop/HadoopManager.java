package com.tour.hadoop;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.mapreduce.JobRunner;
import org.springframework.stereotype.Component;

@Component
public class HadoopManager {
	@Autowired
	private Configuration conf;
	@Autowired
	private JobRunner jr;
	
	public void hadoopFileDelete(){
		try{
		FileSystem fs = FileSystem.get(conf);
		if(fs.exists(new Path("/tour_input/daum.txt"))){
			fs.delete(new Path("/tour_input/daum.txt"),true);
		}
		if(fs.exists(new Path("/tour_input/naver.txt"))){
			fs.delete(new Path("/tour_input/naver.txt"),true);
		}
		if(fs.exists(new Path("/tour_output"))){
			fs.delete(new Path("/tour_output"),true);
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void copyFromLocal(){
		try {
			FileSystem fs = FileSystem.get(conf);
			fs.copyFromLocalFile(new Path("/home/sist/tour_data/daum.txt"), new Path("/tour_input/daum.txt"));
			fs.copyFromLocalFile(new Path("/home/sist/tour_data/naver.txt"), new Path("/tour_input/naver.txt"));
			fs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void mapReduceExecute(){
		try {
			jr.call();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void copyToLocal(){
		try {
			FileSystem fs = FileSystem.get(conf);
			fs.copyToLocalFile(new Path("/tour_output/part-r-00000"), new Path("/home/sist/tour_data/tour_result"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

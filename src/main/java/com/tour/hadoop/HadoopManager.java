package com.tour.hadoop;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.mapreduce.JobRunner;
import org.springframework.stereotype.Component;

import com.tour.rank.RankPlaceDAO;
import com.tour.rank.RankPlaceVO;


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
	
	public void hadoopFileRead(){ //하둡에 있는 파일 몽고에 넣기
		try {
			Configuration conf = new Configuration();
			conf.set("fs.default.name","hdfs://localhost:9000");
			FileSystem fs = FileSystem.get(conf);
			FileStatus[] status = fs.listStatus(new Path("/tour_output"));
			for(FileStatus sss:status){
				String temp = sss.getPath().getName();
				if(!temp.startsWith("rank"))
					continue;
				FileStatus[] status2 = fs.listStatus(new Path("/tour_output/"+sss.getPath().getName()));
				for(FileStatus ss:status2){
					String name = ss.getPath().getName();
					if(!name.equals("_SUCCESS")){
						FSDataInputStream is = fs.open(new Path("/tour_output/"+sss.getPath().getName()+"/"+name));
						BufferedReader br = new BufferedReader(new InputStreamReader(is));
						while(true){
							String line = br.readLine();
							if(line==null)break;
							StringTokenizer st = new StringTokenizer(line);
							RankPlaceVO vo = new RankPlaceVO();
							vo.setTitle(st.nextToken().trim().replace("$", " "));
							vo.setCount(Integer.parseInt(st.nextToken().trim()));
							RankPlaceDAO dao = new RankPlaceDAO();
							dao.countInsert(vo);
						}
						br.close();
					}
				}
				//fs.delete(new Path("/tour_output/"+sss.getPath().getName()),true); //이걸키고 sparkMain을 돌려두면 실시간 읽어온걸 반영
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

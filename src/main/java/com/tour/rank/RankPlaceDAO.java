package com.tour.rank;

import java.net.InetSocketAddress;
import java.util.ArrayList;
import java.util.List;

import com.mongodb.*;
import com.tour.hadoop.HadoopManager;


//import au.com.bytecode.opencsv.CSVReader;

public class RankPlaceDAO {
	private MongoClient mc;
	private DB db;
	private DBCollection dbc;
	private String type;
	public RankPlaceDAO(String type){
		try {
			this.type=type;
			mc = new MongoClient(new ServerAddress(new InetSocketAddress("211.238.142.111",27017)));
			db=mc.getDB("mydb");
			dbc=db.getCollection(type);
			dbc.drop();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public RankPlaceDAO(){//하둡 매니저용		
		try {
			this.type=type;
			mc = new MongoClient(new ServerAddress(new InetSocketAddress("211.238.142.111",27017)));
			db=mc.getDB("mydb");
			dbc=db.getCollection("tripadvisor");
			dbc.drop();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void placeInsert(RankPlaceVO vo){ //디비에 넣기
		int no = 0;
		DBCursor cursor = dbc.find();
		while(cursor.hasNext()){
			BasicDBObject obj = (BasicDBObject)cursor.next();
			int i = obj.getInt("no");
			if(no<i)no=i;
		}
		cursor.close();
		int i =0;
		i=(int)(Math.random()*15+1);
		BasicDBObject obj = new BasicDBObject();
		obj.put("no", no+1);
		obj.put("rank", vo.getRank());
		obj.put("title", vo.getTitle());
		obj.put("img", vo.getImg());
		obj.put("count", i);
		dbc.insert(obj);
		HadoopManager hm = new HadoopManager();
		hm.hadoopFileRead(); //스파크로 모은 카운트정보도 몽고에 넣기
	}
	
	public void countInsert(RankPlaceVO vo){//검색 횟수 넣는 메서드
		try{
			BasicDBObject where = new BasicDBObject();
			where.put("title", vo.getTitle().replace("|",","));
			
			//update
			BasicDBObject obj = (BasicDBObject)dbc.findOne(where);
			BasicDBObject up = new BasicDBObject();
			up.put("count", obj.getInt("count")+vo.getCount());
			dbc.update(where, new BasicDBObject("$set",up));
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public List<RankPlaceVO> getTripData(){
		List<RankPlaceVO> list = new ArrayList<RankPlaceVO>();
		DBCursor cursor = dbc.find();
//		String csv=""; //csv파일 만들기, join을 위해서
		while(cursor.hasNext()){
			BasicDBObject obj = (BasicDBObject)cursor.next();
			RankPlaceVO vo = new RankPlaceVO();
			vo.setRank(obj.getInt("rank"));
			vo.setTitle(obj.getString("title"));
			vo.setImg(obj.getString("img"));
			vo.setCount(obj.getInt("count"));
			System.out.println("검색결과"+vo.getRank()+vo.getTitle()+vo.getCount());
			list.add(vo);
//			csv+=vo.getRank()+","+vo.getTitle()+","+vo.getImg()+"\n";
		}
//		cursor.close();
//		csv=csv.substring(0,csv.lastIndexOf("\n"));
//		try {
//			FileWriter fw = new FileWriter("./trip-data/"+type+".csv");
//			fw.write(csv);
//			fw.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}	
		return list;
	}
//	public static void myCreateCSV(){ //CSV만들기
//		try {
//			FileReader fr = new FileReader("./music-data/genie-melon/part-00000");
//			String data = "";
//			int i=0;
//			while((i=fr.read())!=-1){
//				data+=String.valueOf((char)i);
//			}
//			fr.close();
//			data=data.replace("(","");
//			data=data.replace(")","");
//			FileWriter fw = new FileWriter("./music-data/genie-melon/myrank.csv");
//			fw.write(data);;
//			fw.close();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	public void myRankInsert(){//파일 디비에 넣기
//		FileReader fr;
//		try {
//			dbc.drop();
//			fr = new FileReader("./music-data/genie-melon/myrank.csv");
//			String data = "";
//			int i=0;
//			while((i=fr.read())!=-1){
//				data+=String.valueOf((char)i);
//			}
//			fr.close();
//			String[] temp = data.split("\n");
//			
//			for(String s:temp){
//				CSVReader csv = new CSVReader(new StringReader(s));
//				String[] ss = csv.readNext();
//				BasicDBObject obj = new BasicDBObject();
//				obj.put("title", ss[0]);
//				obj.put("rating", 100-(Integer.parseInt(ss[1].trim())+Integer.parseInt(ss[2].trim())));
//				dbc.insert(obj);
//			}
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//	}
}

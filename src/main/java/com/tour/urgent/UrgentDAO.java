package com.tour.urgent;
import java.util.*;
import java.net.*;
import com.mongodb.*;

public class UrgentDAO {
	public List<UrgentVO> getUrgentAllData(){

		MongoClient mc=new MongoClient(new ServerAddress(new InetSocketAddress("211.238.142.111", 27017)));
		DB db=mc.getDB("mydb");
		DBCollection dbc=db.getCollection("UrgentTour");
		
		List<UrgentVO> list=new ArrayList<UrgentVO>();
		BasicDBObject query = new BasicDBObject();
		query.put("price", new BasicDBObject("$ne", null));
		query.put("link",  new BasicDBObject("$ne", null));
		query.put("img",  new BasicDBObject("$ne", null));
		query.put("start_date",  new BasicDBObject("$ne", null));
		DBCursor cursor=dbc.find(query);
		while(cursor.hasNext()){
			UrgentVO vo=new UrgentVO();
			BasicDBObject obj=(BasicDBObject)cursor.next();
			vo.setPlace(obj.getString("place"));
			vo.setPackage_name(obj.getString("package_name"));
			vo.setPrice(obj.getString("price"));
			vo.setSite(obj.getString("site"));
			vo.setLink(obj.getString("link"));
			vo.setImg(obj.getString("img"));
			vo.setStart_date(obj.getString("start_date"));
			list.add(vo);			
		}
		
		return list;
	}
}

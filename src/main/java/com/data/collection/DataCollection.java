package com.data.collection;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;

import com.data.domain.CategoryMap;
import com.data.domain.CityVO;
import com.data.domain.CountryVO;
import com.data.domain.PlaceInfoVO;
import com.data.persistence.CityDAO;
import com.data.persistence.CountryDAO;
import com.data.persistence.PlaceInfoDAO;

@Controller
public class DataCollection {
	private static final String[] key = {
			"AIzaSyDdjPXhd69nscDK6z3bsgiI2PDnS3993_4",
			"AIzaSyC0Btw9Pu_NUSoV3uyFfJJWhgwS_fKXxxc",
			"AIzaSyDC9FSrveDrBnLwR3hjWHgdvv3mgAVxDhQ",
			"AIzaSyBRm8yWirwJ3vkOLs0Du-xhSYWyfsOQDu8",
			"AIzaSyDJXvG9Gi4BM5VQqmD4mWuyEheN8TpS2fY",
			};
	private static PlaceInfoDAO placeDao = new PlaceInfoDAO();
	private static CountryDAO countryDao = new CountryDAO();
	private static CityDAO cityDao = new CityDAO();
	private static Map<String, String> categoryMap = new CategoryMap().getCategory();
	private static int order = 0;
	
	public static void main(String[] args) {
		DataCollection dc = new DataCollection();
		
		//List<String> list = countryDao.select();
		List<String> list = cityDao.select();
		
		for(int i=0; i<list.size(); i++){
			try {
				//dc.placeSearch(list.get(i)+"관광명소", "ko");
				//dc.countrySearch(list.get(i), "ko");
				dc.citySearch(list.get(i), "ko");
			} catch (Exception e) {
				order++;
			}
		}
		
		countryDao.disConnection();
		placeDao.disConnection();
		cityDao.disConnection();
	}
	
	public void citySearch(String query, String language) throws Exception{
		//검색어에 대한 여러 장소 정보들이 출력
		
		String photoRef = null;
		String place_id = null;
		
		try {
			String url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + URLEncoder.encode(query, "UTF-8")
				+ "&key=" + key[order]
				+ "&language="+language;
			String jsonData = getJsonData(url);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonData.toString());
			JSONArray resultsArr = (JSONArray) jsonObject.get("results");

			for (int i = 0; i < resultsArr.size(); i++) { //여러 개 
				JSONObject resultObj = (JSONObject) resultsArr.get(i);

				place_id = (String) resultObj.get("place_id");

				JSONArray photosArr = (JSONArray) resultObj.get("photos");
				if(photosArr!=null){
					for (int j = 0; j < photosArr.size(); j++) {
						JSONObject photoRefObj = (JSONObject) photosArr.get(j);
						photoRef = (String) photoRefObj.get("photo_reference");
					}
				}
				
				CityVO cityInfo = new CityVO();
				
				cityInfo.setName(query);
				cityInfo.setImage(photoRef);
				
				//en or ko
				cityDetailInfo(place_id, language, cityInfo);
			}

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public void cityDetailInfo(String place_id, String language, CityVO cityInfo) throws Exception{
		//한 장소에 대한 세부 정보 출력
		
		String url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=" + place_id 
				+ "&key=" + key[order]
				+ "&language="+language;
		
		String name = null;
		String lat = null;
		String lng = null;
		
		try {
			String jsonData = getJsonData(url);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonData.toString());
			JSONObject resultObj = (JSONObject) jsonObject.get("result");
			
			name = (String) resultObj.get("name");
			
			JSONObject geometryObj = (JSONObject) resultObj.get("geometry");
			JSONObject locationObj = (JSONObject) geometryObj.get("location");
			lat = Double.toString((Double)locationObj.get("lat"));
			lng = Double.toString((Double) locationObj.get("lng"));
			
			cityInfo.setLatitude(lat);
			cityInfo.setLongitude(lng);
			
			cityDao.update(cityInfo);
			System.out.println(cityInfo.getName());
			System.out.println(cityInfo.getLatitude());
			System.out.println(cityInfo.getLongitude());
			System.out.println(cityInfo.getImage());
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void countrySearch(String query, String language) throws Exception{
		//검색어에 대한 여러 장소 정보들이 출력
		
		String photoRef = null;
		String place_id = null;
		
		try {
			String url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + URLEncoder.encode(query, "UTF-8")
				+ "&key=" + key[order]
				+ "&language="+language;
			String jsonData = getJsonData(url);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonData.toString());
			JSONArray resultsArr = (JSONArray) jsonObject.get("results");

			for (int i = 0; i < resultsArr.size(); i++) { //여러 개 
				JSONObject resultObj = (JSONObject) resultsArr.get(i);

				place_id = (String) resultObj.get("place_id");

				JSONArray photosArr = (JSONArray) resultObj.get("photos");
				if(photosArr!=null){
					for (int j = 0; j < photosArr.size(); j++) {
						JSONObject photoRefObj = (JSONObject) photosArr.get(j);
						photoRef = (String) photoRefObj.get("photo_reference");
					}
				}
				
				CountryVO countryInfo = new CountryVO();
				
				countryInfo.setName(query);
				countryInfo.setImage(photoRef);
				
				//en or ko
				countryDetailInfo(place_id, language, countryInfo);
			}

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public void countryDetailInfo(String place_id, String language, CountryVO countryInfo) throws Exception{
		//한 장소에 대한 세부 정보 출력
		
		String url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=" + place_id 
				+ "&key=" + key[order]
				+ "&language="+language;
		
		String name = null;
		String lat = null;
		String lng = null;
		
		try {
			String jsonData = getJsonData(url);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonData.toString());
			JSONObject resultObj = (JSONObject) jsonObject.get("result");
			
			name = (String) resultObj.get("name");
			
			JSONObject geometryObj = (JSONObject) resultObj.get("geometry");
			JSONObject locationObj = (JSONObject) geometryObj.get("location");
			lat = Double.toString((Double)locationObj.get("lat"));
			lng = Double.toString((Double) locationObj.get("lng"));
			
			countryInfo.setLatitude(lat);
			countryInfo.setLongitude(lng);
			
			countryDao.update(countryInfo);
			System.out.println(countryInfo.getName());
			System.out.println(countryInfo.getLatitude());
			System.out.println(countryInfo.getLongitude());
			System.out.println(countryInfo.getImage());
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void placeSearch(String query, String language) throws Exception{
		//검색어에 대한 여러 장소 정보들이 출력
		
		String photoRef = null;
		String place_id = null;
		String top = null;
		String sub = null;
		
		try {
			String url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + URLEncoder.encode(query, "UTF-8")
				+ "&key=" + key[order]
				+ "&language="+language;
			String jsonData = getJsonData(url);

			// System.out.println(jsonData.toString());

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonData.toString());
			JSONArray resultsArr = (JSONArray) jsonObject.get("results");

			for (int i = 0; i < resultsArr.size(); i++) { //여러 개 
				JSONObject resultObj = (JSONObject) resultsArr.get(i);

				place_id = (String) resultObj.get("place_id");

				JSONArray photosArr = (JSONArray) resultObj.get("photos");
				if(photosArr!=null){
					for (int j = 0; j < photosArr.size(); j++) {
						JSONObject photoRefObj = (JSONObject) photosArr.get(j);
						photoRef = (String) photoRefObj.get("photo_reference");
					}
				}
				
				JSONArray typesArr = (JSONArray) resultObj.get("types");
				if(typesArr!=null){
					top = (String) typesArr.get(0);
					sub = (String) typesArr.get(1);
				}
				
				PlaceInfoVO placeInfo = new PlaceInfoVO();
				
				placeInfo.setImage(photoRef);
				placeInfo.setTopCategory(categoryMap.get(top));
				placeInfo.setSubCategory(categoryMap.get(sub));
				
				//en or ko
				System.out.println("top================"+top);
				System.out.println("sub================"+sub);
				
				placeDetailInfo(place_id, language, placeInfo);
			}

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public void placeDetailInfo(String place_id, String language, PlaceInfoVO placeInfo) throws Exception{
		//한 장소에 대한 세부 정보 출력
		
		String url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=" + place_id 
				+ "&key=" + key[order]
				+ "&language="+language;
		
		String country = null;
		String city = null;
		String formatted_address = null;
		String formatted_phone_number = null;
		String name = null;
		String website = null;
		String lat = null;
		String lng = null;
		
		try {
			String jsonData = getJsonData(url);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonData.toString());
			JSONObject resultObj = (JSONObject) jsonObject.get("result");

			
			formatted_address = (String) resultObj.get("formatted_address");
			formatted_phone_number = (String) resultObj.get("formatted_phone_number");
			name = (String) resultObj.get("name");
			website = (String) resultObj.get("website");
			
			JSONObject geometryObj = (JSONObject) resultObj.get("geometry");
			JSONObject locationObj = (JSONObject) geometryObj.get("location");
			lat = Double.toString((Double)locationObj.get("lat"));
			lng = Double.toString((Double) locationObj.get("lng"));
			
			JSONArray addrArr = (JSONArray) resultObj.get("address_components");
			
			if(addrArr!=null){
				for (int j = 0; j < addrArr.size(); j++) {
						JSONObject addrObj = (JSONObject) addrArr.get(j);
						
						JSONArray typeArr = (JSONArray) addrObj.get("types");
						
						if(typeArr.get(0).equals("administrative_area_level_1")){
							city = (String) addrObj.get("long_name");
						}else if(typeArr.get(0).equals("country")){
							country = (String) addrObj.get("long_name");
						}
				}
			}
			
			placeInfo.setCountry(country);
			placeInfo.setCity(city);
			placeInfo.setAddress(formatted_address);
			placeInfo.setPhone(formatted_phone_number);
			placeInfo.setName(name);
			placeInfo.setLatitude(lat);
			placeInfo.setLongitude(lng);
			placeInfo.setHomepage(website);
			
			placeDao.insert(placeInfo);
			
			System.out.println(placeInfo.getCountry());
			System.out.println(placeInfo.getCity());
			System.out.println(placeInfo.getAddress());
			System.out.println(placeInfo.getPhone());
			System.out.println(placeInfo.getName());
			System.out.println(placeInfo.getLatitude());
			System.out.println(placeInfo.getLongitude());
			System.out.println(placeInfo.getHomepage());
			System.out.println(placeInfo.getImage());
			System.out.println(placeInfo.getTopCategory());
			System.out.println(placeInfo.getSubCategory());
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public String getJsonData(String url) throws Exception{
		BufferedReader bffr = null;
		StringBuffer jsonData = new StringBuffer();

		try {
			URL googleUrl = new URL(url);
			HttpURLConnection conn = (HttpURLConnection)googleUrl.openConnection();
			conn.setRequestMethod("GET");
			
			
			bffr = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String data = null;

			while (true) {
				data = bffr.readLine();
				if (data == null)
					break;
				jsonData.append(data);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bffr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return jsonData.toString();
	}

}

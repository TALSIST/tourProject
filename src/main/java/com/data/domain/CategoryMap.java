package com.data.domain;

import java.util.HashMap;
import java.util.Map;

public class CategoryMap {
	private Map<String, String> category = new HashMap<String, String>();
	
	/*
	accounting 회계
	airport 공항
	amusement_park 놀이 공원
	aquarium 수족관
	art_gallery 미술관
	atm ATM
	bakery 빵집
	bank 은행
	bar 바
	beauty_salon 미용실
	bicycle_store 자전거 대여소
	book_store 서점
	bowling_alley 볼링장
	bus_station 버스 정거장
	cafe 카페
	campground 캠프장
	car_dealer 자동차 판매
	car_rental 자동차 임대
	car_repair 자동차 수리
	car_wash 세차
	casino 카지노
	cemetery 묘지
	church 교회
	city_hall 시청
	clothing_store 옷가게
	convenience_store 편의점
	courthouse 법원
	dentist 치과의사
	department_store 백화점
	doctor 의사
	electrician 전공
	electronics_store 전자제품 가게
	embassy 대사관
	establishment (지원 중단됨) 설립
	finance (지원 중단됨) 재정
	fire_station 소방서
	florist 꽃집
	food 음식
	funeral_home 장례식장
	furniture_store 가구 상점
	gas_station 주유소
	general_contractor (지원 중단됨) 일반 계약자
	grocery_or_supermarket (지원 중단됨) 식료품 또는 슈퍼마켓 
	gym 체육관
	hair_care 미용실
	hardware_store 철물점
	health (지원 중단됨) 건강
	hindu_temple 힌두교 사원
	home_goods_store 가정 용품점
	hospital 병원
	insurance_agency 보험 대리점
	jewelry_store 보석 가게
	laundry 세탁
	lawyer 변호사 사무실
	library 도서관
	liquor_store 주류 판매점
	local_government_office 지방 정부
	locksmith 자물쇠 제조공
	lodging 하숙
	meal_delivery 식사 배달
	meal_takeaway 식사 테이크 아웃
	mosque 사원
	movie_rental 영화 대여
	movie_theater 영화관
	moving_company 이삿짐 회사
	museum 박물관
	night_club 나이트 클럽
	painter 화가
	park 공원
	parking 주차
	pet_store 애완 동물 가게
	pharmacy 조제
	physiotherapist 물리 치료
	place_of_worship (지원 중단됨) 예배 장소
	plumber 배관공
	police 경찰
	post_office 우체국
	real_estate_agency 부동산
	restaurant 레스토랑
	roofing_contractor 루핑 계약자
	rv_park RV 공원
	school 학교
	shoe_store 신발 가게
	shopping_mall 쇼핑몰
	spa 온천
	stadium 경기장
	storage 창고
	store 가게
	subway_station 지하철역
	synagogue 유태 교회당
	taxi_stand 택시 승차장
	train_station 기차역
	transit_station 대중 교통
	travel_agency 여행사
	university 대학
	veterinary_care 수의과 치료
	zoo 동물원
	*/
	public CategoryMap(){
		category.put("accounting", "회계");
		category.put("airport", "공항");
		category.put("amusement_park", "놀이 공원");
		category.put("aquarium", "수족관");
		category.put("art_gallery", "미술관");
		category.put("atm", "ATM");
		category.put("bakery", "빵집");
		category.put("bank", "은행");
		category.put("bar", "바");
		category.put("beauty_salon", "미용실");
		category.put("bicycle_store", "자전거 대여소");
		category.put("book_store", "서점");
		category.put("bowling_alley", "볼링장");
		category.put("bus_station", "버스 정거장");
		category.put("cafe", "카페");
		category.put("campground", "캠프장");
		category.put("car_dealer", "자동차 판매");
		category.put("car_rental", "자동차 임대");
		category.put("car_repair", "자동차 수리");
		category.put("car_wash", "세차");
		category.put("casino", "카지노");
		category.put("cemetery", "묘지");
		category.put("church", "교회");
		category.put("city_hall", "시청");
		category.put("clothing_store", "옷가게");
		category.put("convenience_store", "편의점");
		category.put("courthouse", "법원");
		category.put("dentist", "치과");
		category.put("department_store", "백화점");
		category.put("doctor", "개인 병원");
		category.put("electrician", "전기");
		category.put("electronics_store", "전자제품 가게");
		category.put("embassy", "대사관");
		category.put("establishment", "기관");
		category.put("finance", "재정");
		category.put("fire_station", "소방서");
		category.put("florist", "꽃집");
		category.put("food", "음식");
		category.put("funeral_home", "장례식장");
		category.put("furniture_store", "가구 상점");
		category.put("gas_station", "주유소");
		category.put("general_contractor", "일반 계약");
		category.put("grocery_or_supermarket", "식료품 또는 슈퍼마켓");
		category.put("gym", "체육관");
		category.put("hair_care", "미용실");
		category.put("hardware_store", "철물점");
		category.put("health", "건강");
		category.put("hindu_temple", "힌두교 사원");
		category.put("home_goods_store", "가정 용품점");
		category.put("hospital", "종합 병원");
		category.put("insurance_agency", "보험 대리점");
		category.put("jewelry_store", "보석 가게");
		category.put("laundry", "세탁");
		category.put("lawyer", "변호사 사무실");
		category.put("library", "도서관");
		category.put("liquor_store", "주류 판매점");
		category.put("local_government_office", "지방 정부");
		category.put("locksmith", "자물쇠 제조공");
		category.put("lodging", "하숙");
		category.put("meal_delivery", "식사 배달");
		category.put("meal_takeaway", "식사 테이크 아웃");
		category.put("mosque", "사원");
		category.put("movie_rental", "영화 대여");
		category.put("movie_theater", "영화관");
		category.put("moving_company", "이삿짐 회사");
		category.put("museum", "박물관");
		category.put("natural_feature", "자연");
		category.put("night_club", "나이트 클럽");
		category.put("painter", "화가");
		category.put("park", "공원");
		category.put("parking", "주차");
		category.put("pet_store", "애완 동물 가게");
		category.put("pharmacy", "약국");
		category.put("physiotherapist", "물리 치료");
		category.put("place_of_worship", "예배 장소");
		category.put("plumber", "배관공");
		category.put("point_of_interest", "관광지");
		category.put("police", "경찰");
		category.put("post_office", "우체국");
		category.put("real_estate_agency", "부동산");
		category.put("restaurant", "레스토랑");
		category.put("roofing_contractor", "지붕 수리");
		category.put("rv_park", "캠핑장");
		category.put("school", "학교");
		category.put("shoe_store", "신발 가게");
		category.put("shopping_mall", "쇼핑몰");
		category.put("spa", "온천");
		category.put("stadium", "경기장");
		category.put("storage", "창고");
		category.put("store", "가게");
		category.put("subway_station", "지하철역");
		category.put("synagogue", "유대 교회당");
		category.put("taxi_stand", "택시 승차장");
		category.put("train_station", "기차역");
		category.put("transit_station", "대중 교통");
		category.put("travel_agency", "여행사");
		category.put("university", "대학");
		category.put("veterinary_care", "수의과 치료");
		category.put("zoo", "동물원");
		
	}
	
	public Map<String, String> getCategory() {
		return category;
	}
	
}

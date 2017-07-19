package com.data.domain;

import java.util.HashMap;
import java.util.Map;

public class CategoryMap {
	private Map<String, String> category = new HashMap<String, String>();
	
	/*
	accounting ȸ��
	airport ����
	amusement_park ���� ����
	aquarium ������
	art_gallery �̼���
	atm ATM
	bakery ����
	bank ����
	bar ��
	beauty_salon �̿��
	bicycle_store ������ �뿩��
	book_store ����
	bowling_alley ������
	bus_station ���� ������
	cafe ī��
	campground ķ����
	car_dealer �ڵ��� �Ǹ�
	car_rental �ڵ��� �Ӵ�
	car_repair �ڵ��� ����
	car_wash ����
	casino ī����
	cemetery ����
	church ��ȸ
	city_hall ��û
	clothing_store �ʰ���
	convenience_store ������
	courthouse ����
	dentist ġ���ǻ�
	department_store ��ȭ��
	doctor �ǻ�
	electrician ����
	electronics_store ������ǰ ����
	embassy ����
	establishment (���� �ߴܵ�) ����
	finance (���� �ߴܵ�) ����
	fire_station �ҹ漭
	florist ����
	food ����
	funeral_home ��ʽ���
	furniture_store ���� ����
	gas_station ������
	general_contractor (���� �ߴܵ�) �Ϲ� �����
	grocery_or_supermarket (���� �ߴܵ�) �ķ�ǰ �Ǵ� ���۸��� 
	gym ü����
	hair_care �̿��
	hardware_store ö����
	health (���� �ߴܵ�) �ǰ�
	hindu_temple ���α� ���
	home_goods_store ���� ��ǰ��
	hospital ����
	insurance_agency ���� �븮��
	jewelry_store ���� ����
	laundry ��Ź
	lawyer ��ȣ�� �繫��
	library ������
	liquor_store �ַ� �Ǹ���
	local_government_office ���� ����
	locksmith �ڹ��� ������
	lodging �ϼ�
	meal_delivery �Ļ� ���
	meal_takeaway �Ļ� ����ũ �ƿ�
	mosque ���
	movie_rental ��ȭ �뿩
	movie_theater ��ȭ��
	moving_company �̻��� ȸ��
	museum �ڹ���
	night_club ����Ʈ Ŭ��
	painter ȭ��
	park ����
	parking ����
	pet_store �ֿ� ���� ����
	pharmacy ����
	physiotherapist ���� ġ��
	place_of_worship (���� �ߴܵ�) ���� ���
	plumber �����
	police ����
	post_office ��ü��
	real_estate_agency �ε���
	restaurant �������
	roofing_contractor ���� �����
	rv_park RV ����
	school �б�
	shoe_store �Ź� ����
	shopping_mall ���θ�
	spa ��õ
	stadium �����
	storage â��
	store ����
	subway_station ����ö��
	synagogue ���� ��ȸ��
	taxi_stand �ý� ������
	train_station ������
	transit_station ���� ����
	travel_agency �����
	university ����
	veterinary_care ���ǰ� ġ��
	zoo ������
	*/
	public CategoryMap(){
		category.put("accounting", "ȸ��");
		category.put("airport", "����");
		category.put("amusement_park", "���� ����");
		category.put("aquarium", "������");
		category.put("art_gallery", "�̼���");
		category.put("atm", "ATM");
		category.put("bakery", "����");
		category.put("bank", "����");
		category.put("bar", "��");
		category.put("beauty_salon", "�̿��");
		category.put("bicycle_store", "������ �뿩��");
		category.put("book_store", "����");
		category.put("bowling_alley", "������");
		category.put("bus_station", "���� ������");
		category.put("cafe", "ī��");
		category.put("campground", "ķ����");
		category.put("car_dealer", "�ڵ��� �Ǹ�");
		category.put("car_rental", "�ڵ��� �Ӵ�");
		category.put("car_repair", "�ڵ��� ����");
		category.put("car_wash", "����");
		category.put("casino", "ī����");
		category.put("cemetery", "����");
		category.put("church", "��ȸ");
		category.put("city_hall", "��û");
		category.put("clothing_store", "�ʰ���");
		category.put("convenience_store", "������");
		category.put("courthouse", "����");
		category.put("dentist", "ġ��");
		category.put("department_store", "��ȭ��");
		category.put("doctor", "���� ����");
		category.put("electrician", "����");
		category.put("electronics_store", "������ǰ ����");
		category.put("embassy", "����");
		category.put("establishment", "���");
		category.put("finance", "����");
		category.put("fire_station", "�ҹ漭");
		category.put("florist", "����");
		category.put("food", "����");
		category.put("funeral_home", "��ʽ���");
		category.put("furniture_store", "���� ����");
		category.put("gas_station", "������");
		category.put("general_contractor", "�Ϲ� ���");
		category.put("grocery_or_supermarket", "�ķ�ǰ �Ǵ� ���۸���");
		category.put("gym", "ü����");
		category.put("hair_care", "�̿��");
		category.put("hardware_store", "ö����");
		category.put("health", "�ǰ�");
		category.put("hindu_temple", "���α� ���");
		category.put("home_goods_store", "���� ��ǰ��");
		category.put("hospital", "���� ����");
		category.put("insurance_agency", "���� �븮��");
		category.put("jewelry_store", "���� ����");
		category.put("laundry", "��Ź");
		category.put("lawyer", "��ȣ�� �繫��");
		category.put("library", "������");
		category.put("liquor_store", "�ַ� �Ǹ���");
		category.put("local_government_office", "���� ����");
		category.put("locksmith", "�ڹ��� ������");
		category.put("lodging", "�ϼ�");
		category.put("meal_delivery", "�Ļ� ���");
		category.put("meal_takeaway", "�Ļ� ����ũ �ƿ�");
		category.put("mosque", "���");
		category.put("movie_rental", "��ȭ �뿩");
		category.put("movie_theater", "��ȭ��");
		category.put("moving_company", "�̻��� ȸ��");
		category.put("museum", "�ڹ���");
		category.put("natural_feature", "�ڿ�");
		category.put("night_club", "����Ʈ Ŭ��");
		category.put("painter", "ȭ��");
		category.put("park", "����");
		category.put("parking", "����");
		category.put("pet_store", "�ֿ� ���� ����");
		category.put("pharmacy", "�౹");
		category.put("physiotherapist", "���� ġ��");
		category.put("place_of_worship", "���� ���");
		category.put("plumber", "�����");
		category.put("point_of_interest", "������");
		category.put("police", "����");
		category.put("post_office", "��ü��");
		category.put("real_estate_agency", "�ε���");
		category.put("restaurant", "�������");
		category.put("roofing_contractor", "���� ����");
		category.put("rv_park", "ķ����");
		category.put("school", "�б�");
		category.put("shoe_store", "�Ź� ����");
		category.put("shopping_mall", "���θ�");
		category.put("spa", "��õ");
		category.put("stadium", "�����");
		category.put("storage", "â��");
		category.put("store", "����");
		category.put("subway_station", "����ö��");
		category.put("synagogue", "���� ��ȸ��");
		category.put("taxi_stand", "�ý� ������");
		category.put("train_station", "������");
		category.put("transit_station", "���� ����");
		category.put("travel_agency", "�����");
		category.put("university", "����");
		category.put("veterinary_care", "���ǰ� ġ��");
		category.put("zoo", "������");
		
	}
	
	public Map<String, String> getCategory() {
		return category;
	}
	
}

package com.tour.persistence;

public class SubCategoryVO {
	private int sub_category_id;
	private int top_category_id;
	private String name;
	
	public int getSub_category_id() {
		return sub_category_id;
	}
	public void setSub_category_id(int sub_category_id) {
		this.sub_category_id = sub_category_id;
	}
	public int getTop_category_id() {
		return top_category_id;
	}
	public void setTop_category_id(int top_category_id) {
		this.top_category_id = top_category_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
}

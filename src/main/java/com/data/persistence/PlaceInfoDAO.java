package com.data.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.data.domain.PlaceInfoVO;

public class PlaceInfoDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@211.238.142.110:1521:ORCL";
	//String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "scott";
	String password = "tiger";
	
	Connection con;
	
	public PlaceInfoDAO() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insert(PlaceInfoVO vo){
		String sql = "insert into placeInfo (placeinfo_id, sub_category, image, city, name, phone, address, country, homepage, latitude, longitude, top_category) "
				+ "values(seq_placeinfo.nextval, ?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getSubCategory());
			pstmt.setString(2, vo.getImage());
			pstmt.setString(3, vo.getCity());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getCountry());
			pstmt.setString(8, vo.getHomepage());
			pstmt.setString(9, vo.getLatitude());
			pstmt.setString(10, vo.getLongitude());
			pstmt.setString(11, vo.getTopCategory());
			
			int result = pstmt.executeUpdate();
			
			if(result!=0){
				System.out.println("입력성공");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstmt!=null){
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void disConnection(){
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

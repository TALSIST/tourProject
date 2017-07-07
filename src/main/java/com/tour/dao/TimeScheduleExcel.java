package com.tour.dao;

import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tour.persistence.CityVO;
import com.tour.persistence.PlaceVO;
import com.tour.persistence.ScheduleDayVO;
import com.tour.persistence.TourVO;


@Component
public class TimeScheduleExcel {
	
	@Autowired
	TimeScheduleDAO  dao;
	
	public String createExcel(int tour_id){
		//System.out.println("createExcel");
		
		int row_count=0;
		
		
		// Workbook 생성
        //Workbook xlsWb = new HSSFWorkbook(); // Excel 2007 이전 버전
        Workbook xlsxWb = new XSSFWorkbook(); // Excel 2007 이상 

        // *** Sheet1-------------------------------------------------
        // Sheet 생성
        Sheet sheet1 = xlsxWb.createSheet("전체일정 미리보기"); 

        // ----------------------------------------------------------        
        
        // *** Style--------------------------------------------------
        // Font
    	Font fontBlue = sheet1.getWorkbook().createFont();
    	fontBlue.setBoldweight(Font.BOLDWEIGHT_BOLD);
    	fontBlue.setColor(IndexedColors.BLUE.getIndex());    	
    	fontBlue.setFontHeightInPoints((short)18);

    	Font fontSkyBlue = sheet1.getWorkbook().createFont();
    	fontSkyBlue.setColor(IndexedColors.LIGHT_BLUE.getIndex());    	
    	fontSkyBlue.setFontHeightInPoints((short)11);

    	Font fontWhiteBig = sheet1.getWorkbook().createFont();
    	fontWhiteBig.setBoldweight(Font.BOLDWEIGHT_BOLD);
    	fontWhiteBig.setColor(IndexedColors.WHITE.getIndex());    
    	fontWhiteBig.setFontHeightInPoints((short)15);

    	Font fontWhiteBold = sheet1.getWorkbook().createFont();
    	fontWhiteBold.setBoldweight(Font.BOLDWEIGHT_BOLD);
    	fontWhiteBold.setColor(IndexedColors.WHITE.getIndex());    
    	fontWhiteBold.setFontHeightInPoints((short)12);

    	Font fontWhite = sheet1.getWorkbook().createFont();
    	fontWhite.setColor(IndexedColors.WHITE.getIndex());    
    	fontWhite.setFontHeightInPoints((short)12);

    	Font fontBlack = sheet1.getWorkbook().createFont();
    	fontBlack.setColor(IndexedColors.BLACK.getIndex());    
    	fontBlack.setFontHeightInPoints((short)11);

    	// Center 스타일 생성
        CellStyle cellTextCenterStyle = xlsxWb.createCellStyle();      
        cellTextCenterStyle.setWrapText(true);            
        cellTextCenterStyle.setAlignment(CellStyle.ALIGN_CENTER);
        cellTextCenterStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        cellTextCenterStyle.setFont(fontBlack);
        
        // Tour Title Style
        CellStyle titleCellStyle = xlsxWb.createCellStyle(); 
    	titleCellStyle.setAlignment(CellStyle.ALIGN_LEFT);
    	titleCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
    	titleCellStyle.setWrapText(true);
    	titleCellStyle.setFont(fontBlue);
        
    	// Day Order Style
    	CellStyle dayCellStyle = xlsxWb.createCellStyle(); 
    	dayCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
    	dayCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
    	dayCellStyle.setFillForegroundColor(IndexedColors.AQUA.getIndex());
    	dayCellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);   
    	dayCellStyle.setWrapText(true);
    	dayCellStyle.setFont(fontWhiteBig);

    	// Day Title Style
    	CellStyle dayTitleCellStyle = xlsxWb.createCellStyle(); 
    	dayTitleCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
    	dayTitleCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
    	dayTitleCellStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
    	dayTitleCellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);   
    	dayTitleCellStyle.setFont(fontWhiteBold);

    	// Title Style Border
    	CellStyle titleBorderCellStyle = xlsxWb.createCellStyle(); 
    	titleBorderCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
    	titleBorderCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
    	titleBorderCellStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
    	titleBorderCellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);   
        titleBorderCellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        titleBorderCellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        titleBorderCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        titleBorderCellStyle.setBorderBottom(HSSFCellStyle.BORDER_THICK);
    	titleBorderCellStyle.setWrapText(true);
    	titleBorderCellStyle.setFont(fontWhiteBold);

    	// City Style
    	CellStyle dayTitleCityStyle = xlsxWb.createCellStyle(); 
    	dayTitleCityStyle.setAlignment(CellStyle.ALIGN_LEFT);
    	dayTitleCityStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
    	dayTitleCityStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
    	dayTitleCityStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);   
    	//dayTitleCellStyle.setWrapText(true);
    	dayTitleCityStyle.setFont(fontWhite);
    	
    	// Normal Style
    	CellStyle normalCellStyle = xlsxWb.createCellStyle(); 
    	normalCellStyle.setAlignment(CellStyle.ALIGN_LEFT);
    	normalCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
    	normalCellStyle.setWrapText(true);
    	normalCellStyle.setFont(fontBlack);
    	
    	// Normal Style
    	CellStyle normalLineCellStyle = xlsxWb.createCellStyle(); 
    	normalLineCellStyle.setAlignment(CellStyle.ALIGN_LEFT);
    	normalLineCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
    	normalLineCellStyle.setWrapText(true);
    	normalLineCellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    	normalLineCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
    	normalLineCellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    	normalLineCellStyle.setFont(fontBlack);
    	
    	CellStyle centerCellStyle = xlsxWb.createCellStyle(); 
    	centerCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
    	centerCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
    	centerCellStyle.setFont(fontSkyBlue);

        Row row = null;
        Row row_day_order=null;
        Row row_date_title=null;
        Cell cell = null;
        //----------------------------------------------------------         
        
        sheet1.setColumnWidth(0, 300);
        
        // Tour Title
        TourVO vo=dao.tourData(tour_id);
        row=sheet1.createRow(row_count++);
        cell=row.createCell(1);
        cell.setCellValue(vo.getTitle());
        sheet1.addMergedRegion(new CellRangeAddress(0, 1, 1, 7));
        cell.setCellStyle(titleCellStyle); // 셀 스타일 적용
        row_count+=2;
        
        // Day
        List<ScheduleDayVO> list=dao.tourDateList(tour_id);
        // 2줄
        row_day_order=sheet1.createRow(row_count++);
        row_count++;
        // 1줄
        row_date_title=sheet1.createRow(row_count++);
        
        int day_order_gap=1;
        int day_title_gap=1;
        int start_place_row=row_count;
        List<Row> rowList=new ArrayList<Row>();
        
        for (int i=0;i<list.size();i++){
        	// day_order :  DAY 1
            //sheet1.setColumnWidth(day_order_gap, 1700);
        	cell=row_day_order.createCell(day_order_gap);  
        	cell.setCellValue(list.get(i).getDay_order());   
        	cell.setCellStyle(dayCellStyle);
        	sheet1.addMergedRegion(new CellRangeAddress(row_day_order.getRowNum()
                                                                                    , row_day_order.getRowNum()+1
                                                                                    , day_order_gap
                                                                                    , day_order_gap+2));
        	
        	// day_title_short : 7/24 월
        	cell=row_date_title.createCell(day_title_gap);
        	cell.setCellValue(list.get(i).getDay_title_short());
        	cell.setCellStyle(dayTitleCellStyle);
        	sheet1.addMergedRegion(new CellRangeAddress(row_date_title.getRowNum()
                                                                                    , row_date_title.getRowNum()
                                                                                    , day_title_gap
                                                                                    , day_title_gap+1));
        	//System.out.println("row_date_title.row="+row_date_title.getRowNum());
        	// city list : 서울,대전,부산
        	String city_list="";
        	List<CityVO> cvoList=list.get(i).getCityVO();
        	for (CityVO cvo:cvoList){
        		city_list+=cvo.getName()+",";
        	}
        	city_list=city_list.substring(0, city_list.lastIndexOf(","));
        	cell=row_date_title.createCell(day_title_gap+2);
        	cell.setCellValue(city_list);
        	cell.setCellStyle(dayTitleCityStyle);
        	
        	// place list
        	int p_row=0;
        	List<PlaceVO> pvoList=list.get(i).getPlaceVO();
        	for(PlaceVO  pvo:pvoList){
        		String no_name=pvo.getName();
        		String no=no_name.substring(0, no_name.indexOf("."));
        		String place_name = no_name.substring(no_name.indexOf(".")+1, no_name.length());
        		//System.out.println("row="+(start_place_row+p_row)+", col="+day_title_gap);
        		if (rowList.size()<p_row+1){
        			row=sheet1.createRow(start_place_row+p_row);
        			rowList.add(row);
        		}
        		// no
        		cell=rowList.get(p_row).createCell(day_title_gap);
        		cell.setCellValue(Integer.parseInt(no));
        		cell.setCellStyle(centerCellStyle);
        		//sheet1.setColumnWidth(day_title_gap, 1000);
        		//System.out.println("day_title_gap="+day_title_gap);
        		// place_name
        		cell=rowList.get(p_row).createCell(day_title_gap+1);
        		cell.setCellValue(place_name);
        		cell.setCellStyle(normalCellStyle);
        		//sheet1.setColumnWidth(day_title_gap+1, 3000);
            	sheet1.addMergedRegion(new CellRangeAddress(rowList.get(p_row).getRowNum()
                        																, rowList.get(p_row).getRowNum()
                        																, day_title_gap+1
                        																, day_title_gap+1+1));
        		
        		p_row++;
        		
        	}
        	
        	// ColumnWidth
        	sheet1.setColumnWidth(day_order_gap, 1000);    // no
        	sheet1.setColumnWidth(day_order_gap+1, 1500);
        	sheet1.setColumnWidth(day_order_gap+2, 5000);
        	
        	// 사이 column
        	sheet1.setColumnWidth(day_order_gap+3, 1000);

        	// 다음 column 위치 지정하기. 
        	day_order_gap+=4;
        	day_title_gap+=4;
        }

        // *** Sheet2-------------------------------------------------
        // Sheet 생성
        Sheet sheet2 = xlsxWb.createSheet("상세일정"); 

        // 컬럼 너비 설정
        sheet2.setColumnWidth(0, 300);
        
        Row row_sh2 = null;
        Cell cell_sh2 = null;
        int row_count_sh2=1;
        int start_col=1;
        
        // 상세일정 
        row_sh2=sheet2.createRow(row_count_sh2);
        cell_sh2=row_sh2.createCell(start_col);
        cell_sh2.setCellValue("나의 상세일정");
        cell_sh2.setCellStyle(dayCellStyle);
        sheet2.addMergedRegion(new CellRangeAddress(row_sh2.getRowNum()
																				, row_sh2.getRowNum()+1
																				, start_col
																				, start_col+2));
        row_count_sh2+=3;
        
        String[] header={"일차","도시","항목","명칭","주소","전화번호"};
        
        // ColumnWidth
        int  colWidth=0;
        for(int i=0;i<header.length;i++){
        	if (i==0||i==2){
        		// 일차
        		colWidth=2500;
        	}else if(i==3){
        		// 명칭
        		colWidth=5000;
        	} else if (i==4){
        		// 주소
        		colWidth=7000;
        	} else {
        		colWidth=4000;
        	}
        	sheet2.setColumnWidth(start_col+i, colWidth);
        }

        // header
        row_sh2=sheet2.createRow(row_count_sh2);
        row_sh2.setHeight((short)500);
        for(int i=0;i<header.length;i++){
        	cell_sh2=row_sh2.createCell(start_col+i);
        	cell_sh2.setCellValue(header[i]);
        	cell_sh2.setCellStyle(titleBorderCellStyle);
        }      
        row_count_sh2++;
        
        // 일정
        cellTextCenterStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        cellTextCenterStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        cellTextCenterStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        for (int i=0;i<list.size();i++){
        	List<PlaceVO> pvoList=list.get(i).getPlaceVO();
        	int col_index=0;
        	row_sh2=sheet2.createRow(row_count_sh2++);
        	int day_start_row=row_sh2.getRowNum();
        	
        	// day
        	cell_sh2=row_sh2.createCell(start_col+col_index);
        	String day_desc = list.get(i).getDay_order() + "\n"+list.get(i).getDay_title();
        	cell_sh2.setCellValue(day_desc);
        	cell_sh2.setCellStyle(cellTextCenterStyle);        	
        	col_index++;
        	
        	// 도시
        	cell_sh2=row_sh2.createCell(start_col+col_index);
        	//System.out.println("도시 col="+cell_sh2.getColumnIndex());
        	String city_list="";
        	List<CityVO> cvoList=list.get(i).getCityVO();
        	for (CityVO cvo:cvoList){
        		city_list+=cvo.getName()+",";
        	}
        	city_list=city_list.substring(0, city_list.lastIndexOf(","));
        	cell_sh2.setCellValue(city_list);
        	cell_sh2.setCellStyle(cellTextCenterStyle);
        	col_index++;      	
        	
        	int start_place_col=start_col+col_index;
        	String bef_sub_category_name="";
    		int sub_same_count=0;
    		int sub_same_start_row=0;
    		int sub_category_col=0;
    		boolean bSameChk=false;
        	for(int p=0;p<pvoList.size();p++){	
        		int place_col_index=0;
        		if (p!=0){
        			cell_sh2=row_sh2.createCell(start_col);
        			cell_sh2.setCellStyle(cellTextCenterStyle);
        			cell_sh2=row_sh2.createCell(start_col+1);
        			cell_sh2.setCellStyle(cellTextCenterStyle);
        		}
        		// 항목
        		sub_category_col=start_place_col+place_col_index++;
            	cell_sh2=row_sh2.createCell(sub_category_col);
            	String sub_category_name=pvoList.get(p).getSubcategory().getName();            	
            	// 항목 same check
            	if (sub_category_name.equals(bef_sub_category_name)){
            		sub_same_count++;
            		if (p==(pvoList.size()-1)){
            			bSameChk=true;
            		}
            	} else {
            		cell_sh2.setCellValue(sub_category_name);
            		if(sub_same_count>0){
            			bSameChk=true;
            			sheet2.addMergedRegion(new CellRangeAddress(sub_same_start_row
																								, sub_same_start_row+sub_same_count
																								, sub_category_col
																								, sub_category_col));
            		}
            		// 적용 후 초기화
            		sub_same_count=0;
            		sub_same_start_row=row_sh2.getRowNum();
            		bSameChk=false;
            	}
            	// for last row
            	if (bSameChk==true && p==(pvoList.size()-1)){
        			sheet2.addMergedRegion(new CellRangeAddress(sub_same_start_row
																							, sub_same_start_row+sub_same_count
																							, sub_category_col
																							, sub_category_col));
        			bSameChk=false;
            	}
            	//System.out.println("sub_same_start_row="+sub_same_start_row+", bef="+bef_sub_category_name+", after="+sub_category_name+", count="+sub_same_count);
            	bef_sub_category_name=sub_category_name;
            	cell_sh2.setCellStyle(cellTextCenterStyle);
            	
        		// 명칭
        		cell_sh2=row_sh2.createCell(start_place_col+place_col_index++);
        		//System.out.println("명칭 col="+cell_sh2.getColumnIndex());
        		String place_name=pvoList.get(p).getName();
        		cell_sh2.setCellValue(place_name.substring(place_name.indexOf(".")+1));
        		cell_sh2.setCellStyle(normalLineCellStyle);
        		
        		// 주소
        		cell_sh2=row_sh2.createCell(start_place_col+place_col_index++);
        		cell_sh2.setCellValue(pvoList.get(p).getAddress());
        		cell_sh2.setCellStyle(normalLineCellStyle);
        		
        		//전화
        		cell_sh2=row_sh2.createCell(start_place_col+place_col_index++);
        		cell_sh2.setCellValue(pvoList.get(p).getPhone());
        		cell_sh2.setCellStyle(normalLineCellStyle);
        		
        		if (p<(pvoList.size()-1)){
        			row_sh2=sheet2.createRow(row_count_sh2++);
        		} else {
        			//System.out.println("sub_same_count="+sub_same_count);
        		}
        		
        	}        	
        	//System.out.println(list.get(i).getDay_title()+" : place_count="+pvoList.size());
        	
        	// 일자 cell 병합
        	sheet2.addMergedRegion(new CellRangeAddress(day_start_row
					  																, day_start_row+pvoList.size()-1
					  																, start_col
					  																, start_col));
        	
        	// 도시 cell 병합
        	sheet2.addMergedRegion(new CellRangeAddress(day_start_row
																					, day_start_row+pvoList.size()-1
																					, start_col+1
																					, start_col+1));
        }

        String loc="C:/excel";
        File folder=new File(loc);
        if (!folder.exists()){
        	folder.mkdirs();
        }
        
    	String excelFileName="";
        // excel 파일 저장
        try {
        	excelFileName=loc+"/"+vo.getTitle()+".xlsx";
            File xlsFile = new File(excelFileName);
            FileOutputStream fileOut = new FileOutputStream(xlsFile);
            xlsxWb.write(fileOut);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return excelFileName;
	}
	
	public void MakeExcelFolder(String folder){
		
	}

}

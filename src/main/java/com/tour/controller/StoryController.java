package com.tour.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.PlaceVO;
import com.tour.persistence.SchedulePlanVO;
import com.tour.persistence.StoryVO;
import com.tour.service.StoryService;
import com.tour.util.MediaUtils;
import com.tour.util.UploadFileUtils;

@Controller
@RequestMapping("/story")
public class StoryController {
	@Resource(name="uploadPath")
	private String uploadPath;
	@Autowired
	private StoryService StoryService;
	
	@RequestMapping("")
	public String storyList(@ModelAttribute("tour_id") int tour_id, Model model){
		System.out.println("tour_id="+tour_id);
		List<SchedulePlanVO> schedulePlans = StoryService.selectSchedulePlans(tour_id);
		
		int i = 1;
		for(SchedulePlanVO vo : schedulePlans){
			System.out.println("day"+i+"="+vo.getTour_date());
			i++;
		}
		
		model.addAttribute("schedulePlans", schedulePlans);
		model.addAttribute("uploadPath", uploadPath);
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","../story/story.jsp");
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String storyCreate(@ModelAttribute("tour_id") int tour_id, Model model){
		List<SchedulePlanVO> schedulePlans = StoryService.selectSchedulePlans(tour_id);
		
		model.addAttribute("schedulePlans", schedulePlans);
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","../story/storyCreate.jsp");
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String storyCreate(int tour_id, StoryVO story, RedirectAttributes rttr){
		
		System.out.println("Title="+story.getTitle());
		System.out.println("Content="+story.getContent());
		System.out.println("Detail_schedule_id="+story.getDetail_schedule_id());
		
		if(story.getImageFiles() != null){
			for(int i=0; i<story.getImageFiles().length; i++){
				System.out.println("Image"+(i+1)+"="+story.getImageFiles()[i]);
			}
		}
		
		story.setMember_id(18); //임시로 member_id 지정
		StoryService.insertStory(story);
		
		rttr.addAttribute("tour_id", tour_id);
		
		return "redirect:/story";
	}
	
	@RequestMapping("/read")
	public String storyRead(@ModelAttribute("tour_id") int tour_id, Model model){
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","../story/storyRead.jsp");
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String storyUpdate(@ModelAttribute("tour_id") int tour_id, Model model){
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","../story/storyUpdate.jsp");
		return "mypage/mypage";
	}
	
	@ResponseBody
	@RequestMapping(value="/getPlace/{tour_id}/{tour_date}", method=RequestMethod.GET)
	public Map<Integer, PlaceVO> getPlace(@PathVariable("tour_id") int tour_id, @PathVariable("tour_date") String tour_date){
		List<SchedulePlanVO> schedulePlans = StoryService.selectSchedulePlans(tour_id);
		
		Map<Integer, PlaceVO> map = new HashMap<Integer, PlaceVO>();
		
		for(SchedulePlanVO schedulePlan : schedulePlans){
			if(schedulePlan.getTour_date().equals(tour_date)){
				List<DetailScheduleVO> detailSchedules = schedulePlan.getDetailScheduleList();
				
				for(DetailScheduleVO detailSchedule : detailSchedules){
					map.put(detailSchedule.getDetail_schedule_id(), detailSchedule.getPlaceVO());
				}
			}
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadImages", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadImages(MultipartFile file){
		try {
			return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	@ResponseBody
	@RequestMapping("/displayImages")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType!=null){ 
				headers.setContentType(mType);
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteImages", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType!=null){
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete(); //원본파일 삭제
		}
		
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete(); //썸네일 삭제
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
}

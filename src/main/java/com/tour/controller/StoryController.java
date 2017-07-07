package com.tour.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	private StoryService storyService;
	
	public StoryController() {
	}
	
	@RequestMapping("")
	public String storyList(@ModelAttribute("tour_id") int tour_id, Model model){
		System.out.println("tour_id="+tour_id);
		List<SchedulePlanVO> schedulePlans = storyService.selectSchedulePlans(tour_id);
		
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
		List<SchedulePlanVO> schedulePlans = storyService.selectSchedulePlans(tour_id);
		
		model.addAttribute("schedulePlans", schedulePlans);
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","../story/storyCreate.jsp");
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String storyCreate(@ModelAttribute("tour_id")int tour_id, StoryVO story, RedirectAttributes rttr){
		
		System.out.println("Title="+story.getTitle());
		System.out.println("Content="+story.getContent());
		System.out.println("Detail_schedule_id="+story.getDetail_schedule_id());
		
		if(story.getImageFiles() != null){
			for(int i=0; i<story.getImageFiles().length; i++){
				System.out.println("Image"+(i+1)+"="+story.getImageFiles()[i]);
			}
		}
		
		story.setMember_id(18); //임시로 member_id 지정
		storyService.insertStory(story);
		
		rttr.addAttribute("tour_id", tour_id);
		return "redirect:/story";
	}
	
	@RequestMapping("/read")
	public String storyRead(@ModelAttribute("tour_id") int tour_id, int story_id, Model model){
		List<SchedulePlanVO> schedulePlans = storyService.selectSchedulePlans(tour_id);
		String dayAndDate = null;
		String placeName = null;
		StoryVO story = null;
		
		for(int i=0; i<schedulePlans.size(); i++){
			SchedulePlanVO schedulePlan = schedulePlans.get(i);
			for(DetailScheduleVO detailSchedule : schedulePlan.getDetailScheduleList()){
				for(StoryVO storyVO : detailSchedule.getStoryList()){
					if(storyVO.getStory_id() == story_id){
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						dayAndDate = "day"+i+" ("+sdf.format(detailSchedule.getTour_date())+")";
						placeName = detailSchedule.getPlaceVO().getName();
						story = storyVO;
					}
				}
			}
		}
		
		model.addAttribute("dayAndDate", dayAndDate);
		model.addAttribute("placeName", placeName);
		model.addAttribute("story", story);
		
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","../story/storyRead.jsp");
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String storyDelete(@ModelAttribute("tour_id") int tour_id, int story_id, RedirectAttributes rttr) throws Exception{
		storyService.deleteStory(story_id);
		rttr.addAttribute("tour_id", tour_id);
		return "redirect:/story";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String storyUpdate(@ModelAttribute("tour_id") int tour_id, @ModelAttribute("story_id") int story_id, Model model){
		List<SchedulePlanVO> schedulePlans = storyService.selectSchedulePlans(tour_id);
		String dayAndDateOther = null;
		String placeName = null;
		StoryVO story = null;
		
		for(int i=0; i<schedulePlans.size(); i++){
			SchedulePlanVO schedulePlan = schedulePlans.get(i);
			for(DetailScheduleVO detailSchedule : schedulePlan.getDetailScheduleList()){
				for(StoryVO storyVO : detailSchedule.getStoryList()){
					if(storyVO.getStory_id() == story_id){
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						dayAndDateOther = sdf.format(detailSchedule.getTour_date());
						placeName = detailSchedule.getPlaceVO().getName();
						story = storyVO;
					}
				}
			}
		}
		
		model.addAttribute("schedulePlans", schedulePlans);
		model.addAttribute("dayAndDateOther", dayAndDateOther);
		model.addAttribute("placeName", placeName);
		model.addAttribute("story", story);
		
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","../story/storyUpdate.jsp");
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String storyUpdate(@ModelAttribute("tour_id") int tour_id, StoryVO story, RedirectAttributes rttr) throws Exception{
		
		if(story.getImageFiles() != null){
			for(int i=0; i<story.getImageFiles().length; i++){
				System.out.println("Image"+(i+1)+"="+story.getImageFiles()[i]);
			}
		}
		
		storyService.updateStory(story);
		
		rttr.addAttribute("tour_id", tour_id);
		return "redirect:/story";
	}
	
	@ResponseBody
	@RequestMapping(value="/getPlace/{tour_id}/{tour_date}", method=RequestMethod.GET)
	public Map<Integer, PlaceVO> getPlace(@PathVariable("tour_id") int tour_id, @PathVariable("tour_date") String tour_date){
		List<SchedulePlanVO> schedulePlans = storyService.selectSchedulePlans(tour_id);
		
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
	
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
		
		if(files == null || files.length == 0){
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files){
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType!=null){
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
			}
			
			new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}

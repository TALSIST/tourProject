 package com.tour.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.tour.persistence.CountryVO;
import com.tour.persistence.MemberVO;

import java.util.*;

public interface MemberMapper {
   
   @Select("SELECT * FROM member")
   public List<MemberVO> memberSelect();
   
   //회원가입
   @Insert("INSERT INTO member(member_id,id,password,name,email) VALUES("
         + "SEQ_MEMBER.nextval,#{id},#{password},#{name},#{email})")
     public void memberInsert(Map map);

    //이메일 중복체크
    @Select("SELECT COUNT(*) FROM member "
          +"WHERE email=#{email}")
     public int memberEmailcheck(String email);
    
   // 로그인 
     @Select("SELECT password FROM member "
          +"WHERE email=#{email}")
     public String memberGetPwd(String email);
     
     @Select("SELECT * FROM member "
    		 +"WHERE email=#{email}")
      public MemberVO memberInfoData(String email);
     
     
}
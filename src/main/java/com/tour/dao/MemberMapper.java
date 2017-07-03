 package com.tour.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.tour.persistence.CountryVO;
import com.tour.persistence.MemberVO;

import java.util.*;

public interface MemberMapper {
   
   @Select("SELECT * FROM member")
   public List<MemberVO> memberSelect();
   
   @Insert("INSERT INTO member(member_id,name,email,password) VALUES("
         + "SEQ_MEMBER.nextval,#{name},#{email},#{password})")
     public void memberInsert(Map map);

    //�̸��� �ߺ�üũ
    @Select("SELECT COUNT(*) FROM member "
          +"WHERE email=#{email}")
     public int memberEmailcheck(String email);
    
   // �α��� 
     @Select("SELECT pwd FROM member "
          +"WHERE email=#{email}")
     public String memberGetPwd(String email);
     
     
}
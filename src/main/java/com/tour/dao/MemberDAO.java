package com.tour.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.tour.persistence.MemberVO;

@Repository
public class MemberDAO {
   @Autowired
   private MemberMapper mMapper;
   
   public void memberInsert(Map map){
      mMapper.memberInsert(map);
   }
   
   public int memberEmailcheck(String email)
   {
         return mMapper.memberEmailcheck(email);
    }
   
   public String memberGetPwd(String email){
      return mMapper.memberGetPwd(email);
   }
   
   
}
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/resources/css/complete.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>완료창</title>
</head>
<script>
    $('#pn_title').keyup(function(){
       _now_text_length = $(this).val().length;
       if(_now_text_length >21){
          alert('제목은 최대 20자까지 작성할 수 있습니다.');//제목은 최대 20자까지 작성할 수 있습니다.');
          _now_sub_str = $(this).val().substr(0, 20);
          $(this).val(_now_sub_str);
       }
    });
    $('#pn_desc').keyup(function(){
       _now_text_length = $(this).val().length;
       if(_now_text_length >51){
          alert('설명은 최대 50자까지 작성할 수 있습니다.');//설명은 최대 50자까지 작성할 수 있습니다.');
          _now_sub_str = $(this).val().substr(0, 50);
          $(this).val(_now_sub_str);
       }
    }); 
    $('#is_public_sel_box').click(function(){
      var is_checked = $(this).attr('data-check');
      if(is_checked == '1'){
        $(this).removeClass('on');
        $(this).attr('data-check', '0');
        $('#is_public').val('1');
      }else{
        $(this).addClass('on');
        $(this).attr('data-check', '1');
        $('#is_public').val('0');
      }
    });
   $(document).ready(function(){
      if(parent.$('#cat_menu').attr('data') > 0){
         $('#this_modal_title').text('일정만들기 완료');
      }
  var data = "pn_srl=192403";
      $.ajax({  
        type:'post',
        data:data,
        cache:false,
        url:'/api/plan/get_plan_info',
        success: function(data){ 
          //console.log(data);
               
          var ci_lat = data.response_data.city_info.ci_lat;
          var ci_lng = data.response_data.city_info.ci_lng;
          var ci_srl =  data.response_data.city_info.ci_srl;
          var ci_ss_id = data.response_data.city_info.ss_city_id

          var _pn_title = data.response_data.plan_info.pn_title;
          var _pn_desc = data.response_data.plan_info.pn_desc;
          var _start_day = data.response_data.plan_info.start_day;
          var _tour_type = data.response_data.plan_info.tour_type;
          var _is_public = data.response_data.plan_info.is_public;

          $('#pn_title').val(_pn_title);
          $('#pn_desc').val(_pn_desc);
          $('#start_day').val(_start_day);
          
          $('#tour_type').val(_tour_type);
          $('.theme_radio[data-val="'+_tour_type+'"]').addClass('on');
          _t_img = $('.theme_radio[data-val="'+_tour_type+'"] img').attr('src');
          $('.theme_radio[data-val="'+_tour_type+'"] img').attr('src',_t_img.replace('.gif','_on.gif'));

          $('#is_public').val(_is_public);
          
          if(_is_public == '0'){
             $('#is_public_sel_box').addClass('on');
             $('#is_public_sel_box').attr('data-check','1');
          }else{
             $('#is_public_sel_box').removeClass('on');
             $('#is_public_sel_box').attr('data-check','0');
          }
      
        }
      });

      $('#start_day').datepicker({
         numberOfMonths:1,
         prevText:'',
         nextText:'',
         monthNames : [
                     '1월', //1월', 
                     '2월', //2월', 
                     '3월', //3월', 
                     '4월', //4월', 
                     '5월', //5월', 
                     '6월', //6월', 
                     '7월', //7월', 
                     '8월', //8월', 
                     '9월', //9월', 
                     '10월', //10월', 
                     '11월', //11월', 
                     '12월'], //12월'], 
         monthNamesShort : [
                     '1월', //1월', 
                     '2월', //2월', 
                     '3월', //3월', 
                     '4월', //4월', 
                     '5월', //5월', 
                     '6월', //6월', 
                     '7월', //7월', 
                     '8월', //8월', 
                     '9월', //9월', 
                     '10월', //10월', 
                     '11월', //11월', 
                     '12월'], //12월'], 
         dayNames:['SUN','MON','TUE','WED','THU','FRI','SAT'],
         dayNamesShort:['SUN','MON','TUE','WED','THU','FRI','SAT'],
         dayNamesMin:['SUN','MON','TUE','WED','THU','FRI','SAT'],
         dateFormat:'yy-mm-dd',
         onClose:function(selectedDate){
         }
      });
   });
   $('#form_submit').click(function() {
      if($('#ci_srl').val() == ""){
          alert('잘못된 접근입니다.\n창을 닫고 다시 시도하세요.');//잘못된 접근입니다.\n창을 닫고 다시 시도하세요.');
          return false;
      }
      else if($('#pn_title').val() == ""){
         alert('제목을 입력하세요.');//제목을 입력하세요.');
      }
      else if($('#start_day').val() == ""){
         alert('출발일을 입력하세요.');//출발일을 입력하세요..');
      }
      else if($('#tour_type').val() == ""){
         alert('여행테마를 선택하세요.');//여행테마를 입력하세요.');
      }
      else{
         // $('.plan_create_btn').html('<img src="/res/img/loader_blue.gif" style="margin-top:12px;">');
         var form = $('#f_plan_edit');
      //alert(form.serialize());
         $.ajax({
            url: '/api/plan/set_plan_info',
            type: 'post',
            data: form.serialize(),
            timeout: 10000,  
            dataType:"json",
            success: function(data) {
               //console.log('업데이트!');
               //console.log(data);

               var pn_srl = data.response_result.pn_srl;
               if(parent.$('#cat_menu').length > 0){
                  parent.plan_complete_com();
               }else{
                  parent.location.reload(true);
               }
               et_modal_close();
               //parent.location.href='/plan/workspace?pn_srl='+pn_srl;

            },         
            error: function(xhr, textStatus, error) {
               //alert(xhr.status);               
            }
         });   
       return false;
       }
   });
</script>
<body style="background-color:white;height:550px;">
   <div class="modal_box">
   <div class="title_box">
      <!--일정정보 수정--><span id="this_modal_title">일정만들기 완료</span>
      <!-- <img src="/resources/img/plan/modal_close_btn.gif" class="modal_btn_close" alt="" onclick="et_modal_close();"> -->
   </div>
   <div class="modal_content">
      <form id="f_plan_edit">
      <input type="hidden" name="member_srl" id="member_srl" value="1329228">
      <input type="hidden" name="pn_srl" id="pn_srl" value="192403">
      <table class="create_table" width="100%" cellpadding="0" cellspacing="0">
         <colgroup>
            <col width="85">
            <col>
         </colgroup>
         <tbody><tr>
            <th>
               <!--여행 제목-->여행 제목            </th>
            <td>
               <input type="text" name="pn_title" id="pn_title" class="modal_input">
            </td>
         </tr>
         <tr>
            <td colspan="2" class="blank_td">&nbsp;</td>
         </tr>
         <tr>
            <th>
               <!--설명-->설명            </th>
            <td>
               <textarea class="modal_textarea" name="pn_desc" id="pn_desc" placeholder="이번 여행에 관한 간략한 소개글을 작성해 보세요!!             (선택사항)"></textarea>
            </td>
         </tr>
         <tr>
            <td colspan="2" class="blank_td">&nbsp;</td>
         </tr>
         <tr>
            <th>
               <!--출발일-->출발일            </th>
            <td>
               <input type="text" name="start_day" id="start_day" class="modal_input w50 cal hasDatepicker">
            </td>
         </tr>
         <tr>
            <td colspan="2" class="blank_td">&nbsp;</td>
         </tr>
         <tr>
            <th valign="top" style="padding-top:5px;">
               <!--여행 테마-->여행 테마            </th>
            <td>
            <div class="theme_div">
               <input type="hidden" class="modal_input w50 theme" name="tour_type" id="tour_type" value="0">
               <div class="theme_radio" data-val="001">
                  <div>
                     <img class="theme_img" src="/resources/img/plan/theme_alone.gif" alt="">
                     <br>
                     <input type="radio" class="r_inner_box">
                     <!--나홀로-->나홀로                  </div>
                  </div>
               <div class="theme_radio" data-val="002">
                  <div>
                     <img class="theme_img" src="/resources/img/plan/theme_couple.gif" alt="">
                     <br>
                     <input type="radio" class="r_inner_box">
                     <!--커플-->커플                  </div>
                  </div>
               <div class="theme_radio" data-val="003">
                  <div>
                     <img class="theme_img" src="/resources/img/plan/theme_frends.gif" alt="">
                     <br>
                     <input type="radio" class="r_inner_box">
                     <!--친구-->친구                  </div>
                  </div>
            </div>
            <div class="theme_div">
               <div class="clear"></div>
               <div class="theme_radio" data-val="004">
                  <div>
                     <img class="theme_img" src="/resources/img/plan/theme_family.gif" alt="">
                     <br>
                     <input type="radio" class="r_inner_box">
                     <!--가족-->가족                  </div>
                  </div>
   
               <div class="theme_radio" data-val="007">
                  <div>
                     <img class="theme_img" src="/resources/img/plan/theme_people.gif" alt="">
                     <br>
                     <input type="radio" class="r_inner_box">
                     <!--단체-->단체                  </div>
                  </div>
   
               <div class="theme_radio" data-val="005">
                  <div>
                     <img class="theme_img" src="/resources/img/plan/theme_business.gif" alt="">
                     <br>
                     <input type="radio" class="r_inner_box">
                     <!--비즈니스-->비즈니스                  </div>
                  </div>
            </div>
            </td>
         </tr>
      </tbody></table>
   </form></div>
   <div class="modal_footer">
      <div class="fl">
         <div class="modal_select_box" id="is_public_sel_box" data-check="0">
         <input type="checkbox" class="r_inner_box">
            <!--비공개-->비공개         </div>
      <div id="comp">
         <input type="hidden" name="is_public" id="is_public" class="is_public" value="1">
         <input type="button" class="m_btn_submit" id="form_submit" value="완료">
      </div>
      <div class="clear"></div>
   </div>   
</div>
</div>
</body>
</html>
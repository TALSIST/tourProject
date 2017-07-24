$(document).ready(function(){
   var email="";
   var password="";
   
   $("input").on("change", function() {
      var test = $(this).val();
      var type=$(this).attr('type');
      
      if(type=="email"){
         email= $(this).val();
      }else if(type=="password"){
         password=$(this).val();
      }
      
      
      //alert("email   : " + email+"    password  : "+ password);
      
   });
   
   $(".btn.login").click(function(){
      
       // alert("email   "+ email);
        //alert("password  " + password);
        if(email.trim()=="")
         {
            $("input.check-email").focus();
            return;
         }
        if(password.trim()=="")
         {
            $("input.check-password").focus();
            return;
         }
        $.ajax({ 
             type:"POST",
              url:"/signin", 
              data:{"email":email,"password":password},
              success:function(data){
                 //alert("data" + data);
                 if(data=="OK"){
                    $(".login-wrap").addClass("hide");
                     location.reload();
                 }else{
                    $("input.check-password").attr('class','check-password dirty invalid');
                 }
              }
       });
        

     });
});

//
(function() {
  $("input").on("change", function() {
    if ($(this).val().length > 0) {
      $(this).addClass("dirty");
    } else {
      $(this).removeClass("dirty");
    }
  });
  
  $(".show-signup-btn").on("click", function() {
    $(".signup-wrap").removeClass("hide");
    $(".login-wrap").addClass("hide");
  });

  $(".hide-signup-btn").on("click", function() {
    $(".signup-wrap").removeClass(".hide-exit").addClass("hide-enter")
    setTimeout(function(){
      $(".signup-wrap").addClass("hide").removeClass("hide-enter");
    }, 100);
    
    
    $(".login-wrap").removeClass("hide");
  });

  //占쎌뵠筌롫뗄�뵬 餓λ쵎�궗 筌ｋ똾寃� -> 占쎈툡占쎌뵠占쎈탵 餓λ쵎�궗 筌ｋ똾寃� (占쎈툡占쎌뵠占쎈탵 餓λ쵎�궗占쎈┷筌롳옙 揶쏉옙占쎌뿯 �겫�뜃占�)
  $("input.check-email").on("keyup", function() {
     var email=$("input.check-email").val();
    if ($(this).hasClass("invalid")) {
      addValidation($(this), emailCheck);  
    } else {
      $(this).on("change", function() {
        addValidation($(this), emailCheck);
      })
    }
    
/*    $.ajax({ 
        url: "/emailcheck", 
        type: "POST",
        data: {"email" : email},
        dataType:"text",
        success: function(data){
           if(count!=0){
              alert("email is already exist");
           }else{
              $("input.check-email").html(data);
           }
        }
       });*/

  });
  
  //email 占쎌뒙占쎈뼕占쎈뤂占쎈き占쎈씮�굲雅��겦�뙔占쎌굲占쎈뙀占쎈룏占쎌굲�뜝�럩留띰옙�쐻占쎈윥占쎌맽占쎈쐻占쎈윥�뜝�떬�굞�뀋�뜝�럡�땽�뜝�럥裕�占쎈쐻占쎈윥壤쏅���삕占쎌맶�뜝�럥�쑋濚밸Ŋ�땬占쎌굲�뜝�럥�듋�뜝�럥�뇢�솻洹⑥삕�뜝�럡�렊
  /*function chkEmail(){
       var chk=false;
       if( $("input.check-email").val() != ""){
           var email=$("input.check-email").val();
           $.ajax({ 
                  url: "login.do", 
                  type: "POST",
                  data: {"email" : email},
                  dataType:"text",
                  success: function(data){
                      if(data) {
                          console.log("The email is duplicated.");
                          
                      }else{
                         console.log("The email is available.");
                           $("input.check-email").html(data); //�뜝�럥�맶�뜝�럥�쑅�뜝�럥�럪�뜝�럥�맶�뜝�럥�쑅�뜝�럩紐쀥뜝�럥�맶�뜝�럥�쑅嶺뚮슢寃�占쎌맶�뜝�럥�쑅�뜝�럥�럪�뜝�럥�맶�뜝�럥�쑅�뜝�럩紐쀯옙�쐻占쎈윪占쎌읆�뜝�럥�맶占쎈쐻�뜝占� �뜝�럥�맶�뜝�럥�쑅�뜝�럥�럪�뜝�럥�맶�뜝�럥�쑅�뜝�럩留썲뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥�쑅�뜝�럥�럪�뜝�럥�맶�뜝�럥�쑅�뜝�럩紐앭뜝�럥�맶�뜝�럥�쑅嶺뚋쇰젿占쎌맶�뜝�럥�쑅�뜝�럥�럪�뜝�럥�맶�뜝�럥�쑅�뜝�럩紐앭뜝�럥�럸占쎈쐻占쎈쑕占쎌맶占쎈쐻�뜝占� �뜝�럥�맶�뜝�럥�쑋�뜝�럥占쎈돍�삕占쎌맳�뛾占썼쥈�굥彛믭옙�쐻占쎈윞占쎈뤈�뜝�럥�맶�뜝�럥�쐾�뜝�럥�몘�뜝�럥�맶�뜝�럥�쐾�뜝�럩�굩�뜝�럥�렅�넭怨롫봿援뀐옙�쐻占쎈윪筌띾씛�삕占쎌맶�뜝�럥�쑅嶺뚯쉸占싸살맶�뜝�럥�쑋占쎈쨨占쎈Ŋ�굲�뜝�럩留띰옙�쐻占쎈윥占쎌몗占쎈쐻占쎈윥占쎌졄
                      }
                  }
           });
       }
   }*/

  //占쎌�占쎌뒞占쎄쉐 筌ｋ똾寃� 占쎌뜎 野껉퀗�궢占쎈ご占쎈뻻
  function addValidation(input, inputCheck) {
    if (input.val().length > 0) {
      var validInput = inputCheck(input.val());
      console.log(validInput);    
      if (validInput) {
        if (input.hasClass("invalid")) {
          input.removeClass("invalid");
        }
        input.addClass("valid");
      } else {
        if (input.hasClass("valid")) {
          input.removeClass("valid");
        }
        input.addClass("invalid");
      }
    } else {
      input.removeClass("invalid");
      input.removeClass("valid");
    }
  }
  
  //占쎌돳占쎌뜚揶쏉옙占쎌뿯
  $(".btn.signup ").click(function(){

    
     var name=$("input.name").val();
     var email=$("input.check-email").val();
     var password=$("input.check-password").val();
     var pwd=$("input.check-equal").val();
     var id=email.split("@")[0];  
     
      if(name.trim()=="")
      {
         $("input.name").focus();
         return;
      }
       if(email.trim()=="")
      {
         $("input.check-email").focus();
         return;
      }
       if(password.trim()=="")
      {
         $("input.check-password").focus();
         return;
      }
       if(pwd.trim()=="")
      {
         $("input.check-equal").focus();
         return;
      }
       if(password.trim()!=pwd.trim()){
          $("input.check-equal").focus();
          //$("input.check-equal dirty").attr('class', 'check-equal dirty invalid');
          var test = $("input.check-equal").attr('class','check-equal dirty invalid');
          alert(test);
         return;
       }else{
          $("input.check-equal").attr('class','check-equal dirty valid');
       }
       
       
       
       $.ajax({ 
             type: "POST",
              url: "/signup", 
              data: {"name":name,"email":email,"password":password, "id":id},
              success:function(data){
                 /*if(count!=0){
                    alert("email is already exist");
                 }else{
                    $("input.check-email").html(data);
                 }*/
              }
       });      
  });

  
  $("input.check-email").on("keyup", function() {
     var email=$("input.check-email").val();
    if ($(this).hasClass("invalid")) {
      addValidation($(this), emailCheck);  
    } else {
      $(this).on("change", function() {
        addValidation($(this), emailCheck);
      })
    }
    
/*    $.ajax({ 
        url: "/emailcheck", 
        type: "POST",
        data: {"email" : email},
        dataType:"text",
        success: function(data){
           if(count!=0){
              alert("email is already exist");
           }else{
              $("input.check-email").html(data);
           }
        }
       });*/

  });
  
  
  

  function emailCheck(email) {
    var emailRegEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return emailRegEx.test(email);
  }
 

}());
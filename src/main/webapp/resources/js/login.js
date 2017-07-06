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

  $("input.check-email").on("keyup", function() {
     var email=$("input.check-email").val();
    if ($(this).hasClass("invalid")) {
      addValidation($(this), emailCheck);  
    } else {
      $(this).on("change", function() {
        addValidation($(this), emailCheck);
      })
    }
    
    $.ajax({ 
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
 });

  });
  
  //email 餓λ쵎�궗筌ｋ똾寃�
  /*function chkEmail(){
       var chk=false;
       if( $("input.check-email").val() != ""){
           var email=$("input.check-email").val();
           $.ajax({ 
                  url: "login.do", 
                  type: "POST",
                  data: {"email" : email},
                  dataType:"text",
                  cache: false,
                  success: function(data){
                      if(data) {
                          console.log("The email is duplicated.");
                          
                      }else{
                         console.log("The email is available.");
                           $("input.check-email").html(data); //占쎈퉸占쎈뼣 占쎄땀占쎌뒠占쎌뱽 癰귣똻肉т빳占쏙옙�뼄
                      }
                  }
           });
       }
   }*/

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
  
 
  $("input.check-password").on("keyup", function() {
     var pwd=$("input.check-password").val();
     console.log(pwd);
     $("input.check-equal").on("keyup",function(){
        var pwd2=$("input.check-equal").val();
        console.log(pwd2);
        
        if(pwd2==pwd){
           console.log("鍮꾨�踰덊샇媛� 媛숈뒿�땲�떎");
         
        }else{
           console.log("鍮꾨�踰덊샇媛� �떎由낅땲�떎");
        }
        });
     });


      
  $(".btn.signup ").click(function(){

    
     var name=$("input.name").val();
     var email=$("input.check-email").val();
     var password=$("input.check-password").val();
     var pwd2=$("input.check-equal").val();
     //console.log(name);
     //console.log(email);
     //console.log(password);
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
       if(pwd2.trim()=="")
      {
         $("input.check-equal").focus();
         return;
      }
     
       
       $.ajax({ 
             type: "POST",
              url: "/signup22222", 
              data: {"name":name,"email":email,"password":password},
              success:function(data){
                 /*if(count!=0){
                    alert("email is already exist");
                 }else{
                    $("input.check-email").html(data);
                 }*/
              }
       });
   
     $(".login-wrap").removeClass("hide");
      $(".signup-wrap").addClass("hide");
      
      
      
      
  });
  
  $(".btn.login ").click(function(){
     var email=$("input.check-email").val();
     var pwd=$("input.check-password").val();
     if(email.trim()=="")
      {
         $("input.check-email").focus();
         return;
      }
     else if(pwd.trim()=="")
      {
         $("input.check-password").focus();
         return;
      }
     
     console.log("濡쒓렇�씤 �릺�뿀�뒿�땲�떎.");
     $(".login-wrap").addClass("hide");
   
     
     
   /*  $(".nav social-nav pull-right hidden-sm-down").addClass("hide");
     $("input.user").show();*/
  });
  

  function emailCheck(email) {
    var emailRegEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return emailRegEx.test(email);
  }

}());
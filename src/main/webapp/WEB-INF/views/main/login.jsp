<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="resources/css/style2.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
 <link rel='stylesheet prefetch' href='resources/css/anaeyg.css'>
  <link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
<div id="id01" class="modal fade" role="dialog" >

  <div class="modal-dialog">
  <div class="modal-content">
	  <div class="absolute-wrap-signup">
	  <div class="signup-wrap hide">
	    <form action="post" id="sign_form">
	      <div class="row">
	        <div class="col-12">
	          <h1 class="hide-fade">Sign Up</h1>
	        </div>
	      </div>
	      <div class="row">
	        <div class="col-12">
   			<button type="button" class="close" data-dismiss="modal">&times;</button>
	          <div class="input-group hide-down">
	            <input type="text" class="name" required/>
	            <span class="valid-icon"></span>
	            <label for="name">Name</label>
	            <span class="bottom-border"></span>
	          </div>
	          <div class="input-group">
	            <input type="email" class="check-email" required/>
	            <span class="valid-icon"></span>
	            <label for="email">Email</label>
	            <span class="bottom-border"></span>
	          </div>
	          <div class="input-group">
	            <input type="password" class="check-password" required/>
	            <span class="invalid-icon"></span>
	            <label for="password">Password</label>
	            <span class="bottom-border"></span>
	          </div>
	          <div class="input-group hide-up">
	            <input type="password" class="check-equal" required/>
	            <span class="valid-icon"></span>
	            <label for="password">Verify Password</label>
	            <span class="bottom-border"></span>
	          </div>
	        </div>
	      </div>
	      <div class="row login-footer">
	        <div class="col-7">
	          <a href="#" class="btn signup">Sign Up</a>
	        </div>
	        <div class="col-5">
	          <a class="btn btn-pink hide-signup-btn" id="show-signup" href="#">Login</a>
	        </div>
	      </div>
	    </form>
	  </div>
	  </div>
	  </div>
	</div>
	
	<div class="login-wrap">
	  <form action="post" id="login-form">
	    <div class="row">
	      <div class="col-12">
	        <h1 class="hide-fade delay-6">Login</h1>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-12">
	        <div class="input-group" id="loginemail">
	          <input type="email"  class="check-email" required/>
	          <span class="valid-icon"></span>
	          <label for="email">Email</label>
	          <span class="bottom-border"></span>
	        </div>
	        <div class="input-group">
	          <input type="password" class="check-password" required/>
	          <span class="valid-icon"></span>
	          <label for="password">Password</label>
	          <span class="bottom-border"></span>
	        </div>
	      </div>
	    </div>
	    <div class="row login-footer">
	      <div class="col-7">
	        <a href="#" class="btn login">Login</a>
	      </div>
	      <div class="col-5">
	        <a class="btn btn-pink show-signup-btn" href="#">Sign Up</a>
	      </div>
	    </div>
	    <div class="row login-footer">
	      <div class="col-12 hide-fade delay-7">
	        <a class="forgot" href="#">Forgot Password?</a>
	      </div>
	    </div>
	  </form>
	</div>
  </div>
  

</body>

</html>

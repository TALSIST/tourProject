<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="resources/css/style2.css">
</head>
<body>

<div class="login" id="id01">
  <div class="login-screen">
  <button type="button" class="close" 
 onclick="document.getElementById('id01').style.display='none'" >&times;</button>
   <div class="app-title">
     <h1>Login</h1>
   </div>
 	<div class="login-form">
  <div class="control-group">
	<input type="text" class="login-field" value="" placeholder="username" id="login-name"> 
	<label class="login-field-icon fui-user" for="login-name"></label>
  </div>
  <div class="control-group">
	<input type="password" class="login-field" value="" placeholder="password" id="login-pass"> 
	<label class="login-field-icon fui-lock" for="login-pass"></label>
  </div>
	<a class="btn btn-primary btn-large btn-block" href="#">login</a> 
	
	<a class="login-link" href="#">Lost your password?</a>
  </div>
 </div>
</div>
</body>

</html>

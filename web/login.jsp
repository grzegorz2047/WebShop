
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
function validate(){
var username=document.form.user.value;
var password=document.form.pass.value;
if(username==""){
 alert("Enter Username!");
  return false;
}
if(password==""){
 alert("Enter Password!");
  return false;
}
return true;
}
</script>
<div align="center">
 <div class='cssmenu'>
<ul>
   <li class='active '><a href='index.jsp'><span>Home</span></a></li>
   <li><a href='login.jsp'><span>Login</span></a></li>
   <li><a href='index.jsp'><span>About</span></a></li>
   <li><a href='#'><span>Contact</span></a></li>
</ul>
</div>
<form name="form" method="post" action="check.jsp" onsubmit="javascript:return validate();">
    
<div align="center">
<h1>ADMIN LOGIN</h1>
<table>
<tr><td bgcolor="#FF9900">Username:</td><td bgcolor="#33CCCC"><input type="text" name="user"></td></tr>
<tr><td bgcolor="#FF9900">Password:</td><td bgcolor="#33CCCC"><input type="password" name="pass"></td></tr>
<tr><td></td><td><input type="submit" value="Submit"></td></tr>
</table>
</div>
</form>
</html>
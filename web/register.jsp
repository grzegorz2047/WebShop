<%-- 
    Document   : register
    Created on : 2014-06-13, 08:51:02
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
        function validate(){
            var name=document.register.name.value;
            var lastname=document.register.lastname.value;
            var address=document.register.address.value;
            var password=document.register.password.value;
            var email = document.register.email.value;
            var nickname = document.register.nickname.value;
        if(name==""){
            alert("Wpisz imie!");
            return false;
        }
        if(lastname==""){
            alert("Wpisz nazwisko!");
            return false;
        }
        if(address==""){
            alert("Wpisz adres zamieszkania!");
            return false;
        }
        if(email==""){
            alert("Wpisz adres email");
            return false;
        }
        if(nickname==""){
            alert("Wpisz ksywke!");
            return false;
        }
        if(password==""){
            alert("Wpisz haslo!");
            return false;
        }
        return true;
        }
    </script>
    <head>
        <link href="menustuff/styles/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rejestracja użytkownika</title>
    </head>
    <body>
        <form class="form-horizontal" name="register" method="post" action="RegisterServlet" onsubmit="javascript:return validate();"  >
            <!-- method="post" action="check.jsp" -->
          <fieldset>
            <legend>Rejestracja</legend>
            <div class="form-group">
              <label for="inputName" class="col-lg-2 control-label">Imie</label>
              <div class="col-lg-10">
                <input name="name" type="text" class="form-control" id="inputName" placeholder="Imie">
              </div>
            </div>
            <div class="form-group">
              <label for="inputLastname" class="col-lg-2 control-label">Nazwisko</label>
              <div class="col-lg-10">
                <input name="lastname" type="text" class="form-control" id="inputLastname" placeholder="Nazwisko">
              </div>
            </div>
            <div class="form-group">
              <label for="inputAddress" class="col-lg-2 control-label">Adres zamieszkania</label>
              <div class="col-lg-10">
                <input name="address" type="text" class="form-control" id="inputAddress" placeholder="Adres zamieszkania">
              </div>
            </div>
            <div class="form-group">
              <label for="inputEmail" class="col-lg-2 control-label">Email</label>
              <div class="col-lg-10">
                <input name="email" type="text" class="form-control" id="inputEmail" placeholder="Email">
              </div>
            </div>
            <div class="form-group">
              <label for="inputNickname" class="col-lg-2 control-label">Nick</label>
              <div class="col-lg-10">
                <input name="nickname" type="text" class="form-control" id="inputNickname" placeholder="Nick">
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassword" class="col-lg-2 control-label">Password</label>
              <div class="col-lg-10">
                <input name="password" type="password" class="form-control" id="inputPassword" placeholder="Password">
              </div>
            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
          </fieldset>
        </form>
    </body>
</html>

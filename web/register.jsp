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
            var username = document.register.username.value;
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
        if(email=="" || indexOf('@') === -1){
            alert("Wpisz  poprawny adres email");
            return false;
        }
        if(username==""){
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
        <div class="navbar navbar-default">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">Sklep internetowy</a>
          </div>
          <div class="navbar-collapse collapse navbar-responsive-collapse">
            <ul class="nav navbar-nav">
              <li><a href="register.jsp">Rejestracja</a></li>
              <li><a href="login.jsp">Logowanie</a></li>
              <li><a href="contact.jsp">Kontakt</a></li>
              <li><a href="activate.jsp">Aktywacja konta</a></li>
            </ul>
          </div>
        </div>
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
              <label for="inputUsername" class="col-lg-2 control-label">Nick</label>
              <div class="col-lg-10">
                <input name="username" type="text" class="form-control" id="inputUsername" placeholder="Nick">
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

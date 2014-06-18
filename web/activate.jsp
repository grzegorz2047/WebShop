<%-- 
    Document   : activate
    Created on : 2014-06-18, 09:23:57
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
        function validate(){
            var email = document.activate.email.value;
            var token = document.activate.token.value;
        if(email==""){
            alert("Wpisz email!");
            return false;
        }
        if(token==""){
            alert("Wpisz token!");
            return false;
        }
        return true;
        }
    </script>
    <head>
        <link href="menustuff/styles/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aktywacja konta</title>
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
        <h1>Wpisz swój email oraz otrzymany token</h1>
        <form class="form-horizontal" name="activate" method="post" action="ActivateServlet" onsubmit="javascript:return validate();">
          <fieldset>
            <div class="form-group">
              <label for="inputEmail" class="col-lg-2 control-label">Email</label>
              <div class="col-lg-10">
                <input name="email" type="text" class="form-control" id="inputEmail" placeholder="Email">
              </div>
            </div>
            <div class="form-group">
              <label for="inputToken" class="col-lg-2 control-label">Token</label>
              <div class="col-lg-10">
                <input name="token" type="token" class="form-control" id="inputToken" placeholder="Token">
              </div>
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


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <link href="menustuff/styles/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <script>
            function validate(){
            var username=document.login.email.value;
            var password=document.login.password.value;
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
        <form class="form-horizontal" name="login" method="post" action="ActivateServlet" onsubmit="javascript:return validate();">
          <fieldset>
            <div class="form-group">
              <label for="inputEmail" class="col-lg-2 control-label">Email</label>
              <div class="col-lg-10">
                <input name="email" type="text" class="form-control" id="inputEmail" placeholder="Email">
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassword" class="col-lg-2 control-label">Password</label>
              <div class="col-lg-10">
                <input name="password" type="password" class="form-control" id="inputPassword" placeholder="Password">
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
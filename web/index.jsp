<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%
    String site = "http://localhost:8080/WebShop/";
    String login = "dbuser";
    String password = "pcss";
    String database = "webshop";
    String port = "5432";
    Connection conn = null;

    Class.forName("org.postgresql.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:postgresql://5.231.53.149:"+port+"/"+database,login, password);

    PreparedStatement psSelectRecord=null;
    ResultSet rsSelectRecord=null;
    String sqlSelectRecord=null;

    sqlSelectRecord ="SELECT productid, title, description, price FROM products";
    psSelectRecord = conn.prepareStatement(sqlSelectRecord);
    rsSelectRecord = psSelectRecord.executeQuery();
%>
<html>
<head>

<link href="menustuff/styles/bootstrap.min.css" rel="stylesheet">
<title>Sklep - Strona główna</title>
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
 <div align="center">
     <h1>Dostępne produkty</h1>
 <table class="table table-striped table-hover ">
 <tr>
   <td  bgcolor="#33CCCC">Lp.</td>
   <td  bgcolor="#33CCCC">Id produktu</td>
   <td  bgcolor="#33CCCC">Nazwa produktu</td>
   <td  bgcolor="#33CCCC">Opis</td>
   <td  bgcolor="#33CCCC">Cena</td> 
   <td  bgcolor="#33CCCC">Dodaj do koszyka</td> 
   </tr>
  <%
  int cnt=1;
  while(rsSelectRecord.next())
  {
  %>
   <tr>
   <td bgcolor="#FF9900"><%=cnt%></td>
   <td><%=rsSelectRecord.getInt("productid")%></td>
   <td><%=rsSelectRecord.getString("title")%></td>
   <td><%=rsSelectRecord.getString("description")%></td>
   <td><%=rsSelectRecord.getString("price")%></td> 
   <td><b><span lang="pl-pl"><a name="add" id="add" href="buy.jsp" onclick='displayMsg();'>DODAJ</a></span></b></td>
   <tr>
  <br>
  <%
   cnt++;   /// increment of counter
  } /// End of while loop
  %>
  </table>
 </div>
  <div class="alert alert-dismissable alert-warning">
  <button type="button" class="close" data-dismiss="alert">×</button>
  <h4>Uwaga!</h4>
  <p>Strona uzywa plików cookies, aby zapewnic działanie różnych funkcji na stronie. <a href="http://wszystkoociasteczkach.pl/" class="alert-link">Wiecej informacji o ciasteczkach tutaj</a>.</p>
</div>
<script>
function displayMsg() {
    alert("Dodano do koszyka!");
}
</script>
</body>
</html>
<%
    try{
        //while(rsSelectRecord.next())
        //{
        //    System.out.println(" "+rsSelectRecord.getInt("productid")+" ");
        //}
        if(psSelectRecord!=null){
          psSelectRecord.close();
        }
        if(rsSelectRecord!=null){
          rsSelectRecord.close();
        }


        if(conn!=null)
        {
         conn.close();
        }
    }
    catch(Exception e){
        e.printStackTrace(); 
    }
%>

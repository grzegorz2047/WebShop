<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%
    Connection conn = null;

    Class.forName("org.postgresql.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:postgresql://5.231.53.149:5432/webshop","root","root");

    PreparedStatement psSelectRecord=null;
    ResultSet rsSelectRecord=null;
    String sqlSelectRecord=null;

    sqlSelectRecord ="SELECT productid, title, description, price FROM Products";
    psSelectRecord = conn.prepareStatement(sqlSelectRecord);
    rsSelectRecord = psSelectRecord.executeQuery();
%>
<html>
<head>

<link href="menustuff/styles/bootstrap.min.css" rel="stylesheet">
<title>Sklep - Strona główna</title>
</head>
<body>

 <div align="center">
 <div class='cssmenu'>
<ul>
   <li class='active '><a href='index.jsp'><span>Strona główna</span></a></li>
   <li><a href='login.jsp'><span>Login</span></a></li>
   <li><a href='index.jsp'><span>O stronie</span></a></li>
   <li><a href='contact.jsp'><span>Kontakt</span></a></li>
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
   <td><b><span lang="pl-pl"><a href="buy.jsp" onclick='displayMsg();'>DODAJ</a></span></b></td>
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
  <p>Strona uzywa plików cookies, aby zapewnic funkcjonowanie pewnych możliwości na stronie. <a href="http://wszystkoociasteczkach.pl/" class="alert-link">Wiecej informacji tutaj</a>.</p>
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
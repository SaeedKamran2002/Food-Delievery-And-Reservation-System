<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.* , java.text.SimpleDateFormat, java.util.Date , java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="style.css">
</head>
<body>
<header>
<br><br>

<h1 align="center">CUSTOMER DETAILS</h1>

<br><br>
</header>
<br><br><br><br>
<table align="center">
<tr >
<th>CUSTOMER ID</th>
<th>FIRST NAME</th>
<th>LAST NAME</th>
<th>CONTACT NUMBER</th>
<th>EMAIL ID</th>
</tr>

<%

final String url = "jdbc:mysql:///scdproject";
final String user = "root";
final String password = "fast123";
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, password);

Statement st = con.createStatement();

String query = "SELECT * FROM CUSTOMER_DETAILS";
ResultSet rs = st.executeQuery(query); 


while (rs.next()) 
{ 
   out.println("<tr><td>" + rs.getInt("CUSTOMER_ID") + "</td><td>" + rs.getString("FIRST_NAME")  + "</td><td> " + rs.getString("LAST_NAME")  + "</td><td>" + rs.getString("PHONE_NO")  + "</td><td>" + rs.getString("EMAIL") + "</td><td>");
}
/*

String query2 = "SELECT CUSTOMER_ID FROM CUSTOMERS";
ResultSet rs2 = st.executeQuery(query2); 
ResultSet rs3;
while (rs2.next()) 
{ 
	int i = rs2.getInt("CUSTOMER_ID");
	rs3 = st.executeQuery("Select custOrders("+rs2.getInt("CUSTOMER_ID")+") from orders;");
    out.println("<tr><td>" + rs3.getInt("custOrder("+i+")") + "</td><td>" );
    //out.println(st.executeQuery("Select custOrders("+rs2.getInt("CUSTOMER_ID")+") from orders;"));
} 
*/

rs.close();
st.close();
con.close();
%>
</body>
</html>
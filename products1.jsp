<%@ page import= "java.sql.* , java.text.SimpleDateFormat, java.util.Date" %>
<html>
<head>

<%
final String url = "jdbc:mysql:///scdproject";
final String user = "root";
final String password = "fast123";
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, password);

if (con == null) 
{
   System.out.println("JDBC connection is not established");
   return;
} 
else
	System.out.println("Congratulations," + " JDBC connection is established successfully.\n");

Statement st = con.createStatement();

String name = request.getParameter("productName");
String qty = request.getParameter("qty");
double price=Double.parseDouble(request.getParameter("price"));

/*SimpleDateFormat d = new SimpleDateFormat("dd/MM/yyyy");
Date dt=d.parse(date);*/

int i = st.executeUpdate("Insert INTO food_items (item_name , item_description , item_price) values ('"+name+"','"+qty+"','"+price+"')");

System.out.println("Row added successfully");
st.close();
con.close();

response.sendRedirect("products.jsp");

%>



</body>
</html>
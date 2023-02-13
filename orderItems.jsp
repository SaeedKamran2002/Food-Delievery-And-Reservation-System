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

int b = Integer.parseInt(request.getParameter("item_id_cart"));
int a = Integer.parseInt(request.getParameter("qty"));


int i = st.executeUpdate("Insert INTO cart (ITEM_ID , Qty) values ('"+b+"','"+a+"')");

System.out.println("Row added successfully");
st.close();
con.close();

response.sendRedirect("place_order.jsp");

%>



</body>
</html>
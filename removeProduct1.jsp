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

int id = Integer.parseInt(request.getParameter("productId"));


int i = st.executeUpdate("DELETE FROM food_items WHERE item_id =" + id);

System.out.println("Row Deleted successfully");
st.close();
con.close();

response.sendRedirect("removeProduct.jsp");

%>



</body>
</html>
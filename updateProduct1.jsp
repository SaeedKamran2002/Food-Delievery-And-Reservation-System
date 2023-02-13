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


int id = Integer.parseInt(request.getParameter("productId"));
String name = request.getParameter("productName");
String qty = request.getParameter("qty");
double price=Double.parseDouble(request.getParameter("price"));

String q = "UPDATE food_items SET item_id=? , item_name = ? , item_price = ?, item_description = ?  WHERE item_id =" +id ;

PreparedStatement st = con.prepareStatement(q);

st.setInt(1, id);
st.setString(2, name);
st.setDouble(3, price);
st.setString(4, qty);

int count = st.executeUpdate();

System.out.println("Row Updated successfully");
st.close();
con.close();

response.sendRedirect("updateProduct.jsp");

%>



</body>
</html>
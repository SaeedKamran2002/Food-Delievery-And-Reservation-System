<%@ page import= "java.sql.* , java.text.SimpleDateFormat, java.util.Date" %>
<html>
<head>
<link rel="stylesheet" href="style.css">
</head>
<body>

<header>
 		
        <nav class="navbar">
            <ul>
            	<li><a href="admin.html">Admin Home</a></li>
                <li><a href="products.jsp">Add Products</a></li>
                <li><a href="removeProduct.jsp">Remove Product</a></li>
                <li><a href="updateProduct.jsp">Update Product</a></li>
            </ul>
        </nav>
</header>
		
		<br><br><br><br><br><br><br><br>
		
 <form action = "products1.jsp" >
		
		Enter Product Name: <input type = "text" name = "productName" pattern="^[a-zA-Z\s]+$" required> <br><br>
		Enter Product Description: <input type = "text" name = "qty" required> <br><br>
		Enter Product Price: <input type = "number" name = "price" step="any" min = "0" required> <br><br>
		
		<input type = "submit" , name= "add_btn" , value = "Add Product"> 
		<input type="reset" value="Reset"/>
		
</form>

<table align="center">

<tr >
<th>Item ID</th>
<th>Item Name</th>
<th>Price</th>
<th>Description</th>
</tr>

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


String query = "SELECT * FROM food_items ";

ResultSet rs = st.executeQuery(query); 


while (rs.next()) 
{ 
   out.println("<tr><td>" + rs.getInt("ITEM_ID") + "</td><td>" + rs.getString("ITEM_NAME")  + "</td><td> " + rs.getDouble("ITEM_PRICE")  + "</td><td>"  + rs.getString("ITEM_DESCRIPTION") + "</td></tr>");
}

rs.close();
st.close();
con.close();

%>

</table>

</body>
</html>
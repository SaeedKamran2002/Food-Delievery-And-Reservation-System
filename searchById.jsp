<%@ page import= "java.sql.* , java.text.SimpleDateFormat, java.util.Date , java.io.PrintWriter" %>
<html>
<head>
 <link rel="stylesheet" href="style.css">
</head>
<body>

<header>

        <nav class="navbar">
            <ul>
            
            	<li><a href="admin.html">Home</a></li>
                <li><a href="products.jsp">Products</a></li>
                <li><a href="orderDetails.jsp">View Order Details</a></li>
                <li><a href="reservations.jsp">Approve Reservations</a></li>
                
            </ul>
        </nav>
</header>

<br><br>

<h1 align="center">Order Details</h1>

<br><br>

<form action = "searchById.jsp">
<input type = "number" name = "order_id" placeholder="Enter ID" min = "1" required >
<input type="submit" name="mysubmit" value="Search" ></input>
</form>



<br><br><br><br><br><br>

<table align="center">

<tr >
<th>Order ID</th>
<th>Order Date</th>
<th>Order Status</th>
<th>Customer Id</th>
<th>Payment Id</th>
<th>Payment Method</th>
<th>Order Price</th>
</tr>

<%
final String url = "jdbc:mysql:///scdproject";
final String user = "root";
final String password = "fast123";
Class.forName("com.mysql.cj.jdbc.Driver");
int id = Integer.parseInt(request.getParameter("order_id"));
int totalPrice = 0 ;

Connection con = DriverManager.getConnection(url, user, password);

if (con == null) 
{
   System.out.println("JDBC connection is not established");
   return;
} 
else
	System.out.println("Congratulations," + " JDBC connection is established successfully.\n");

Statement st = con.createStatement();


String query = "SELECT o.ORDER_ID, ORDER_DATE, STATUS, p.CUSTOMER_ID , p.PAYMENT_ID , p.PAYMENT_METHOD , p.BILL FROM orders o , payments p  Where o.ORDER_ID = p.ORDER_ID AND o.ORDER_ID = " + id;

ResultSet rs = st.executeQuery(query); 


while (rs.next()) 
{ 
   out.println("<tr><td>" + rs.getInt("ORDER_ID") + "</td><td>" + rs.getString("ORDER_DATE")  + "</td><td> " + rs.getString("STATUS")  + "</td><td>" + rs.getInt("CUSTOMER_ID") + "</td><td>"  + rs.getInt("PAYMENT_ID") + "</td><td>" + rs.getString("PAYMENT_METHOD") + "</td><td>" + rs.getInt("BILL") + "</td></tr>" );
	totalPrice += rs.getInt("BILL") ; 
}

rs.close();
st.close();
con.close();

out.println("<h3>Total Sales Are of : " + totalPrice + "</h3>");
%>

</body>
</html>
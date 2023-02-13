<%@ page import= "java.sql.* , java.text.SimpleDateFormat, java.util.Date" %>
<html>
<body>
<head>
 <link rel="stylesheet" href="style.css">
</head>
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

<h1 align="center">Approve Reservations</h1>

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


String query = "SELECT * FROM RESERVATION ";

ResultSet rs = st.executeQuery(query); 
String email;
int id;


while (rs.next()) 
{ 	
   out.println(rs.getInt("RESERVATION_ID") + " | " + rs.getString("RESERVATION_NAME")  + " | " + rs.getString("RESERVATION_EMAIL")  + " | " + rs.getString("CONTACT_NO")  + " | " + rs.getString("RESERVATION_DATE") + " | " + rs.getString("RESERVATION_TIME"));
   id = rs.getInt("RESERVATION_ID");
   email = rs.getString("RESERVATION_EMAIL");
   session.setAttribute("res_mail", rs.getString("RESERVATION_EMAIL"));
   session.setAttribute("res_id", rs.getInt("RESERVATION_ID"));
   %>

   
   <button onclick="location.href = 'emailGenerator.jsp';" id="accept_btn">Accept</button>
   <button onclick="location.href = 'rejectReservation.jsp';" id="reject_btn">Reject</button>
   <br><br>
   <%	
}

rs.close();
st.close();
con.close();

%>


</body>
</html>
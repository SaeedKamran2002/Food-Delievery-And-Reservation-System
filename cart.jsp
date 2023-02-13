<%@ page import= "java.sql.* , java.text.SimpleDateFormat, java.util.Date" %>
<html>
<body>
<h1>Your CART</h1>

<%
final String url = "jdbc:mysql:///scdproject";
final String user = "root";
final String password = "fast123";
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, password);
Statement st = con.createStatement();
String query = "SELECT * FROM cart c, food_items f WHERE c.ITEM_ID = f.ITEM_ID ";
ResultSet rs = st.executeQuery(query); 

double bill = 0;
int tot_qty = 0;

%>
<ul>
<%
while (rs.next()) 
{ 
   out.println("<li><b>" + rs.getString("ITEM_NAME")  + "</b><br>" + rs.getDouble("ITEM_PRICE")  + "<br>"  + rs.getString("ITEM_DESCRIPTION") + "<br>"  + rs.getInt("Qty") +"</li>");
   bill += rs.getDouble("ITEM_PRICE") * rs.getInt("Qty");
   tot_qty += rs.getInt("Qty");  
}
out.println("</ul><h3><br> Your Total Bill Is : " + bill + "<br> Your Total Products Are : " + tot_qty + "</h3><br>");
%>


<button onclick="location.href = 'payment.jsp';" id="payment_btn">Proceed To Payment</button>
<%
session.setAttribute("tot_bill", bill);
rs.close();
st.close();
con.close();

%>
</body>
</html>
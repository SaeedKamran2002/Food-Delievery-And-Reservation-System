<%@ page import= "java.sql.* , java.text.SimpleDateFormat, java.util.Date" %>
<html>
<head>

<%
final String url = "jdbc:mysql:///scdproject";
final String user = "root";
final String password = "fast123";
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(url, user, password);
Statement st = con.createStatement();

SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
Date date = new Date();   
String strDate = formatter.format(date); 

String status = "confirmed";
String cid = (String) session.getAttribute("csid");

int i = st.executeUpdate("Insert INTO orders (CUSTOMER_ID, ORDER_DATE , STATUS) values ('"+cid+"','"+strDate+"','"+status+"')");

String query = "SELECT * FROM orders ";
ResultSet rs = st.executeQuery(query); 
int order_id =0;
String method = request.getParameter("method");

while (rs.next()) 
{ 
   order_id = rs.getInt("ORDER_ID");
}

//query = "SELECT * FROM cart";
//ResultSet rs1 = st.executeQuery(query); 

//while (rs1.next()) 
//{ 
	//st.executeUpdate("Insert INTO ordered_items (ITEM_ID , ORDER_ID , qty) values ('"+ rs1.getInt("ITEM_ID") +"','"+ order_id +"','" + rs1.getInt("Qty") + "')");
//}

double tot_bill = (double) session.getAttribute("tot_bill");

i = st.executeUpdate("Insert INTO payments (CUSTOMER_ID , ORDER_ID , PAYMENT_METHOD , BILL) values ('"+ cid +"','"+ order_id +"','" + method + "' , '" + tot_bill + "')");

i = st.executeUpdate("TRUNCATE TABLE cart");
rs.close();
System.out.println("Row added successfully");
st.close();
con.close();

response.sendRedirect("place_order.jsp");

%>
</body>
</html>
<%@ page
	import="java.sql.* , java.text.SimpleDateFormat, java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
<title>Document</title>
</head>
<body>

	<header class="text-gray-600 body-font">
		<div
			class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
			<a
				class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
				<svg xmlns="http://www.w3.org/2000/svg" fill="none"
					stroke="currentColor" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="2"
					class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full"
					viewBox="0 0 24 24">
              <path
						d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path>
            </svg> <span class="ml-3 text-xl">MOM's Kitchen</span>
			</a>
			<nav
				class="md:mr-auto md:ml-4 md:py-1 md:pl-4 md:border-l md:border-gray-400	flex flex-wrap items-center text-base justify-center">
				<a class="mr-5 hover:text-gray-900" href="index.html">Home</a> <a
					class="mr-5 hover:text-gray-900" href="about.html">About us</a> <a
					class="mr-5 hover:text-gray-900" href="place_order.jsp">Order</a> <a
					class="mr-5 hover:text-gray-900" href="reservation.jsp">Reservation</a>
			</nav>
			<a href="loginPage.jsp">
				<button type="submit"
					class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0">
					Login
					<svg fill="none" stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1"
						viewBox="0 0 24 24">
              <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
				</button>
			</a>
			
			<a href = "logout.jsp">
          <button type = "submit" class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0"> Logout
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
              <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
          </button>
          </a>
		</div>
	</header>
	<%
final String url = "jdbc:mysql:///scdproject";
final String user = "root";
final String password = "fast123";
Class.forName("com.mysql.cj.jdbc.Driver");

String i = (String) session.getAttribute("csid");
if(i == null)
{
	session.setAttribute("csid","-99");
}
System.out.println((String)session.getAttribute("csid"));
Connection con = DriverManager.getConnection(url, user, password);
if (con == null) 
{
   System.out.println("JDBC connection is not established");
   return;
} 
else
	System.out.println("Congratulations," + " JDBC connection is established successfully.\n");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM FOOD_ITEMS"); 

%>
	<ul>
		<%
while (rs.next()) 
{ 
   out.println("<li><b>" + rs.getString("ITEM_NAME")  + "</b><br>" + rs.getDouble("ITEM_PRICE")  + "<br>"  + rs.getString("ITEM_DESCRIPTION") + "</li>");
   int z = rs.getInt("ITEM_ID");
   
  	%>
		<form action="orderItems.jsp">
			Enter Quantity: <input type="number" name="qty" id="qty" min = "1"> <br>
			<br> <input type="hidden" name="item_id_cart" id="item_id_cart"
				value="<%=z%>"> <br>
			<br> <input type="submit" name="place" value="Add To Cart">
			<br>
			<br>

		</form>
		<% 
  	
    
   
}
%>
	</ul>
		<button onclick="location.href = 'cart.jsp';" id="add_to_cart_btn"
		, align="center" , color = "Blue" , font-size: 16px >Proceed To Checkout</button>
	<%
rs.close();
st.close();
con.close();

%>
</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.* , java.text.SimpleDateFormat, java.util.Date , java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
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
					class="mr-5 hover:text-gray-900" href="order.html">Order</a> <a
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
		</div>
	</header>
	<%
	final String url = "jdbc:mysql:///scdproject";
	final String user = "root";
	final String password = "fast123";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String name = request.getParameter("full_name");
	String email = request.getParameter("email");
	String phoneNo = request.getParameter("phoneNo");
	String noOfPersons = request.getParameter("persons");
	String time = request.getParameter("appt");
	String date = request.getParameter("date");
	
	Connection con = DriverManager.getConnection(url, user, password);
	
	Statement st = con.createStatement();
	
	//String query = "SELECT * FROM RESERVATION ";
	
	//ResultSet rs = st.executeQuery(query);
	
	int i = st.executeUpdate("INSERT INTO RESERVATION (RESERVATION_NAME, RESERVATION_EMAIL, CONTACT_NO, RESERVATION_DATE, RESERVATION_TIME) VALUES ('"+name+"','"+email+"','"+phoneNo+"','"+date+"','"+time+"')");
	//int count = 0;
	
	//while(rs.next())
	//count++;
	
	//String query2 = "Select TABLE_NO,TABLE_AVAILABILITY from scdproject.RESTAURANT_TABLES where TABLE_AVAILABILITY = 1 and TABLE_CAPACITY ="+noOfPersons+" ;";
	//ResultSet rs2 = st.executeQuery(query2);
	//int tableNo = rs2.getInt("TABLE_NO");
	//int flag = rs2.getInt("TABLE_AVAILABILITY");
	//if(flag == 1){
	//query = "Insert into scdproject.reservations values ("+count+","+1+","+tableNo+",'"+date+"','"+time+"');";
	//st.executeQuery(query);
	//}
	//rs.close();
	st.close();
	con.close();

	out.println("<h1>Thank you for your reservation," + name + " your request will be processed shortly</h1>");
%>
</body>
</html>
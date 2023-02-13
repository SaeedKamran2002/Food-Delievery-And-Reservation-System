<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.* , java.text.SimpleDateFormat, java.util.Date , java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
final String url = "jdbc:mysql:///scdproject";
final String user = "root";
final String password = "fast123";

Class.forName("com.mysql.cj.jdbc.Driver");

String fname = request.getParameter("first_name");
String lname = request.getParameter("last_name");
String email = request.getParameter("email");
String pass = request.getParameter("password");
String phoneNo = request.getParameter("phoneNo");
String l = "signUp.jsp";

Connection con = DriverManager.getConnection(url, user, password);

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("Select * from customers;");

while(rs.next())
{
	if(email.equals(rs.getString("EMAIL")))
	{
		RequestDispatcher dd=request.getRequestDispatcher(l);
		dd.forward(request, response);
	}
}

		int i = st.executeUpdate("INSERT INTO scdproject.customers (`PASSWORD`, `FIRST_NAME`, `LAST_NAME`, `PHONE_NO`, `EMAIL`, `POINTS`, `REGISTERED`) VALUES ( '"+pass+"', '"+fname+"', '"+lname+"', '"+phoneNo+"', '"+email+"', '0', '1');");
		out.println("<h1>Congratulations you have been registered\nUsername : "+email+"\nPassword : "+pass+"\nKindly remember your login credentials</h1>");
		
		st.close();
		con.close();
		rs.close();
	


%>
</body>
</html>
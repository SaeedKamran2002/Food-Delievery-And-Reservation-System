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
String name = request.getParameter("email");
String pass = request.getParameter("password");

final String url = "jdbc:mysql:///scdproject";

final String user = "root";
final String password = "fast123";

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(url, user, password);

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("Select * from customers;");
String k = "admin.html";
String l = "index.html";
String j = "loginPage.jsp";
int flag = 1;

if(name.equals("admin@gmail.com") && pass.equals("admin"))
{
	RequestDispatcher dd1=request.getRequestDispatcher(k);
	dd1.forward(request, response);
	}
else{
	while(rs.next()){
		if(name.equals(rs.getString("EMAIL")) && pass.equals(rs.getString("PASSWORD")))
		{
			flag = 0 ;
			session.setAttribute("csid",rs.getString("CUSTOMER_ID"));
			RequestDispatcher dd=request.getRequestDispatcher(l);
			dd.forward(request, response);
		}
	}
}

if(flag == 1)
{
	RequestDispatcher dd1=request.getRequestDispatcher(j);
	dd1.forward(request, response);	
}
st.close();
con.close();
rs.close();
%>
</body>
</html>
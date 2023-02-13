<%@ page import = "java.io.*,java.util.*,javax.mail.* , java.io.UnsupportedEncodingException"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import= "java.sql.* , java.text.SimpleDateFormat, java.util.Date" %>
<html>
<head>
 <link rel="stylesheet" href="style.css">
</head>
<body>

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


int id = (int) session.getAttribute("res_id");
String to = (String) session.getAttribute("res_mail");

int i = st.executeUpdate("DELETE FROM RESERVATION WHERE RESERVATION_ID =" + id);


System.out.println("Row Deleted successfully");
st.close();
con.close();

   
  
   String from = "db47saltgod@gmail.com";
   String pass = "CGaYW3O3P4JE@";
   String host = "smtp.gmail.com";

   Properties properties = System.getProperties();

   // Setup mail server
   properties.setProperty("mail.smtp.host", host);
   properties.setProperty("mail.smtp.user", from);
   properties.setProperty("mail.smtp.password", pass);
   properties.setProperty("mail.smtp.auth", "true"); 
   
   properties.put("mail.smtp.starttls.enable", "true");

   Session mailSession = Session.getInstance(properties , new javax.mail.Authenticator() 
	{ 
        protected PasswordAuthentication getPasswordAuthentication() 
        {
            return new PasswordAuthentication("db47saltgod@gmail.com","CGaYW3O3P4JE@");
        }
   }); 
   mailSession.setDebug(true);

   try {
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailSession);
      
      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));
      
      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      // Set Subject: header field
      message.setSubject("Reservation");
      
      // Now set the actual message
      message.setText("Sorry, we are fully booked ");
      
      // Send message
      Transport.send(message);
      System.out.println("Sent message successfully....");
      
   } catch (MessagingException mex) {
      mex.printStackTrace();
      System.out.println("Error: unable to send message....");
   }
   
   response.sendRedirect("reservations.jsp");
   
%>

</body>
</html>
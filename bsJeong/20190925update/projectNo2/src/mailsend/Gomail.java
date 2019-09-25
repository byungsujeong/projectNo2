package mailsend;

import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;

public class Gomail {

   public static void main(String[] args) {
      String host = "smtp.naver.com";
      final String user = "forvacation";
      final String password = "1q2w3e4r!";
      
      String to = "jeobsu@naver.com";
      
      Properties props = new Properties();
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.auth", "true");
      
      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
             return new PasswordAuthentication(user, password);
            }
           });

           // Compose the message
           try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Subject
            message.setSubject("[Subject] Java Mail Test!");
            
            // Text
            message.setText("http://localhost:8080/projectNo2/login.jsp");

            // send the message
            Transport.send(message);
            System.out.println("message sent successfully...");

           } catch (MessagingException e) {
            e.printStackTrace();
           }
         
         
      

   }

}
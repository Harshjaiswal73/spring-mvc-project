package kss.Eprogrammer.modules;

import java.util.Properties;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class Maler 
{
      private String MyEmailId="hj336802@gmail.com";
      private String MyAppPassword="llwe aarh htfg xuom";
      public boolean sendMyEmail(String SendTo,String Subject,String MessageBody)
      {
    	  try {
    		  //Step1 :
    		  
    		  Properties p=new Properties();
    		  p.put("mail.smtp.host","smtp.gmail.com");
    		  p.put("mail.smtp.port",465);
    		  p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
    		  p.put("mail.smtp.auth","true");
    		  // step 2: setting email and password 
    		  JavaMailSenderImpl jmi=new JavaMailSenderImpl();
    		  jmi.setJavaMailProperties(p);
    		  jmi.setUsername(MyEmailId);
    		  jmi.setPassword(MyAppPassword);
    		  MailSender ms=jmi;
    		  //step3: Setting mail message
    		  SimpleMailMessage smi=new SimpleMailMessage();
    		  smi.setTo(SendTo);
    		  smi.setSubject(Subject);
    		  smi.setText(MessageBody);
    		  smi.setFrom(MyEmailId);
    		  //step4:send email
    		  ms.send(smi);
    		  return true;
		} 
    	  catch (Exception e) {
			System.out.println("Error in mail Sending:"+e.getMessage());
			return false;
		}
      }
}

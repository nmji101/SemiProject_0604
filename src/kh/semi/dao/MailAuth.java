package kh.semi.dao;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{ 
	
	PasswordAuthentication pa;
	
	public MailAuth() {
		String mail_id ="nmji708@gmail.com";
		String mail_pw = "semi!@123";
		
		pa = new PasswordAuthentication(mail_id , mail_pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}

package kh.semi.dao;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailsend { 

	public String sendPwToMail(String emailParam)	{
		// 받는 사람 E-Mail 주소
		//String mail = emailParam;  // 받는 사람 email		

		try {

			Properties prop = System.getProperties();

			//prop.put("mail.transport.protocol", "smtp");
//			prop.put("mail.smtp.host", "smtp.gmail.com");
//			prop.put("mail.smtp.port", 587);
//			prop.put("mail.smtp.starttls.enable", "true");
//			prop.put("mail.smtp.tls.trust","smtp.gmail.com");
//			prop.put("mail.smtp.auth", "true");

			prop.put("mail.smtp.host", "smtp.gmail.com"); 
			prop.put("mail.smtp.port", "465"); 
			prop.put("mail.smtp.auth", "true"); 
			prop.put("mail.smtp.ssl.enable", "true");
			prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			prop.put("mail.debug", "true"); 




			Authenticator auth = new MailAuth();
			Session session = Session.getDefaultInstance(prop, auth);
			String pwParam = this.randomWord();

			MimeMessage message = new MimeMessage(session);
			//송신자
			message.setFrom(new InternetAddress("nmji708@gmail.com","Ggooldanji_server"));
			//수신자
			//**
			InternetAddress to = new InternetAddress(emailParam);

			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject("<꿀단지> 인증번호 입니다.", "UTF-8");	//메일제목
			//**
			message.setText("인증번호는 -> " + pwParam + "입니다.", "UTF-8");	//메일내용

			Transport.send(message);//전송
			return pwParam;

		}catch(Exception e) {
			e.printStackTrace();
			return "fail";	
		}	
	}
	//6글자의 랜덤글자 뽑아내기.(패스워드 찾기 할때 인증암호)
	public String randomWord(){
		String result = "";
		while(true) {
			int rand1 = (int)(Math.random() * 3 + 1); // 1,2,3
			if(rand1==1) {//0~9
				int rand2 = (int)(Math.random() * 10 + 48);
				result += (char)rand2;
			}else if(rand1==2) { //영어 대문자
				int rand2 = (int)(Math.random() * 26 + 65);
				result += (char)rand2;
			}else {//영어 소문자
				int rand2 = (int)(Math.random() * 26 + 97);
				result += (char)rand2;
			}
			if(result.length()==6) {
				break;
			}
		}
		return result;
	}

}

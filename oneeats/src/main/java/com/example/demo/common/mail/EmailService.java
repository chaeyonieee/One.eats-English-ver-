package com.example.demo.common.mail;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;


@Service
public class EmailService {
	private final JavaMailSender javaMailSender;
	
	@Autowired
	public EmailService(JavaMailSender javaMailSender) {
		super();
		this.javaMailSender = javaMailSender;
	}


	@Async
	public boolean sendMailReject() throws Exception{
		
		
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		
		simpleMailMessage.setTo();
		simpleMailMessage.setSubject("");
		simpleMailMessage.setFrom("");
		simpleMailMessage.setText("");
		
		try {
			javaMailSender.send(simpleMailMessage);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	
	public boolean sendMailMime() {
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			message.setSubject("");
			message.addRecipient(null, null);
			message.setText("");
			
			javaMailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
		
	}
}

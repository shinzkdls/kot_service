package com.kbstar.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Component
public class SendMailUtil {
    @Autowired
    JavaMailSender emailSender;
    @Value("${adminmail.id}")
    private String id;
    private MimeMessage createMessage(String to, String msg)throws Exception{

        MimeMessage message = emailSender.createMimeMessage();

        message.addRecipients(Message.RecipientType.TO, to);//보내는 대상
        message.setSubject("Kolly On the Table의 회원이 되신 것을 축하드립니다!");//제목

        String msgg="";
        msgg+= "<div style='margin:10px;'>";
        msgg+= "<img style='width : 600px; margin : 0; padding : 0;' src=\"https://postfiles.pstatic.net/MjAyMzA2MjBfMTEz/MDAxNjg3MjE4ODkxMzcw.TspkIyK5NmvaOSuZqEaliZj4-O4wQUYYaRKdLf0tBocg.74eYfrH1jjPb82ac2YYi5as7EFvscx1gxPxJSVTPZEog.PNG.jhs4132/1.png?type=w773\"/>";
        msgg+= "<img style='width : 600px; margin : 0; padding : 0;' src=\"https://postfiles.pstatic.net/MjAyMzA2MTlfMTkw/MDAxNjg3MTY0MzExNTEz.m0q67KzcDOe_8SWK5vpsD7GtpOdLg_4cEXQJFR_sx_Ug.-4uaeffv-jjS6bitrmEhwBXc6rIElDPwls6zCbw64Xcg.PNG.jhs4132/2.png?type=w773\"/><br/>";
        msgg+= "<a href=\"http://localhost\"><img style='width : 600px; margin : 0; padding : 0;' src=\"https://postfiles.pstatic.net/MjAyMzA2MTlfMTI0/MDAxNjg3MTY0MTk2Mzk5.OUv68h0fsNsGJX-oT5xuivI0c_qp4IuQFyHmvg9Poncg.bstwLBuhizAZrAga7xrxw3FycoxmmDVJRSb3CGqYT8cg.PNG.jhs4132/4.png?type=w773\"></a><br/>";
        msgg+= "<img style='width : 600px; margin : 0; padding : 0;' src=\"https://postfiles.pstatic.net/MjAyMzA2MjBfODIg/MDAxNjg3MjE4OTA0MTE5.vsIWrzmDilrr-RaVH7f7an1369cBrcZCveZ_ghoVY0Qg.icFb5VNElnpc3usw5CNryBrknaL_htYx824CYaPJXEog.PNG.jhs4132/4.png?type=w773\"/><br/>";
//        msgg+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
//        msgg+= "<h3 style='color:blue;'>"+msg+"</h3>";
//        msgg+= "</div>";

                message.setText(msgg, "utf-8", "html");//내용
        message.setFrom(new InternetAddress(id,"Kolly On the Table"));//보내는 사람

        return message;
    }
    public void sendSimpleMessage(String to, String msg)throws Exception {
        // TODO Auto-generated method stub
        MimeMessage message = createMessage(to,msg);
        try{//예외처리
            emailSender.send(message);
        }catch(MailException es){
            es.printStackTrace();
            throw new IllegalArgumentException();
        }
    }

    private MimeMessage createAuthMessage(String to, String msg)throws Exception{
        String ePw = createKey();
        MimeMessage message = emailSender.createMimeMessage();

        message.addRecipients(Message.RecipientType.TO, to);//보내는 대상
        message.setSubject("Kolly On the Table입니다.");//제목

        String msgg="";
        msgg+= "<div style='margin:100px;'>";
        msgg+= "<h1> 안녕하세요, Kolly On the Table입니다! </h1>";
        msgg+= "<br>";
        msgg+= "<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요<p>";
        msgg+= "<br>";
        msgg+= "<p>감사합니다!<p>";
        msgg+= "<br>";
        msgg+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
        msgg+= "<h3 style='color:blue;'>회원가입 코드입니다.</h3>";
        msgg+= "<div style='font-size:130%'>";
        msgg+= "CODE : <strong>";
        msgg+= ePw+"</strong><div><br/> ";
        msgg+= "</div>";
        message.setText(msgg, "utf-8", "html");//내용
        message.setFrom(new InternetAddress(id,"Kolly On the Table"));//보내는 사람

        return message;
    }

    public static String createKey() {
        StringBuffer key = new StringBuffer();
        Random rnd = new Random();

        for (int i = 0; i < 8; i++) { // 인증코드 8자리
            int index = rnd.nextInt(3); // 0~2 까지 랜덤

            switch (index) {
                case 0:
                    key.append((char) ((int) (rnd.nextInt(26)) + 97));
                    //  a~z  (ex. 1+97=98 => (char)98 = 'b')
                    break;
                case 1:
                    key.append((char) ((int) (rnd.nextInt(26)) + 65));
                    //  A~Z
                    break;
                case 2:
                    key.append((rnd.nextInt(10)));
                    // 0~9
                    break;
            }
        }

        return key.toString();
    }

    public void sendAuthMessage(String to, String msg)throws Exception {
        // TODO Auto-generated method stub
        MimeMessage message = createAuthMessage(to,msg);
        try{//예외처리
            emailSender.send(message);
        }catch(MailException es){
            es.printStackTrace();
            throw new IllegalArgumentException();
        }
    }
}


package com.recs.services.emailservice;

import com.recs.models.entities.account.Account;
import com.recs.repositories.account.AccountRepository;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService{

    private AccountRepository accountRepository;

    private JavaMailSender mailSender;

    @Value("${app.url}")
    private String appUrl;

    @Autowired
    public EmailServiceImpl(AccountRepository accountRepository, JavaMailSender mailSender) {
        this.accountRepository = accountRepository;
        this.mailSender = mailSender;
    }

    @Override
    public void sendNewAccountEmail(Account account) {
        String subject = "[RECS-NOTI] New Account";
        String text = "<html>" +
                "<body>" +
                "<p>Welcome to Real Estate Connector System</p>" +
                "<p>Here is your account information:</p>" +
                "<ul>" +
                "<li><b>Username:</b> " + account.getUsername() + "</li>" +
                "<li><b>Password:</b> " + account.getAccountPassword() + "</li>" +
                "<li><b>Role:</b> " + account.getRoleId() + "</li>" +
                "</ul>" +
                "</body>" +
                "</html>";
        sendEmail(account.getEmail(), subject, text);
    }

    @Override
    public void sendForgetPasswordMail(Account account) {
        String resetPath = appUrl + "login/reset?token="+account.getResetToken();
        String text = "</p>" +
                "<p>You have requested to reset your password.</p>" +
                "<p>Click the link below to change your password:</p>" +
                "<p><a href=\"" + resetPath + "\">Change my password</a></p>" +
                "<p>Ignore this email if you do remember your password, " +
                "or you have not made the request.</p>";
        sendEmail(account.getEmail(), "[RECS-NOTI] Reset Account Password", text);
    }

    private void sendEmail(String to, String subject, String text) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom("noreply@recs.com","Real Estate Connector System");
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text, true);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        mailSender.send(message);
    }


}

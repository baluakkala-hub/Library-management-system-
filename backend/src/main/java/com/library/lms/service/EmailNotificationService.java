package com.library.lms.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Slf4j
@Service
public class EmailNotificationService {

    @Autowired(required = false)
    private JavaMailSender mailSender;

    public void sendFineAssessedEmail(String recipientEmail, String studentName, BigDecimal amount, String reason) {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String subject = "🔔 Central Library Notice: Fine Assessed on Card Account";
        String body = String.format(
                """
                ======================================================================
                CENTRAL UNIVERSITY LIBRARY NOTIFICATION SYSTEM
                ======================================================================
                Dear %s,
                
                A library penalty fine has been assessed to your student cardholder account.
                
                • Fine Amount:     ₹%s (INR)
                • Violation / Reason: %s
                • Assessed On:     %s
                • Cardholder Email: %s
                • Status:          UNPAID
                
                Please clear your dues at the circulation desk or online via the Student Portal
                to prevent registration holds before semester end examinations.
                
                Chief Librarian Office
                Central University Library System
                Helpline: 0987654654 | LIBRARY@admin.com
                ======================================================================
                """,
                studentName, amount, reason, timestamp, recipientEmail
        );

        logEmailDelivery("FINE ASSESSMENT NOTICE", recipientEmail, subject, body);
        sendViaSmtpIfAvailable(recipientEmail, subject, body);
    }

    public void sendFineSettledEmail(String recipientEmail, String studentName, BigDecimal amount, String paymentMethod) {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String subject = "✅ Central Library: Fine Settlement Receipt";
        String body = String.format(
                """
                ======================================================================
                CENTRAL UNIVERSITY LIBRARY - OFFICIAL PAYMENT RECEIPT
                ======================================================================
                Dear %s,
                
                Thank you! Your outstanding fine has been successfully cleared and marked PAID.
                
                • Amount Paid:     ₹%s (INR)
                • Payment Method:  %s
                • Clearance Date:  %s
                • Account Status:  CLEARED (No Holds)
                
                Thank you for your cooperation with university library circulation policies.
                ======================================================================
                """,
                studentName, amount, paymentMethod, timestamp
        );

        logEmailDelivery("FINE PAYMENT RECEIPT", recipientEmail, subject, body);
        sendViaSmtpIfAvailable(recipientEmail, subject, body);
    }

    private void logEmailDelivery(String eventType, String recipient, String subject, String content) {
        log.info("\n📧 [EMAIL DISPATCHED - {}]\nTo: {}\nSubject: {}\n{}", eventType, recipient, subject, content);
    }

    private void sendViaSmtpIfAvailable(String to, String subject, String text) {
        if (mailSender != null) {
            try {
                SimpleMailMessage message = new SimpleMailMessage();
                message.setTo(to);
                message.setSubject(subject);
                message.setText(text);
                mailSender.send(message);
                log.info("Live SMTP email sent successfully to {}", to);
            } catch (Exception e) {
                log.warn("Live SMTP delivery skipped (operating in local demo mail mode): {}", e.getMessage());
            }
        }
    }
}

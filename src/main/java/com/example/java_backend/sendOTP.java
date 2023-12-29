package com.example.java_backend;

import java.io.*;
import java.util.Random;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "sendOTP", value = "/sendOTP")
public class sendOTP extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String otp = generateRandomOTP();

        // Store the OTP in the session
        HttpSession session = req.getSession();
        session.setAttribute("sentOTP", otp);

        //get user entered email address
        String recipientEmail = req.getParameter("emailForOTP");

        // Store the Email in the session
        session.setAttribute("userEmail", recipientEmail);

        //sending email
        try {
            sendEmail.emailConfiguration(recipientEmail, "Green Supermart Account Verification OTP", "Your OTP code for verification is:" + otp);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Forward the request back to verify.jsp
        RequestDispatcher dispatcher = req.getRequestDispatcher("/login/verify.jsp");
        dispatcher.forward(req, resp);
    }

    private String generateRandomOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000); // This generates a 6-digit random number between 100000 and 999999

        // Convert the OTP to a string
        return String.valueOf(otp);
    }
}
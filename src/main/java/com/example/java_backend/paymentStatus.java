package com.example.java_backend;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "paymentStatus", value = "/paymentStatus")
public class paymentStatus extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve the orderID parameter from the URL
        String orderID = req.getParameter("orderID");

        // Perform any necessary actions with the orderID, such as capturing payment
        // For simplicity, we'll just print it to the console in this example
        System.out.println("Order ID: " + orderID);

        // Redirect or display a confirmation page
        resp.sendRedirect("/Checkout/successnew.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Hello to the POST req from servlet");
    }
}
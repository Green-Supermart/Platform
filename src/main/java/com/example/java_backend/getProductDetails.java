package com.example.java_backend;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "getProductDetails", value = "/getProductDetails")
public class getProductDetails extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<product> products = new ArrayList<>();
        Connection connection = null;

        try {
            connection = dbConnection.getConnection();

            // Define your SQL query to retrieve product data from the database
            String query = "SELECT id, productName, category, originalPrice, discountPrice, stockStatus, quantity, sku, imgLink FROM products";

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("productName");
                String category = resultSet.getString("category");
                int orgPrice = resultSet.getInt("originalPrice");
                int discPrice = resultSet.getInt("discountPrice");
                String stockStatus = resultSet.getString("stockStatus");
                int quantity = resultSet.getInt("quantity");
                int sku = resultSet.getInt("sku");
                String image = resultSet.getString("imgLink");

                //adding product data to the product constructor which inside the product class
                //(The constructor itself initializes the private fields directly with the provided values.
                // You don't need to call the setters separately in this case because the constructor already sets the values for you)
                product obj = new product(id, name, category, orgPrice, discPrice, stockStatus, quantity, sku, image);
                products.add(obj);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    dbConnection.closeConnection(connection);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            // Convert products list to JSON
            String jsonProducts = objectMapper.writeValueAsString(products);
            // Set response content type to JSON
            resp.setContentType("application/json");

            // Write JSON data to the response
            resp.getWriter().write(jsonProducts);
            //System.out.println(jsonProducts);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Set an appropriate HTTP status code
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
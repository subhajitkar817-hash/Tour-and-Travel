package com.travel.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DBConnection;

@WebServlet("/addPackage")
public class AddPackageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String location = request.getParameter("location");
        String price = request.getParameter("price");
        String description = request.getParameter("description");


        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO packages(title, location, price,description) VALUES(?,?,?,?)"
            );

            ps.setString(1, title);
            ps.setString(2, location);
            ps.setString(3, price);
            ps.setString(4, description);

            ps.executeUpdate();

            response.getWriter().println("Package Added!");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
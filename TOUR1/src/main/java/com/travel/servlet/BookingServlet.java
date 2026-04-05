package com.travel.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DBConnection;

@WebServlet("/bookPackage")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int user_id = Integer.parseInt(request.getParameter("user_id"));
        int package_id = Integer.parseInt(request.getParameter("package_id"));
        String date = request.getParameter("date");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO bookings(user_id, package_id, date) VALUES(?,?,?)"
            );

            ps.setInt(1, user_id);
            ps.setInt(2, package_id);
            ps.setString(3, date);

            ps.executeUpdate();

            response.getWriter().println("Booking Successful!");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
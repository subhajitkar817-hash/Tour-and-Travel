package com.travel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;

@WebServlet("/book")
public class BookBusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null){
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("user");
        int busId = Integer.parseInt(request.getParameter("bus_id"));
        int seatsToBook = Integer.parseInt(request.getParameter("seats"));
        String date = request.getParameter("date");

        try {
            Connection con = DBConnection.getConnection();

            // 1. Check available seats
            PreparedStatement psCheck = con.prepareStatement(
                "SELECT seats - IFNULL((SELECT SUM(booked_seats) FROM bus_booking WHERE bus_id=?),0) AS available_seats " +
                "FROM transport_bus WHERE id=?"
            );
            psCheck.setInt(1, busId);
            psCheck.setInt(2, busId);
            ResultSet rsCheck = psCheck.executeQuery();

            if(rsCheck.next()){
                int availableSeats = rsCheck.getInt("available_seats");
                if(seatsToBook > availableSeats){
                    response.getWriter().println("Not enough seats available!");
                    return;
                }
            } else {
                response.getWriter().println("Bus not found!");
                return;
            }

            // 2. Insert booking
            PreparedStatement psInsert = con.prepareStatement(
                "INSERT INTO bus_booking(bus_id, user_id, booked_seats, booking_date) VALUES(?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS
            );
            psInsert.setInt(1, busId);
            psInsert.setInt(2, userId);
            psInsert.setInt(3, seatsToBook);
            psInsert.setString(4, date);

            int rows = psInsert.executeUpdate();
            if(rows > 0){
                ResultSet rsKeys = psInsert.getGeneratedKeys();
                if(rsKeys.next()){
                    int bookingId = rsKeys.getInt(1);

                    response.setContentType("text/html");
                    response.getWriter().println("<h2>Booking Confirmed!</h2>");
                    response.getWriter().println("<p>Booking ID: " + bookingId + "</p>");
                    response.getWriter().println("<p>Seats booked: " + seatsToBook + "</p>");
                }
            }

        } catch(Exception e){
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
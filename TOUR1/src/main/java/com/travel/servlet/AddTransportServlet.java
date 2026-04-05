package com.travel.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;


@WebServlet("/addTransport")
public class AddTransportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int agency_id = (int) request.getSession().getAttribute("agency");

        String bus = request.getParameter("bus_name");
        String type = request.getParameter("type");
        String seats = request.getParameter("seats");
        String price = request.getParameter("price");
        String package_id = request.getParameter("package_id");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO transport(agency_id,bus_name,type,seats,price,package_id) VALUES(?,?,?,?,?,?)"
            );

            ps.setInt(1, agency_id);
            ps.setString(2, bus);
            ps.setString(3, type);
            ps.setString(4, seats);
            ps.setString(5, price);
            ps.setString(6, package_id);

            ps.executeUpdate();

            response.sendRedirect("agency_home.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
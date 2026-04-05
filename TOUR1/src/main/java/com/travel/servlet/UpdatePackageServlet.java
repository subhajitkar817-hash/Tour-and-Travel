package com.travel.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DBConnection;

@WebServlet("/updatePackage")
public class UpdatePackageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String location = request.getParameter("location");
        String price = request.getParameter("price");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE packages SET title=?, location=?, price=? WHERE id=?"
            );

            ps.setString(1, title);
            ps.setString(2, location);
            ps.setString(3, price);
            ps.setInt(4, id);

            ps.executeUpdate();

            response.sendRedirect("viewpackage.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
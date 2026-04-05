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

@WebServlet("/agencyLogin")
public class AgencyLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM transport_agency WHERE email=? AND password=?"
            );
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("agency", rs.getInt("id"));
                session.setAttribute("agency_name", rs.getString("name"));
                response.sendRedirect("agency_home.jsp");
            } else {
                response.sendRedirect("agency_login.jsp?error=1");
            }

        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("agency_login.jsp?error=2");
        }
    }
}
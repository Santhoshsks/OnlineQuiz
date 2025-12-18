package com.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.quiz.util.DBConnector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user")
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 2621352181729361033L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String action   = request.getParameter("action"); // Register | Login

        try (Connection conn = DBConnector.getConnection()) {

            /* ================= REGISTER ================= */
            if ("Register".equals(action)) {

                PreparedStatement checkStmt =
                        conn.prepareStatement("SELECT id FROM user WHERE username=?");
                checkStmt.setString(1, username);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    response.sendRedirect(
                            request.getContextPath() +
                                    "/User/User.jsp?msg=User already exists, please login"
                    );
                    return;
                }

                PreparedStatement insertStmt =
                        conn.prepareStatement("INSERT INTO user(username,password) VALUES(?,?)");
                insertStmt.setString(1, username);
                insertStmt.setString(2, password);
                insertStmt.executeUpdate();

                response.sendRedirect(
                        request.getContextPath() +
                                "/User/User.jsp?msg=Registered successfully! Please login"
                );
                return;
            }

            /* ================= LOGIN ================= */
            if ("Login".equals(action)) {

                PreparedStatement stmt =
                        conn.prepareStatement(
                                "SELECT id, username FROM user WHERE username=? AND password=?"
                        );
                stmt.setString(1, username);
                stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    HttpSession session = request.getSession(true);

                    /* ✅ IMPORTANT SESSION ATTRIBUTES */
                    session.setAttribute("user", rs.getInt("id")); // role marker
                    session.setAttribute("username", rs.getString("username"));

                    response.sendRedirect(
                            request.getContextPath() + "/User/UserDashboard.jsp"
                    );
                } else {
                    response.sendRedirect(
                            request.getContextPath() +
                                    "/User/User.jsp?msg=Invalid username or password"
                    );
                }
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}

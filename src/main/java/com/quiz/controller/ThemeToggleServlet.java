package com.quiz.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/toggleTheme")
public class ThemeToggleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String theme = (String) session.getAttribute("theme");
        if (theme == null || theme.equals("light")) {
            session.setAttribute("theme", "dark");
        } else {
            session.setAttribute("theme", "light");
        }

        response.sendRedirect(request.getHeader("Referer"));
    }
}

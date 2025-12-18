package com.quiz.controller;

import com.quiz.dao.QuizDAO;
import com.quiz.dao.QuestionDAO;
import com.quiz.dao.AdminDao;
import com.quiz.model.Admin;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import java.io.IOException;


@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/AdminLogin.jsp");
            return;
        }
        Admin admin = (Admin) session.getAttribute("admin");

        QuizDAO quizDAO = new QuizDAO();
        QuestionDAO questionDAO = new QuestionDAO();
        AdminDao adminDAO = new AdminDao();

        int totalQuizzes = quizDAO.getTotalQuizCount();
        int totalQuestions = questionDAO.getTotalQuestionCount();
        int totalUsers = adminDAO.getTotalUserCount();

        request.setAttribute("totalQuizzes", totalQuizzes);
        request.setAttribute("totalQuestions", totalQuestions);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("admin", admin);

        request.getRequestDispatcher("/admin/AdminDashboard.jsp")
                .forward(request, response);
    }

}

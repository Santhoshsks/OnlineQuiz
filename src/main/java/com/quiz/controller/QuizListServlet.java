package com.quiz.controller;

import com.quiz.dao.QuizDAO;
import com.quiz.model.Quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/quiz-list")
public class QuizListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private QuizDAO dao = new QuizDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int currentPage = 1;
        int recordsPerPage = 5;

        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }

        int offset = (currentPage - 1) * recordsPerPage;

        List<Quiz> quizzes = dao.getQuizzesWithQuestions(offset, recordsPerPage);
        int totalRecords = dao.getTotalQuizCount();
        int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

        request.setAttribute("quizzes", quizzes);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("/admin/QuizList.jsp").forward(request, response);
    }
}

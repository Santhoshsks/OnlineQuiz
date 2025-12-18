package com.quiz.controller;

import com.quiz.dao.QuestionDAO;
import com.quiz.model.Question;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/QuestionListServlet")
public class QuestionListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. Initialize DAO
        QuestionDAO dao = new QuestionDAO();

        // 2. Fetch all questions from DB
        List<Question> questionList = null;
        try {
            questionList = dao.getAllQuestions();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching questions: " + e.getMessage());
        }

        // 3. Set the questions in request scope
        request.setAttribute("questionList", questionList);
        request.getRequestDispatcher("admin/QuestionList.jsp").forward(request, response);

    }
}

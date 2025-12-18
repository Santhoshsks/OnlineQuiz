<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.Admin" %>

<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "dashboard");

    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
    body {
        margin: 0;
        padding-top: 70px;
        font-family: "Inter", "Segoe UI", sans-serif;
        background: linear-gradient(135deg, #1f2933, #374151);
        color: #f9fafb;
    }

    /* Main content wrapper */
    .dashboard-content {
        padding: 40px 30px;
        text-align: center;
        transition: margin-left 0.3s ease;
    }

    .welcome {
        font-size: 26px;
        font-weight: 600;
        margin-bottom: 6px;
    }

    .subtitle {
        font-size: 14px;
        color: rgba(255,255,255,0.7);
        margin-bottom: 40px;
    }

    /* Stats cards */
    .card-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 25px;
        max-width: 900px;
        margin: auto;
    }

    .info-card {
        background: rgba(255,255,255,0.08);
        border-radius: 16px;
        padding: 30px 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.35);
        backdrop-filter: blur(14px);
        transition: transform 0.25s ease, box-shadow 0.25s ease;
    }

    .info-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 18px 40px rgba(0,0,0,0.5);
    }

    .info-card h3 {
        font-size: 15px;
        color: rgba(255,255,255,0.75);
        margin-bottom: 14px;
        letter-spacing: 0.5px;
    }

    .info-card p {
        font-size: 34px;
        font-weight: 700;
        color: #3b82f6;
        margin: 0;
    }
</style>
</head>

<body>

<div class="dashboard-content">

    <div class="welcome">
        Welcome, <strong><%= admin.getUsername() %></strong>
    </div>

    <div class="subtitle">
        Manage quizzes, questions and monitor platform activity
    </div>

    <div class="card-container">

        <div class="info-card">
            <h3>Total Quizzes</h3>
            <p><%= request.getAttribute("totalQuizzes") != null ? request.getAttribute("totalQuizzes") : "—" %></p>
        </div>

        <div class="info-card">
            <h3>Total Questions</h3>
            <p><%= request.getAttribute("totalQuestions") != null ? request.getAttribute("totalQuestions") : "—" %></p>
        </div>

        <div class="info-card">
            <h3>Total Users</h3>
            <p><%= request.getAttribute("totalUsers") != null ? request.getAttribute("totalUsers") : "—" %></p>
        </div>

    </div>


</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.Admin" %>

<%
    // Identify page context for navbar
    request.setAttribute("pageContext", "admin");

    // Session check
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>

<!-- Top Navbar -->
<jsp:include page="/common/navbar.jsp"/>

<!-- Admin Sidebar -->
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
    body {
        margin: 0;
        padding-top: 70px; /* navbar height */
        font-family: "Inter", "Segoe UI", sans-serif;
        background: linear-gradient(135deg, #1f2933, #374151);
        color: #f9fafb;
    }

    /* Main content */
    .dashboard-content {
        padding: 90px 30px 30px 30px;
        text-align: center;
        transition: margin-left 0.3s ease;
    }

    .welcome {
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 10px;
    }

    .subtitle {
        font-size: 15px;
        color: rgba(255,255,255,0.7);
        margin-bottom: 40px;
    }

    /* Info cards */
    .card-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 25px;
        max-width: 900px;
        margin: 0 auto;
    }

    .info-card {
        background: rgba(255,255,255,0.08);
        border-radius: 16px;
        padding: 30px 20px;
        box-shadow: 0 12px 25px rgba(0,0,0,0.35);
        backdrop-filter: blur(8px);
        transition: transform 0.25s ease, box-shadow 0.25s ease;
    }

    .info-card:hover {
        transform: translateY(-6px);
        box-shadow: 0 20px 40px rgba(0,0,0,0.5);
    }

    .info-card h3 {
        font-size: 18px;
        margin-bottom: 12px;
        color: #93c5fd;
    }

    .info-card p {
        font-size: 14px;
        color: #e5e7eb;
        line-height: 1.6;
    }
</style>
</head>

<body>

<!-- Dashboard Content -->
<div class="dashboard-content">

    <div class="welcome">
        Welcome, <strong><%= admin.getUsername() %></strong>
    </div>

    <div class="subtitle">
        Manage quizzes, questions and monitor platform performance
    </div>

    <div class="card-container">

        <div class="info-card">
            <h3>Quiz Management</h3>
            <p>Create, update, and organize quizzes with ease.</p>
        </div>

        <div class="info-card">
            <h3>Question Bank</h3>
            <p>Maintain questions, answers, and difficulty levels.</p>
        </div>

        <div class="info-card">
            <h3>Leaderboard</h3>
            <p>Track top performers and user progress.</p>
        </div>

    </div>
</div>

</body>
</html>

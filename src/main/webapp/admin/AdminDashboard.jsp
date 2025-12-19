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
/* =========================
   THEME VARIABLES
========================= */
:root {
    --bg: #f1f5f9;
    --text: #0f172a;
    --muted: #64748b;
    --card-bg: rgba(255,255,255,0.85);
    --card-border: rgba(0,0,0,0.08);
    --accent: #3b82f6;
    --shadow: 0 25px 50px rgba(0,0,0,0.12);
}

[data-theme="dark"] {
    --bg: #0f172a;
    --text: #f8fafc;
    --muted: rgba(255,255,255,0.65);
    --card-bg: rgba(255,255,255,0.08);
    --card-border: rgba(255,255,255,0.15);
    --accent: #60a5fa;
    --shadow: 0 35px 70px rgba(0,0,0,0.55);
}

/* =========================
   BASE
========================= */
body {
    margin: 0;
    padding-top: 70px;
    background: var(--bg);
    font-family: "Inter", "Segoe UI", sans-serif;
    color: var(--text);
}

/* =========================
   CONTENT
========================= */
.dashboard-content {
    padding: 45px 35px;
    margin-left: 260px;
}

/* =========================
   HEADER
========================= */
.welcome {
    font-size: 30px;
    font-weight: 700;
    margin-bottom: 6px;
}

.subtitle {
    font-size: 15px;
    color: var(--muted);
    margin-bottom: 50px;
}

/* =========================
   CARDS
========================= */
.card-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 40px;
    max-width: 1100px;
}

.info-card {
    position: relative;
    background: var(--card-bg);
    border: 1px solid var(--card-border);
    border-radius: 24px;
    padding: 42px 32px 38px;
    box-shadow: var(--shadow);
    backdrop-filter: blur(18px);
    transition: all 0.35s ease;
    overflow: hidden;
}

/* Accent bar */
.info-card::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    height: 6px;
    width: 100%;
    background: linear-gradient(90deg, var(--accent), #22c55e);
}

/* Hover */
.info-card:hover {
    transform: translateY(-12px) scale(1.03);
}

/* Icon */
.info-icon {
    width: 62px;
    height: 62px;
    border-radius: 16px;
    background: rgba(59,130,246,0.15);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 22px;
}

[data-theme="dark"] .info-icon {
    background: rgba(96,165,250,0.2);
}

.info-icon svg {
    width: 32px;
    height: 32px;
    stroke: var(--accent);
}

/* Title */
.info-card h3 {
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: var(--muted);
    margin-bottom: 16px;
}

/* Number */
.info-card p {
    font-size: 46px;
    font-weight: 800;
    color: var(--accent);
    margin: 0;
}
</style>
</head>

<body>

<div class="dashboard-content">

    <div class="welcome">
        Welcome, <%= admin.getUsername() %>
    </div>

    <div class="subtitle">
        Overview of quizzes, questions and platform usage
    </div>

    <div class="card-container">

        <!-- TOTAL QUIZZES -->
        <div class="info-card">
            <div class="info-icon">
                <svg viewBox="0 0 24 24" fill="none">
                    <path d="M4 5h16M4 10h16M4 15h10"
                          stroke-width="2" stroke-linecap="round"/>
                </svg>
            </div>
            <h3>Total Quizzes</h3>
            <p><%= request.getAttribute("totalQuizzes") != null ? request.getAttribute("totalQuizzes") : "—" %></p>
        </div>

        <!-- TOTAL QUESTIONS -->
        <div class="info-card">
            <div class="info-icon">
                <svg viewBox="0 0 24 24" fill="none">
                    <path d="M12 17h.01M9 9a3 3 0 116 0c0 2-3 2-3 4"
                          stroke-width="2" stroke-linecap="round"/>
                </svg>
            </div>
            <h3>Total Questions</h3>
            <p><%= request.getAttribute("totalQuestions") != null ? request.getAttribute("totalQuestions") : "—" %></p>
        </div>

        <!-- TOTAL USERS -->
        <div class="info-card">
            <div class="info-icon">
                <svg viewBox="0 0 24 24" fill="none">
                    <path d="M16 21v-2a4 4 0 00-4-4H6a4 4 0 00-4 4v2"
                          stroke-width="2"/>
                    <circle cx="9" cy="7" r="4" stroke-width="2"/>
                </svg>
            </div>
            <h3>Total Users</h3>
            <p><%= request.getAttribute("totalUsers") != null ? request.getAttribute("totalUsers") : "—" %></p>
        </div>

    </div>

</div>

</body>
</html>

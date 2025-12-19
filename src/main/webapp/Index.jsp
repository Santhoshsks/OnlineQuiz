<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageContext", "index");
%>
<jsp:include page="/common/navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Quiz Portal</title>

<style>
/* =========================
   THEME VARIABLES USAGE
========================= */
body {
    margin: 0;
    min-height: 100vh;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: var(--bg-page);
    color: var(--text-main);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Outer wrapper card */
.portal-card {
    background: var(--bg-card);
    border-radius: 18px;
    padding: 50px 60px;
    box-shadow: var(--shadow-lg);
    max-width: 950px;
    width: 100%;
    text-align: center;
}

/* Heading */
.portal-card h1 {
    font-size: 38px;
    font-weight: 700;
    margin-bottom: 45px;
    color: var(--text-heading);
}

/* Cards container */
.card-container {
    display: flex;
    justify-content: center;
    gap: 50px;
    flex-wrap: wrap;
}

/* Individual card */
.role-card {
    background: var(--bg-subcard);
    width: 280px;
    padding: 40px 30px;
    border-radius: 16px;
    cursor: pointer;
    transition: transform 0.25s ease, box-shadow 0.25s ease, border 0.25s ease;
    border: 1px solid var(--border-color);
    box-shadow: var(--shadow-md);
}

.role-card:hover {
    transform: translateY(-6px);
    box-shadow: var(--shadow-xl);
    border-color: var(--primary);
}

/* SVG icons */
.role-card svg {
    width: 70px;
    height: 70px;
    margin-bottom: 22px;
}

/* Title */
.role-card h2 {
    font-size: 22px;
    font-weight: 600;
    margin-bottom: 12px;
    color: var(--text-heading);
}

/* Subtitle */
.role-card p {
    font-size: 14px;
    color: var(--text-muted);
}

/* Footer */
.footer {
    margin-top: 50px;
    font-size: 13px;
    color: var(--text-muted);
}

/* Mobile */
@media (max-width: 700px) {
    .portal-card {
        padding: 40px 25px;
    }

    .card-container {
        gap: 30px;
    }
}
</style>
</head>

<body>

<div class="portal-card">

    <h1>Online Quiz Portal</h1>

    <div class="card-container">

        <!-- ADMIN CARD -->
        <div class="role-card"
             onclick="window.location.href='<%=request.getContextPath()%>/admin/AdminLogin.jsp'">

            <!-- Shield / Admin SVG -->
            <svg viewBox="0 0 24 24" fill="none">
                <path d="M12 3L4 6v6c0 5 3.5 8.5 8 9 4.5-.5 8-4 8-9V6l-8-3Z"
                      stroke="var(--primary)" stroke-width="2"/>
                <path d="M9 12l2 2 4-4"
                      stroke="var(--primary)" stroke-width="2"/>
            </svg>

            <h2>Admin</h2>
            <p>Manage quizzes, questions & results</p>
        </div>

        <!-- USER CARD -->
        <div class="role-card"
             onclick="window.location.href='<%=request.getContextPath()%>/User/User.jsp'">

            <!-- User / Quiz SVG -->
            <svg viewBox="0 0 24 24" fill="none">
                <circle cx="12" cy="8" r="4"
                        stroke="var(--success)" stroke-width="2"/>
                <path d="M4 20c0-4 4-6 8-6s8 2 8 6"
                      stroke="var(--success)" stroke-width="2"/>
            </svg>

            <h2>User</h2>
            <p>Attempt quizzes & view leaderboard</p>
        </div>

    </div>

    <div class="footer">
        © My Quiz Portal
    </div>

</div>

</body>
</html>

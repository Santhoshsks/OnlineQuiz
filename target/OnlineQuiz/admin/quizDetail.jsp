<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setAttribute("pageContext", "admin");
    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light";
%>
<body data-theme="<%= theme %>">

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Quiz Created</title>
<style>
:root {
    --light-bg: #f3f4f6;
    --light-card: #ffffff;
    --light-text: #1f2937;
    --light-accent: #3b82f6;
    --light-accent-hover: #2563eb;

    --dark-bg: #1f2933;
    --dark-card: rgba(31,41,55,0.95);
    --dark-text: #f9fafb;
    --dark-accent: #3b82f6;
    --dark-accent-hover: #2563eb;
}

body[data-theme="light"] {
    --bg: var(--light-bg);
    --card: var(--light-card);
    --text: var(--light-text);
    --accent: var(--light-accent);
    --accent-hover: var(--light-accent-hover);
}

body[data-theme="dark"] {
    --bg: var(--dark-bg);
    --card: var(--dark-card);
    --text: var(--dark-text);
    --accent: var(--dark-accent);
    --accent-hover: var(--dark-accent-hover);
}

body {
    margin: 0;
    padding-top: 70px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: var(--bg);
    color: var(--text);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.message-box {
    background: var(--card);
    padding: 40px 35px;
    border-radius: 20px;
    text-align: center;
    box-shadow: 0 18px 40px rgba(0,0,0,0.35);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    animation: fadeIn 0.5s ease-in-out;
    max-width: 450px;
    width: 90%;
    transition: all 0.3s ease;
}

.message-box h1 {
    font-size: 28px;
    color: var(--accent);
    margin-bottom: 20px;
}

.message-box p {
    font-size: 16px;
    margin-bottom: 25px;
}

.message-box a {
    display: inline-block;
    padding: 12px 28px;
    background: linear-gradient(135deg, var(--accent), var(--accent-hover));
    color: #fff;
    text-decoration: none;
    border-radius: 12px;
    font-weight: 600;
    transition: all 0.3s ease;
}

.message-box a:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(59,130,246,0.5);
}

@keyframes fadeIn {
    from {opacity: 0; transform: translateY(-10px);}
    to {opacity: 1; transform: translateY(0);}
}
</style>
</head>
<body>
<div class="message-box">
    <h1>🎉 Quiz Created Successfully!</h1>
    <p>You can now add questions or view all quizzes.</p>
    <a href="quiz-list?page=1">View Quizzes</a>
</div>
</body>
</html>

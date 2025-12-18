<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setAttribute("pageContext", "admin");
%>
<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Created</title>
<style>
    body {
        margin: 0;
        padding-top: 70px;
        font-family: "Inter", "Segoe UI", sans-serif;
        background: linear-gradient(135deg, #1f2933, #374151);
        color: #f9fafb;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .message-box {
        background: rgba(255,255,255,0.08);
        padding: 40px 30px;
        border-radius: 16px;
        text-align: center;
        box-shadow: 0 10px 30px rgba(0,0,0,0.35);
        backdrop-filter: blur(14px);
        animation: fadeIn 0.5s ease-in-out;
    }

    .message-box h1 {
        font-size: 28px;
        color: #3b82f6;
        margin-bottom: 20px;
    }

    .message-box a {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 25px;
        background: #3b82f6;
        color: #fff;
        text-decoration: none;
        border-radius: 8px;
        font-weight: 600;
        transition: background 0.3s;
    }

    .message-box a:hover {
        background: #2563eb;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(-10px);}
        to {opacity: 1; transform: translateY(0);}
    }
</style>
</head>
<body>

<div class="message-box">
    <h1>Quiz Created Successfully!</h1>
    <p>You can now add questions or view all quizzes.</p>
    <a href="QuizList.jsp">View Quizzes</a>
</div>

</body>
</html>

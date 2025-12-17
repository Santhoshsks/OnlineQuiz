<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageContext", "user");
%>
<jsp:include page="/common/navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>

<style>
    body {
        margin: 0;
        height: 100vh;
        font-family: "Inter", "Segoe UI", sans-serif;
        background: linear-gradient(135deg, #1f2933, #374151);
        display: flex;
        justify-content: center;
        align-items: center;
        color: #f9fafb;
    }

    .container {
        width: 420px;
        padding: 45px 40px;
        border-radius: 18px;
        background: rgba(255, 255, 255, 0.08);
        backdrop-filter: blur(14px);
        -webkit-backdrop-filter: blur(14px);
        box-shadow: 0 18px 40px rgba(0, 0, 0, 0.5);
        border: 1px solid rgba(255, 255, 255, 0.15);
        text-align: center;
        animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .avatar {
        margin-bottom: 20px;
    }

    h2 {
        font-size: 26px;
        font-weight: 600;
        margin-bottom: 30px;
    }

    form {
        text-align: left;
    }

    label {
        font-size: 14px;
        font-weight: 500;
        margin-bottom: 6px;
        display: block;
        color: #e5e7eb;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 18px;
        border-radius: 8px;
        border: 1px solid rgba(255,255,255,0.25);
        background: rgba(255,255,255,0.1);
        color: #f9fafb;
        font-size: 15px;
        outline: none;
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    input::placeholder {
        color: rgba(255,255,255,0.5);
    }

    input:focus {
        border-color: #22c55e;
        box-shadow: 0 0 0 2px rgba(34,197,94,0.4);
    }

    .button-group {
        display: flex;
        gap: 15px;
        margin-top: 10px;
    }

    input[type="submit"] {
        flex: 1;
        padding: 12px;
        font-size: 15px;
        font-weight: 600;
        color: #fff;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .login-btn {
        background: linear-gradient(135deg, #22c55e, #16a34a);
        box-shadow: 0 6px 18px rgba(34, 197, 94, 0.5);
    }

    .register-btn {
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        box-shadow: 0 6px 18px rgba(59, 130, 246, 0.5);
    }

    input[type="submit"]:hover {
        transform: translateY(-2px);
    }

    .message {
        background: rgba(239, 68, 68, 0.15);
        color: #fecaca;
        padding: 10px;
        border-radius: 8px;
        margin-top: 20px;
        font-size: 14px;
        text-align: center;
    }

    .footer {
        margin-top: 25px;
        font-size: 13px;
        color: rgba(255,255,255,0.6);
        text-align: center;
    }
</style>
</head>

<body>

<div class="container">

    <!-- User Avatar -->
    <div class="avatar">
        <svg width="72" height="72" viewBox="0 0 24 24" fill="none"
             xmlns="http://www.w3.org/2000/svg">
            <path d="M12 12c2.761 0 5-2.239 5-5s-2.239-5-5-5-5 2.239-5 5 2.239 5 5 5Z"
                  stroke="#22c55e" stroke-width="2"/>
            <path d="M4 20c0-4 4-6 8-6s8 2 8 6"
                  stroke="#22c55e" stroke-width="2"/>
        </svg>
    </div>

    <h2>User Portal</h2>

    <form action="<%= request.getContextPath() %>/user" method="post">
        <label>Username</label>
        <input type="text" name="username" placeholder="Enter username" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required>

        <div class="button-group">
            <input type="submit" name="action" value="Login" class="login-btn">
            <input type="submit" name="action" value="Register" class="register-btn">
        </div>
    </form>

    <%
        String message = request.getParameter("msg");
        if (message != null) {
    %>
        <div class="message"><%= message %></div>
    <% } %>

    <div class="footer">
        © 2025 Online Quiz Portal by Srinithi
    </div>

</div>

</body>
</html>

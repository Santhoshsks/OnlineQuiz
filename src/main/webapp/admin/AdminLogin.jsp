<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageContext", "admin");
%>
<jsp:include page="/common/navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

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

        .login-container {
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

        .welcome-text {
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

        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
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
            border-color: #3b82f6;
            box-shadow: 0 0 0 2px rgba(59,130,246,0.4);
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            color: #fff;
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 6px 18px rgba(59, 130, 246, 0.5);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(59, 130, 246, 0.7);
        }

        .error {
            background: rgba(239, 68, 68, 0.15);
            color: #fecaca;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
        }

        .footer {
            margin-top: 25px;
            font-size: 13px;
            color: rgba(255,255,255,0.6);
        }
    </style>
</head>
<body>

<div class="login-container">

    <!-- Admin Avatar (Inline SVG) -->
    <div class="avatar">
        <svg width="72" height="72" viewBox="0 0 24 24" fill="none"
             xmlns="http://www.w3.org/2000/svg">
            <path d="M12 12c2.761 0 5-2.239 5-5s-2.239-5-5-5-5 2.239-5 5 2.239 5 5 5Z"
                  stroke="#3b82f6" stroke-width="2"/>
            <path d="M4 20c0-4 4-6 8-6s8 2 8 6"
                  stroke="#3b82f6" stroke-width="2"/>
        </svg>
    </div>

    <div class="welcome-text">Admin Login</div>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="<%=request.getContextPath()%>/Admin/AdminLoginServlet" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Enter your username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>

        <button type="submit">Login</button>
    </form>

    <div class="footer">
        Online Quiz Portal by Srinithi
    </div>

</div>

</body>
</html>

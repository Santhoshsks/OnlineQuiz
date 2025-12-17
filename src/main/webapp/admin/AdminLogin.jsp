<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            width: 400px;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        .login-container img {
            width: 200px;
	        margin-bottom: 1.5rem;
	        border-radius: 70%;
        }
        
        @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    	}

        .welcome-text {
            font-size: 26px;
            font-weight: 600;
            color: #333;
            margin-bottom: 25px;
        }

        form {
            width: 100%;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #444;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
            outline: none;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
        }

        button {
            width: 100%;
            background-color: #708090;
            color: white;
            font-size: 16px;
            padding: 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 500;
        }

        .footer {
            margin-top: 20px;
            font-size: 13px;
            color: #777;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="welcome-text">Welcome Admin!</div>
        <img src="https://i.pinimg.com/736x/8e/87/21/8e872143946d23274e5de0d8199dce93.jpg" alt="Admin Avatar">

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
            © 2025 Online Quiz Portal by Srinithi
        </div>
    </div>

</body>
</html>

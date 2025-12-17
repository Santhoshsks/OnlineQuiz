<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Portal</title>
<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: #FFDAB9;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background-color: white;
        padding: 2rem 3rem;
        border-radius: 12px;
        text-align: center;
        width: 380px;
        
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        color: #2c3e50;
        margin-bottom: 1rem;
    }

    .welcome-img {
        width: 300px;
        margin-bottom: 1.5rem;
        border-radius: 100%;
    }
	
	
    form label {
        display: block;
        font-weight: 500;
        color: #2c3e50;
        margin-bottom: 0.4rem;
        text-align: left;
    }
    form input[type=text], 
    form input[type=password] {
        width: 100%;
        padding: 0.6rem;
        margin: 0.5rem 0 1.2rem 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 1rem;
    }

    form input[type=submit] {
        background-color: #8B4513;
        color: white;
        border: none;
        padding: 0.6rem 1.5rem;
        border-radius: 6px;
        cursor: pointer;
        font-size: 1rem;
        margin: 0 0.4rem;
        transition: background-color 0.3s;
    }

    form input[type=submit]:hover {
        background-color: #34495e;
    }

    .message {
        text-align: left;
        margin-top: 1rem;
        color: red;
        font-weight: 500;
    }
</style>
</head>
<body>

<div class="container">
    <h2>Welcome User</h2>
    <img src="https://www.pushengage.com/wp-content/uploads/2022/02/Best-Website-Welcome-Message-Examples.png" alt="Welcome" class="welcome-img">

    <form action="<%= request.getContextPath() %>/user" method="post">
        <label style="align">Username:</label>
        <input type="text" name="username" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <div>
            <input type="submit" name="action" value="Register">
            <input type="submit" name="action" value="Login">
        </div>
    </form>

    <% 
    String message = request.getParameter("msg");
    if(message != null) {
    %>
        <div class="message"><%= message %></div>
    <% } %>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Quiz Portal</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: "Segoe UI", sans-serif;
            background: #778899;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .container {
            text-align: center;
        }

        h1 {
            font-size: 36px;
            font-weight: 600;
            margin-bottom: 40px;
        }

        .card-container {
            display: flex;
            justify-content: center;
            gap: 50px;
        }

        .card {
            background: #9370DB;
            backdrop-filter: blur(10px);
            padding: 40px 30px;
            width: 220px;
            border-radius: 16px;
            text-align: center;
            transition: 0.3s ease-in-out;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            cursor: pointer;
        }

        .card:hover {
            transform: translateY(-8px);
            
        }

        .card img {
            width: 80px;
            height: 80px;
            margin-bottom: 15px;
        }

        .card h2 {
            color: white;
            font-size: 22px;
            margin-bottom: 15px;
        }

        .card button {
            background-color: #fff;
            color: #333;
            font-weight: 600;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .card button:hover {
            background-color: #e3e3e3;
        }

        .footer {
            margin-top: 40px;
            font-size: 14px;
            color: rgba(255, 255, 255, 0.8);
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome to Online Quiz Portal</h1>

        <div class="card-container">
            <div class="card" onclick="window.location.href='<%=request.getContextPath()%>/admin/AdminLogin.jsp'">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Admin">
                <h2>Admin</h2>
                <button>Go to Admin</button>
            </div>

            <div class="card" onclick="window.location.href='<%=request.getContextPath()%>/User/User.jsp'">
                <img src="https://cdn-icons-png.flaticon.com/512/219/219983.png" alt="User">
                <h2>User</h2>
                <button>Go to User</button>
            </div>
        </div>

        <div class="footer">
            © 2025 Online Quiz Portal by Srinithi
        </div>
    </div>

</body>
</html>

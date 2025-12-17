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
        body {
            margin: 0;
            height: 100vh;
            font-family: "Inter", "Segoe UI", sans-serif;
            background: #0f172a;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #e5e7eb;
        }

        .container {
            text-align: center;
            max-width: 900px;
            width: 100%;
            padding: 20px;
        }

        h1 {
            font-size: 38px;
            font-weight: 700;
            margin-bottom: 50px;
            letter-spacing: 0.3px;
            color: #f8fafc;
        }

        .card-container {
            display: flex;
            justify-content: center;
            gap: 50px;
            flex-wrap: wrap;
        }

        .card {
            background: #111827;
            padding: 40px 30px;
            width: 260px;
            border-radius: 16px;
            text-align: center;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            box-shadow: 0 8px 20px rgba(0,0,0,0.35);
            cursor: pointer;
            border: 1px solid #1f2937;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 32px rgba(0,0,0,0.55);
            border-color: #3b82f6;
        }

        .card img {
            width: 72px;
            height: 72px;
            margin-bottom: 20px;
            filter: invert(60%) sepia(20%) saturate(400%) hue-rotate(180deg);
        }

        .card h2 {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 18px;
            color: #f9fafb;
        }

        .card button {
            background: transparent;
            color: #3b82f6;
            font-weight: 600;
            padding: 10px 24px;
            border: 2px solid #3b82f6;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            transition: background 0.25s ease, color 0.25s ease;
        }

        .card button:hover {
            background: #3b82f6;
            color: #ffffff;
        }

        .footer {
            margin-top: 60px;
            font-size: 13px;
            color: #9ca3af;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Online Quiz Portal</h1>

    <div class="card-container">
        <div class="card" onclick="window.location.href='<%=request.getContextPath()%>/admin/AdminLogin.jsp'">
            <!-- Admin SVG -->
            <svg width="72" height="72" viewBox="0 0 24 24" fill="none"
                 xmlns="http://www.w3.org/2000/svg"
                 style="margin-bottom:20px;">
                <path d="M12 12c2.761 0 5-2.239 5-5s-2.239-5-5-5-5 2.239-5 5 2.239 5 5 5Z"
                      stroke="#3b82f6" stroke-width="2"/>
                <path d="M4 20c0-4 4-6 8-6s8 2 8 6"
                      stroke="#3b82f6" stroke-width="2"/>
            </svg>

            <h2>Admin</h2>
            <button>Admin Login</button>
        </div>

        <div class="card" onclick="window.location.href='<%=request.getContextPath()%>/User/User.jsp'">
            <!-- User SVG -->
            <svg width="72" height="72" viewBox="0 0 24 24" fill="none"
                 xmlns="http://www.w3.org/2000/svg"
                 style="margin-bottom:20px;">
                <circle cx="12" cy="8" r="4"
                        stroke="#22c55e" stroke-width="2"/>
                <path d="M4 20c0-4 4-6 8-6s8 2 8 6"
                      stroke="#22c55e" stroke-width="2"/>
            </svg>

            <h2>User</h2>
            <button>User Login</button>
        </div>

    </div>

    <div class="footer">
        Online Quiz Portal By Srinithi
    </div>
</div>

</body>
</html>

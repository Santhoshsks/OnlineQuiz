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
/* =========================
   PAGE BASE
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

/* =========================
   LOGIN CARD
========================= */
.login-card {
    width: 420px;
    padding: 45px 40px;
    border-radius: 18px;
    background: var(--bg-card);
    box-shadow: var(--shadow-xl);
    border: 1px solid var(--border-color);
    text-align: center;
    animation: fadeIn 0.4s ease-in-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(15px); }
    to { opacity: 1; transform: translateY(0); }
}

/* =========================
   ICON
========================= */
.login-card svg {
    width: 72px;
    height: 72px;
    margin-bottom: 20px;
}

/* =========================
   HEADING
========================= */
.login-card h2 {
    font-size: 26px;
    font-weight: 600;
    margin-bottom: 30px;
    color: var(--text-heading);
}

/* =========================
   FORM
========================= */
form {
    text-align: left;
}

label {
    font-size: 14px;
    font-weight: 500;
    margin-bottom: 6px;
    display: block;
    color: var(--text-muted);
}

input {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    border-radius: 8px;
    border: 1px solid var(--border-color);
    background: var(--bg-subcard);
    color: var(--text-main);
    font-size: 15px;
    outline: none;
    transition: border-color 0.25s, box-shadow 0.25s;
}

input::placeholder {
    color: var(--text-muted);
}

input:focus {
    border-color: var(--primary);
    box-shadow: 0 0 0 2px rgba(59,130,246,0.35);
}

/* =========================
   BUTTON
========================= */
button {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    background: linear-gradient(135deg, var(--primary), #1d4ed8);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    box-shadow: 0 6px 18px rgba(59,130,246,0.45);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

button:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 30px rgba(59,130,246,0.65);
}

/* =========================
   ERROR
========================= */
.error {
    background: rgba(239,68,68,0.15);
    color: #fecaca;
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 20px;
    text-align: center;
    font-size: 14px;
}

/* =========================
   FOOTER
========================= */
.footer {
    margin-top: 25px;
    font-size: 13px;
    color: var(--text-muted);
    text-align: center;
}
</style>
</head>

<body>

<div class="login-card">

    <!-- ADMIN SVG -->
    <svg viewBox="0 0 24 24" fill="none">
        <path d="M12 3L4 6v6c0 5 3.5 8.5 8 9 4.5-.5 8-4 8-9V6l-8-3Z"
              stroke="var(--primary)" stroke-width="2"/>
        <path d="M9 12l2 2 4-4"
              stroke="var(--primary)" stroke-width="2"/>
    </svg>

    <h2>Admin Login</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="<%=request.getContextPath()%>/Admin/AdminLoginServlet" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username"
               placeholder="Enter your username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password"
               placeholder="Enter your password" required>

        <button type="submit">Login</button>
    </form>

    <div class="footer">
        © My Quiz Portal
    </div>

</div>

</body>
</html>

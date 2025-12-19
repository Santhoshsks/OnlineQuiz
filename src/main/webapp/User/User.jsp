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
    margin-bottom: 18px;
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
   BUTTONS
========================= */
.button-group {
    display: flex;
    gap: 15px;
    margin-top: 10px;
}

button {
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
    background: linear-gradient(135deg, var(--primary), #1d4ed8);
    box-shadow: 0 6px 18px rgba(59,130,246,0.45);
}

.register-btn {
    background: linear-gradient(135deg, #22c55e, #16a34a);
    box-shadow: 0 6px 18px rgba(34,197,94,0.45);
}

button:hover {
    transform: translateY(-2px);
}

/* =========================
   MESSAGE
========================= */
.message {
    background: rgba(239,68,68,0.15);
    color: #fecaca;
    padding: 10px;
    border-radius: 8px;
    margin-top: 20px;
    font-size: 14px;
    text-align: center;
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

    <!-- USER SVG -->
    <svg viewBox="0 0 24 24" fill="none">
        <circle cx="12" cy="8" r="4"
                stroke="var(--primary)" stroke-width="2"/>
        <path d="M4 20c0-4 4-6 8-6s8 2 8 6"
              stroke="var(--primary)" stroke-width="2"/>
    </svg>

    <h2>User Login</h2>

    <form action="<%= request.getContextPath() %>/user" method="post">
        <label>Username</label>
        <input type="text" name="username" placeholder="Enter username" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required>

        <div class="button-group">
            <button type="submit" name="action" value="Login" class="login-btn">Login</button>
            <button type="submit" name="action" value="Register" class="register-btn">Register</button>
        </div>
    </form>

    <%
        String message = request.getParameter("msg");
        if (message != null) {
    %>
        <div class="message"><%= message %></div>
    <% } %>

    <div class="footer">
        © My Quiz Portal
    </div>

</div>

</body>
</html>

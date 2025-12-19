<%@ page contentType="text/html; charset=UTF-8" %>

<%
    /* ========= THEME HANDLING ========= */
    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light"; // DEFAULT

    /* ========= USER CONTEXT ========= */
    Object adminObj = session.getAttribute("admin");
    Object userObj  = session.getAttribute("user");
%>

<style>
/* =========================
   THEME VARIABLES
========================= */
body.light-theme {
    --bg-page: #f3f4f6;
    --bg-card: #ffffff;
    --bg-subcard: #f9fafb;
    --text-main: #111827;
    --text-heading: #020617;
    --text-muted: #6b7280;
    --border-color: #e5e7eb;
    --primary: #2563eb;
    --success: #16a34a;
    --shadow-md: 0 6px 14px rgba(0,0,0,0.08);
    --shadow-lg: 0 10px 25px rgba(0,0,0,0.12);
    --shadow-xl: 0 20px 40px rgba(0,0,0,0.15);
}

body.dark-theme {
    --bg-page: #0f172a;
    --bg-card: #020617;
    --bg-subcard: #020617;
    --text-main: #e5e7eb;
    --text-heading: #f8fafc;
    --text-muted: #9ca3af;
    --border-color: #1f2937;
    --primary: #3b82f6;
    --success: #22c55e;
    --shadow-md: 0 6px 14px rgba(0,0,0,0.4);
    --shadow-lg: 0 10px 25px rgba(0,0,0,0.6);
    --shadow-xl: 0 20px 40px rgba(0,0,0,0.8);
}

/* =========================
   TOP NAVBAR
========================= */
.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 70px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 40px;
    background-color: var(--bg-navbar);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
    font-family: "Inter", "Segoe UI", sans-serif;
    z-index: 2000;
    box-sizing: border-box;
}

.navbar .logo {
    font-size: 22px;
    font-weight: 700;
    color: var(--primary);
}

.navbar .nav-links {
    display: flex;
    align-items: center;
    gap: 18px;
}

.navbar a {
    color: var(--text-main);
    text-decoration: none;
    font-weight: 500;
    padding: 6px 14px;
    border-radius: 6px;
    transition: all 0.2s ease;
}

.navbar a:hover {
    background-color: var(--bg-hover);
    color: var(--primary);
}

.theme-toggle {
    font-size: 18px;
    cursor: pointer;
}

body {
    padding-top: 70px;
}
</style>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.body.classList.add("<%= theme %>-theme");
    });
</script>

<div class="navbar">
    <div class="logo">Online Quiz</div>

    <div class="nav-links">

        <%-- NOT LOGGED IN --%>
        <% if (adminObj == null && userObj == null) { %>
            <a href="<%=request.getContextPath()%>/Index.jsp">Home</a>
            <a href="<%=request.getContextPath()%>/admin/AdminLogin.jsp">Admin Login</a>
            <a href="<%=request.getContextPath()%>/User/User.jsp">User Login</a>

        <%-- ADMIN LOGGED IN --%>
        <% } else if (adminObj != null) { %>
            <a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a>
            <a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>

        <%-- USER LOGGED IN --%>
        <% } else if (userObj != null) { %>
            <a href="<%=request.getContextPath()%>/User/UserDashboard.jsp">Dashboard</a>
            <a href="<%=request.getContextPath()%>/User/Leaderboard.jsp">Leaderboard</a>
            <a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
        <% } %>

        <!-- THEME TOGGLE -->
        <a class="theme-toggle"
           href="<%=request.getContextPath()%>/toggleTheme"
           title="Toggle Theme">
            <%= "dark".equals(theme) ? "☀️" : "🌙" %>
        </a>

    </div>
</div>

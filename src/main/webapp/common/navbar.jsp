<%@ page contentType="text/html; charset=UTF-8" %>

<style>
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
    background-color: rgba(31, 41, 51, 0.95);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    font-family: "Inter", "Segoe UI", sans-serif;
    z-index: 2000;
    box-sizing: border-box;
}

.navbar .logo {
    font-size: 22px;
    font-weight: 700;
    color: #3b82f6;
}

.navbar .nav-links {
    display: flex;
    align-items: center;
    gap: 20px;
}

.navbar a {
    color: #f9fafb;
    text-decoration: none;
    font-weight: 500;
    padding: 6px 14px;
    border-radius: 6px;
    transition: all 0.2s ease;
}

.navbar a:hover {
    background-color: rgba(255, 255, 255, 0.12);
    color: #3b82f6;
}

/* Page spacing below navbar */
body {
    padding-top: 70px;
}
</style>

<%
    /* ========= CONTEXT DETECTION ========= */
    Object adminObj = session.getAttribute("admin");
    Object userObj  = session.getAttribute("user");
%>

<div class="navbar">
    <div class="logo">Online Quiz</div>

    <div class="nav-links">

        <%-- INDEX PAGE (No login yet) --%>
        <% if (adminObj == null && userObj == null) { %>
            <a href="<%=request.getContextPath()%>/Index.jsp">Home</a>
            <a href="<%=request.getContextPath()%>/admin/AdminLogin.jsp">Admin Login</a>
            <a href="<%=request.getContextPath()%>/User/User.jsp">User Login</a>

        <%-- ADMIN LOGGED IN --%>
        <% } else if (adminObj != null) { %>
            <a href="<%=request.getContextPath()%>/admin/AdminDashboard.jsp">Dashboard</a>
            <a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>

        <%-- USER LOGGED IN --%>
        <% } else if (userObj != null) { %>
            <a href="<%=request.getContextPath()%>/User/UserDashboard.jsp">Dashboard</a>
            <a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
        <% } %>

    </div>
</div>

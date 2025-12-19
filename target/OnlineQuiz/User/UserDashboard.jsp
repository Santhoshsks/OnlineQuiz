<%@ page import="java.sql.*, com.quiz.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("pageContext", "user");
    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light";
%>

<body data-theme="<%= theme %>">

<jsp:include page="/common/navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<style>
/* Theme variables */
body[data-theme="light"] {
    --bg: #f3f4f6;
    --text: #1f2937;
    --card: #ffffff;
    --header-bg: #3b82f6;
    --row-even: #f9fafb;
    --row-odd: #ffffff;
    --accent-hover: rgba(59,130,246,0.1);
}

body[data-theme="dark"] {
    --bg: #1f2933;
    --text: #f9fafb;
    --card: rgba(255,255,255,0.08);
    --header-bg: #3b82f6;
    --row-even: rgba(55,65,81,0.8);
    --row-odd: rgba(31,41,55,0.8);
    --accent-hover: rgba(59,130,246,0.3);
}

body {
    margin: 0;
    padding-top: 80px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: var(--bg);
    color: var(--text);
}

/* Page title */
h2 {
    text-align: center;
    margin-bottom: 35px;
    color: var(--text);
}

/* Table container */
.table-wrapper {
    max-width: 900px;
    margin: 0 auto 60px;
    background: var(--card);
    border-radius: 16px;
    box-shadow: 0 12px 35px rgba(0,0,0,0.35);
    overflow: hidden;
    padding: 20px;
    backdrop-filter: blur(12px);
}

/* Table styling */
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 14px 16px;
    text-align: left;
}

th {
    background: var(--header-bg);
    color: #fff;
    font-size: 14px;
    text-transform: uppercase;
    font-weight: 600;
    position: sticky;
    top: 0;
}

tr:nth-child(even) {
    background: var(--row-even);
}

tr:nth-child(odd) {
    background: var(--row-odd);
}

tr:hover {
    background-color: var(--accent-hover);
}

/* Button styling */
.action-btn {
    display: inline-block;
    padding: 8px 18px;
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    color: #fff;
    border-radius: 8px;
    font-weight: 600;
    text-decoration: none;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.action-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(59,130,246,0.4);
}

/* Empty / Error */
.empty-msg {
    text-align: center;
    padding: 25px;
    color: #f87171;
    font-weight: 600;
}

/* Responsive */
@media (max-width: 600px) {
    th, td {
        padding: 10px;
        font-size: 13px;
    }
}
</style>
</head>
<body>

<h2>Welcome, <%= session.getAttribute("username") %></h2>

<div class="table-wrapper">
<table>
    <tr>
        <th>ID</th>
        <th>Quiz Name</th>
        <th>Action</th>
    </tr>

<%
    try (Connection conn = DBConnector.getConnection()) {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM quiz");
        ResultSet rs = ps.executeQuery();
        boolean hasData = false;

        while (rs.next()) {
            hasData = true;
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td>
            <a class="action-btn"
               href="<%=request.getContextPath()%>/attemptQuiz?quizId=<%= rs.getInt("id") %>">
                Attempt Quiz
            </a>
        </td>
    </tr>
<%
        }

        if (!hasData) {
%>
    <tr>
        <td colspan="3" class="empty-msg">No quizzes available</td>
    </tr>
<%
        }
    } catch(Exception e) {
%>
    <tr>
        <td colspan="3" class="empty-msg">
            Error loading quizzes
        </td>
    </tr>
<%
    }
%>
</table>
</div>

</body>
</html>

<%@ page import="java.sql.*, com.quiz.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("pageContext", "user");
    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light";
%>

<jsp:include page="/common/navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leaderboard</title>

<style>
/* =========================
   THEME VARIABLES
========================= */
body[data-theme="light"] {
    --bg: #f3f4f6;
    --text: #1f2937;
    --card-bg: #ffffff;
    --header-bg: #e0e7ff;
    --row-hover: rgba(59,130,246,0.18);
    --rank-gold: #facc15;
    --rank-silver: #cbd5e1;
    --rank-bronze: #d97706;
}

body[data-theme="dark"] {
    --bg: #1f2933;
    --text: #f9fafb;
    --card-bg: rgba(255,255,255,0.08);
    --header-bg: rgba(59,130,246,0.85);
    --row-hover: rgba(59,130,246,0.18);
    --rank-gold: #facc15;
    --rank-silver: #cbd5e1;
    --rank-bronze: #d97706;
}

/* =========================
   PAGE
========================= */
body {
    margin: 0;
    padding-top: 70px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: var(--bg);
    color: var(--text);
    min-height: 100vh;
}

/* Page title */
h2 {
    text-align: center;
    margin: 30px 0;
    font-size: 26px;
    color: #3b82f6;
}

/* Table container */
.table-container {
    max-width: 900px;
    margin: 0 auto 60px;
    background: var(--card-bg);
    border-radius: 14px;
    padding: 12px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.4);
    overflow-x: auto;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
}

/* Table headers */
table th {
    background: var(--header-bg);
    color: var(--text);
    text-transform: uppercase;
    font-size: 13px;
    font-weight: 600;
    padding: 14px;
    border-bottom: 1px solid rgba(255,255,255,0.15);
    text-align: left;
}

/* Table cells */
table td {
    padding: 14px;
    font-size: 15px;
    border-bottom: 1px solid rgba(255,255,255,0.08);
    text-align: left;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

/* Center numeric columns */
table th:nth-child(1),
table td:nth-child(1),
table th:nth-child(4),
table td:nth-child(4) {
    text-align: center;
    width: 90px;
}

/* Quiz column wider */
table th:nth-child(3),
table td:nth-child(3) {
    width: 35%;
}

/* Row hover */
table tbody tr:hover {
    background-color: var(--row-hover);
    transition: 0.3s;
}

/* Rank colors */
table tbody tr:nth-child(1) td {
    color: var(--rank-gold);
    font-weight: 700;
}
table tbody tr:nth-child(2) td {
    color: var(--rank-silver);
}
table tbody tr:nth-child(3) td {
    color: var(--rank-bronze);
}

/* Empty state */
.empty {
    text-align: center;
    padding: 20px;
    color: #9ca3af;
}

/* Responsive */
@media (max-width: 600px) {
    h2 {
        font-size: 22px;
    }

    table th, table td {
        font-size: 13px;
        padding: 10px;
    }
}
</style>
</head>

<body data-theme="<%= theme %>">

<h2>Leaderboard</h2>

<div class="table-container">
<table>
    <thead>
        <tr>
            <th>Rank</th>
            <th>User</th>
            <th>Quiz</th>
            <th>Score</th>
        </tr>
    </thead>
    <tbody>

<%
try (Connection conn = DBConnector.getConnection()) {
    PreparedStatement ps = conn.prepareStatement(
        "SELECT u.username, q.name, r.score " +
        "FROM result r " +
        "JOIN user u ON r.user_id = u.id " +
        "JOIN quiz q ON r.quiz_id = q.id " +
        "ORDER BY r.score DESC"
    );

    ResultSet rs = ps.executeQuery();
    int rank = 1;
    boolean hasData = false;

    while (rs.next()) {
        hasData = true;
%>
        <tr>
            <td><%= rank++ %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getInt("score") %></td>
        </tr>
<%
    }

    if (!hasData) {
%>
        <tr>
            <td colspan="4" class="empty">No leaderboard data available</td>
        </tr>
<%
    }
} catch (Exception e) {
%>
        <tr>
            <td colspan="4" class="empty" style="color:#f87171;">
                Error: <%= e.getMessage() %>
            </td>
        </tr>
<%
}
%>

    </tbody>
</table>
</div>

</body>
</html>

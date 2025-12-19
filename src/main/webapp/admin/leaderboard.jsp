<%@ page import="java.sql.*, com.quiz.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "leaderboard");
    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light";
%>

<body data-theme="<%= theme %>">

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leaderboard</title>
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
    padding-top: 70px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: var(--bg);
    color: var(--text);
}

/* Heading */
h2 {
    text-align: center;
    font-size: 28px;
    margin: 30px 0 20px 0;
    color: var(--header-bg);
}

/* Table container */
.table-container {
    max-width: 900px;
    margin: 0 auto 50px auto;
    overflow-x: auto;
    padding: 0 15px;
    background: var(--card);
    border-radius: 16px;
    padding: 20px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    backdrop-filter: blur(12px);
}

/* Table styling */
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px 10px;
    text-align: left;
    border-bottom: 1px solid rgba(0,0,0,0.1);
}

th {
    background: var(--header-bg);
    color: #fff;
    font-weight: 600;
    text-transform: uppercase;
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

/* Rank styling */
.rank {
    font-weight: 700;
    color: var(--header-bg);
}

/* Footer */
.footer {
    text-align: center;
    margin-bottom: 30px;
    color: rgba(255,255,255,0.6);
    font-size: 13px;
}

/* Responsive */
@media (max-width: 768px) {
    th, td {
        padding: 8px 6px;
        font-size: 13px;
    }
}
</style>
</head>
<body>

<h2>Leaderboard</h2>

<div class="table-container">
<table>
  <tr>
    <th>Rank</th>
    <th>Username</th>
    <th>Quiz</th>
    <th>Score</th>
  </tr>

<%
try (Connection conn = DBConnector.getConnection()) {
    PreparedStatement ps = conn.prepareStatement(
        "SELECT u.username, q.name, r.score FROM result r " +
        "JOIN user u ON r.user_id=u.id JOIN quiz q ON r.quiz_id=q.id " +
        "ORDER BY r.score DESC"
    );
    ResultSet rs = ps.executeQuery();
    int rank = 1;
    while (rs.next()) {
%>
  <tr>
    <td class="rank"><%= rank++ %></td>
    <td><%= rs.getString("username") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getInt("score") %></td>
  </tr>
<%
    }
} catch(Exception e){
%>
  <tr>
    <td colspan="4" style="text-align:center; color:#f87171;">Error: <%= e.getMessage() %></td>
  </tr>
<% } %>
</table>
</div>

<div class="footer">
    My Quiz Portal
</div>

</body>
</html>

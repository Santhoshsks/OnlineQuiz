<%@ page import="java.sql.*, com.quiz.util.*" %>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "leaderboard");
%>
<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leaderboard</title>
<style>
  body {
    margin: 0;
    padding-top: 70px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: linear-gradient(135deg, #1f2933, #374151);
    color: #f9fafb;
  }

  h2 {
    text-align: center;
    font-size: 28px;
    margin: 30px 0 20px 0;
    color: #3b82f6;
  }

  .table-container {
    max-width: 900px;
    margin: 0 auto 50px auto;
    overflow-x: auto;
    padding: 0 15px;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(255,255,255,0.05);
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    backdrop-filter: blur(12px);
  }

  th, td {
    padding: 14px 16px;
    text-align: left;
  }

  th {
    background: rgba(59,130,246,0.85);
    color: #fff;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 14px;
  }

  tr:nth-child(even) {
    background: rgba(255,255,255,0.03);
  }

  tr:hover {
    background: rgba(59,130,246,0.1);
    transition: 0.3s;
  }

  td {
    font-size: 15px;
    color: #e5e7eb;
  }

  .rank {
    font-weight: 700;
    color: #3b82f6;
  }

  @media (max-width: 768px) {
    table th, table td {
      padding: 10px;
      font-size: 13px;
    }
  }

  .footer {
    text-align: center;
    margin-bottom: 30px;
    color: rgba(255,255,255,0.6);
    font-size: 13px;
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

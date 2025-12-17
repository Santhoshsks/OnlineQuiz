<%@ page import="java.sql.*, com.quiz.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
  body {
    font-family: 'Segoe UI', sans-serif;
    background-color: #f2f5fa;
    margin: 0;
    padding: 0;
  }

  h2 {
    text-align: center;
    margin-top: 40px;
    color: #004aad;
  }

  table {
    width: 90%;
    max-width: 700px;
    margin: 2rem auto;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
  }

  table th, table td {
    padding: 12px 15px;
    text-align: left;
  }

  table th {
    background-color: #004aad;
    color: white;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 14px;
  }

  table tr:nth-child(even) {
    background-color: #f8f9fb;
  }

  table tr:hover {
    background-color: #e3f2fd;
  }

  td {
    font-size: 14px;
    color: #333;
  }

  .action-btn {
    display: inline-block;
    padding: 8px 16px;
    background-color: #004aad;
    color: white;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 500;
    transition: background 0.2s ease;
  }

  .action-btn:hover {
    background-color: #003580;
  }

  @media (max-width: 600px) {
    table th, table td {
      padding: 10px;
      font-size: 13px;
    }

    .action-btn {
      padding: 6px 12px;
    }
  }
</style>
</head>
<body>
<jsp:include page="UserHeader.jsp" />

<h2>Welcome, <%= session.getAttribute("username") %></h2>

<table>
<tr><th>ID</th><th>Quiz Name</th><th>Action</th></tr>
<%
    try (Connection conn = DBConnector.getConnection()) {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM quiz");
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td>
        <a class="action-btn" href="<%=request.getContextPath() %>/attemptQuiz?quizId=<%= rs.getInt("id") %>">Attempt Quiz</a>
    </td>
</tr>
<% } } catch(Exception e){ %>
<tr>
    <td colspan="3" style="text-align:center; color:red;">Error: <%= e.getMessage() %></td>
</tr>
<% } %>
</table>

</body>
</html>

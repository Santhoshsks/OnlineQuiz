<%@ page import="java.sql.*, com.quiz.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setAttribute("pageContext", "user");
%>

<jsp:include page="/common/navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<style>
body {
    margin: 0;
    padding-top: 80px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: linear-gradient(135deg, #1f2933, #374151);
    color: #f9fafb;
}

/* Page Title */
h2 {
    text-align: center;
    margin-bottom: 35px;
    color: #e5e7eb;
}

/* Card Container */
.table-wrapper {
    max-width: 900px;
    margin: 0 auto 60px;
    background: rgba(31,41,55,0.92);
    border-radius: 14px;
    box-shadow: 0 12px 35px rgba(0,0,0,0.45);
    overflow: hidden;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 14px 16px;
    text-align: left;
}

th {
    background: rgba(17,24,39,0.95);
    color: #e5e7eb;
    font-size: 14px;
    text-transform: uppercase;
}

tr:nth-child(even) {
    background: rgba(55,65,81,0.85);
}

tr:nth-child(odd) {
    background: rgba(31,41,55,0.85);
}

tr:hover {
    background: rgba(59,130,246,0.25);
}

/* Button */
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

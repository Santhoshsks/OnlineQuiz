<%@ page import="java.util.*" %>
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
<title>Quiz Result</title>

<style>
/* Theme variables */
body[data-theme="light"] {
    --bg: #f3f4f6;
    --text: #1f2937;
    --card: #ffffff;
    --banner-bg: linear-gradient(135deg, #2563eb, #3b82f6);
    --correct: rgba(34,197,94,0.18);
    --wrong: rgba(239,68,68,0.18);
    --button-bg: linear-gradient(135deg, #3b82f6, #2563eb);
}

body[data-theme="dark"] {
    --bg: #1f2933;
    --text: #f9fafb;
    --card: rgba(255,255,255,0.08);
    --banner-bg: linear-gradient(135deg, #2563eb, #3b82f6);
    --correct: rgba(34,197,94,0.25);
    --wrong: rgba(239,68,68,0.25);
    --button-bg: linear-gradient(135deg, #3b82f6, #2563eb);
}

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
    margin: 30px 0 10px;
    font-size: 26px;
    color: #3b82f6;
}

/* Score banner */
.score-banner {
    max-width: 420px;
    margin: 20px auto 35px;
    padding: 18px 25px;
    text-align: center;
    font-size: 22px;
    font-weight: 700;
    color: var(--text);
    background: var(--banner-bg);
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(59,130,246,0.45);
}

/* Result table */
table {
    width: 95%;
    max-width: 1000px;
    margin: 0 auto 40px;
    border-collapse: collapse;
    background: var(--card);
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 20px 40px rgba(0,0,0,0.35);
}

table th, table td {
    padding: 14px 16px;
    text-align: left;
    font-size: 14px;
}

table th {
    background: rgba(59,130,246,0.85);
    color: #fff;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.4px;
}

table tr {
    border-bottom: 1px solid rgba(255,255,255,0.08);
}

/* Correct & Wrong rows */
table tr.correct {
    background: var(--correct);
}

table tr.wrong {
    background: var(--wrong);
}

/* Action buttons */
.actions {
    text-align: center;
    margin-bottom: 50px;
}

.action-btn {
    display: inline-block;
    margin: 12px 10px;
    padding: 12px 28px;
    background: var(--button-bg);
    color: white;
    border-radius: 999px;
    text-decoration: none;
    font-weight: 600;
    font-size: 15px;
    transition: all 0.25s ease;
    box-shadow: 0 10px 25px rgba(59,130,246,0.45);
}

.action-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 14px 30px rgba(59,130,246,0.65);
}

/* Responsive */
@media (max-width: 600px) {
    table th, table td {
        padding: 10px;
        font-size: 13px;
    }

    .action-btn {
        display: block;
        width: 85%;
        margin: 12px auto;
    }

    h2 {
        font-size: 22px;
    }
}
</style>
</head>

<body data-theme="<%= theme %>">

<h2>Quiz Results</h2>

<div class="score-banner">
    Your Score: <%= request.getAttribute("score") %>
</div>

<table>
    <tr>
        <th>Question</th>
        <th>Your Answer</th>
        <th>Correct Answer</th>
    </tr>

<%
    List<Map<String,String>> review =
        (List<Map<String,String>>) request.getAttribute("review");

    if (review != null) {
        for (Map<String,String> r : review) {
            String chosen = r.get("chosen");
            String correct = r.get("correct");
%>
    <tr class="<%= chosen.equalsIgnoreCase(correct) ? "correct" : "wrong" %>">
        <td><%= r.get("question") %></td>
        <td><%= chosen %></td>
        <td><%= correct %></td>
    </tr>
<%
        }
    }
%>
</table>

<div class="actions">
    <a class="action-btn" href="<%=request.getContextPath()%>/User/Leaderboard.jsp">
        View Leaderboard
    </a>
    <a class="action-btn" href="<%=request.getContextPath()%>/User/UserDashboard.jsp">
        Back to Dashboard
    </a>
</div>

</body>
</html>

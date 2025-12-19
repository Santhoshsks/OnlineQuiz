<%@ page import="java.util.List, com.quiz.model.Question" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "question");
    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light";

    List<Question> questionList = (List<Question>) request.getAttribute("questionList");
%>

<body data-theme="<%= theme %>">

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Questions</title>
<style>
/* Theme variables */
body[data-theme="light"] {
    --bg: #f3f4f6;
    --text: #1f2937;
    --card: #ffffff;
    --header-bg: #e5e7eb;
    --row-even: #f9fafb;
    --row-odd: #ffffff;
    --accent: #3b82f6;
    --accent-hover: rgba(59,130,246,0.1);
}

body[data-theme="dark"] {
    --bg: #1f2933;
    --text: #f9fafb;
    --card: rgba(255,255,255,0.08);
    --header-bg: rgba(31,41,55,0.9);
    --row-even: rgba(55,65,81,0.8);
    --row-odd: rgba(31,41,55,0.8);
    --accent: #3b82f6;
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
    color: var(--accent);
    margin-bottom: 30px;
}

/* Table container */
.table-container {
    max-width: 1300px;
    margin: 0 auto 60px;
    overflow-x: auto;
    background: var(--card);
    border-radius: 16px;
    padding: 20px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    backdrop-filter: blur(12px);
}

/* Table styling */
.question-table {
    width: 100%;
    border-collapse: collapse;
}

.question-table th, .question-table td {
    padding: 12px 10px;
    text-align: left;
    border-bottom: 1px solid rgba(0,0,0,0.1);
}

.question-table th {
    background: var(--header-bg);
    font-weight: 600;
    color: var(--text);
    position: sticky;
    top: 0;
}

.question-table tr:nth-child(even) {
    background: var(--row-even);
}

.question-table tr:nth-child(odd) {
    background: var(--row-odd);
}

.question-table tr:hover {
    background-color: var(--accent-hover);
    cursor: default;
}

/* Pager */
.pager {
    text-align: center;
    margin: 20px 0 60px;
}

.pager a {
    text-decoration: none;
    color: var(--accent);
    font-weight: bold;
    margin: 0 12px;
    padding: 6px 14px;
    border-radius: 6px;
    background-color: var(--card);
    transition: all 0.2s ease;
}

.pager a:hover {
    background-color: var(--accent-hover);
}

.pager span {
    color: var(--accent);
    font-weight: bold;
    margin: 0 12px;
    padding: 6px 14px;
    border-radius: 6px;
    background-color: var(--card);
}

/* Responsive */
@media (max-width: 768px) {
    .question-table th, .question-table td {
        padding: 8px 6px;
        font-size: 13px;
    }

    .table-container {
        padding: 15px;
    }
}
</style>
</head>
<body>

<h2>All Questions</h2>

<div class="table-container">
    <table class="question-table">
        <thead>
            <tr>
                <th>Category</th>
                <th>Question Text</th>
                <th>A</th>
                <th>B</th>
                <th>C</th>
                <th>D</th>
                <th>Correct</th>
            </tr>
        </thead>
        <tbody>
            <%
                if(questionList != null && !questionList.isEmpty()) {
                    for(Question q : questionList) {
            %>
            <tr>
                <td><%= q.getCategory() %></td>
                <td><%= q.getQuestionText() %></td>
                <td><%= q.getOptionA() %></td>
                <td><%= q.getOptionB() %></td>
                <td><%= q.getOptionC() %></td>
                <td><%= q.getOptionD() %></td>
                <td><strong><%= q.getCorrectOption() %></strong></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7" style="text-align:center;">No questions found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<div class="pager">
    <span>Showing all questions</span>
</div>

</body>
</html>

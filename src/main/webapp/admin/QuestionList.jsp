<%@ page import="java.util.List, com.quiz.model.Question" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "question");
%>

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<%
    List<Question> questionList = (List<Question>) request.getAttribute("questionList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Questions</title>
<style>
body {
    margin: 0;
    padding-top: 70px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: linear-gradient(135deg, #1f2933, #374151);
    color: #f9fafb;
}

/* Heading */
h2 {
    text-align: center;
    color: #e5e7eb;
    margin-bottom: 30px;
}

/* Table */
.table-container {
    max-width: 1000px;
    margin: 0 auto 50px;
    overflow-x: auto;
}

.question-table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(31, 41, 55, 0.9);
    border-radius: 10px;
    overflow: hidden;
    color: #f9fafb;
}

.question-table th, .question-table td {
    border: 1px solid rgba(255,255,255,0.2);
    padding: 12px;
    text-align: left;
}

.question-table th {
    background-color: #1f2933;
    color: #f9fafb;
    font-weight: 600;
}

.question-table tr:nth-child(even) {
    background-color: rgba(55,65,81,0.8);
}

.question-table tr:nth-child(odd) {
    background-color: rgba(31,41,55,0.8);
}

.question-table tr:hover {
    background-color: rgba(59,130,246,0.3);
}

/* Pager */
.pager {
    text-align: center;
    margin: 20px 0 60px;
}

.pager a {
    text-decoration: none;
    color: #60a5fa;
    font-weight: bold;
    margin: 0 12px;
    padding: 6px 14px;
    border-radius: 6px;
    background-color: rgba(255,255,255,0.1);
    transition: all 0.2s ease;
}

.pager a:hover {
    background-color: rgba(96,165,250,0.3);
}

.pager span {
    color: #f87171;
    font-weight: bold;
    margin: 0 12px;
    padding: 6px 14px;
    border-radius: 6px;
    background-color: rgba(255,255,255,0.2);
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

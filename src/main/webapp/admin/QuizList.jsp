<%@ page import="java.util.List, com.quiz.model.Quiz, com.quiz.model.Question" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light";
%>
<body data-theme="<%= theme %>">

<%
    List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
    int currentPage = (int) request.getAttribute("currentPage");
    int totalPages = (int) request.getAttribute("totalPages");
%>

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Quiz List</title>
<style>
:root {
    --light-bg: #f3f4f6;
    --light-card: #ffffff;
    --light-text: #1f2937;
    --light-accent: #3b82f6;
    --light-accent-hover: rgba(59,130,246,0.15);

    --dark-bg: #1f2933;
    --dark-card: rgba(31,41,55,0.95);
    --dark-text: #f9fafb;
    --dark-accent: #2563eb;
    --dark-accent-hover: rgba(59,130,246,0.2);
}

body[data-theme="light"] {
    --bg: var(--light-bg);
    --card: var(--light-card);
    --text: var(--light-text);
    --accent: var(--light-accent);
    --accent-hover: var(--light-accent-hover);
}

body[data-theme="dark"] {
    --bg: var(--dark-bg);
    --card: var(--dark-card);
    --text: var(--dark-text);
    --accent: var(--dark-accent);
    --accent-hover: var(--dark-accent-hover);
}

body {
    margin: 0;
    padding-top: 70px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: var(--bg);
    color: var(--text);
}

h2 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 28px;
    font-weight: 700;
}

/* Quiz Card */
.quiz-card {
    max-width: 90%;
    margin: 25px auto;
    background: var(--card);
    border-radius: 20px;
    padding: 25px;
    box-shadow: 0 15px 40px rgba(0,0,0,0.25);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.quiz-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 25px 60px rgba(0,0,0,0.35);
}

.quiz-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    cursor: pointer;
}

.quiz-title {
    font-size: 24px;
    font-weight: 600;
}

.quiz-category {
    background: var(--accent);
    color: #fff;
    padding: 8px 16px;
    border-radius: 20px;
    font-size: 14px;
    font-weight: 500;
}

/* Questions as collapsible cards */
.question-card {
    background: var(--bg);
    border: 1px solid var(--accent-hover);
    border-radius: 12px;
    margin: 12px 0;
    padding: 15px 20px;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    cursor: pointer;
}

.question-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

.question-content {
    margin-top: 8px;
    display: none;
    padding-left: 10px;
}

/* Pagination */
.pager {
    text-align: center;
    margin: 40px 0;
}

.pager a, .pager span {
    padding: 10px 18px;
    border-radius: 12px;
    margin: 0 6px;
    text-decoration: none;
    font-weight: 600;
    transition: background 0.25s, color 0.25s;
}

.pager span {
    background: var(--accent);
    color: #fff;
}

.pager a {
    background: var(--card);
    color: var(--text);
}

.pager a:hover {
    background: var(--accent-hover);
    color: var(--text);
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px);}
    to { opacity: 1; transform: translateY(0);}
}
</style>
</head>
<body>

<h2>📘 Quiz List</h2>

<%
int index = (currentPage - 1) * 5 + 1;
for (Quiz quiz : quizzes) {
%>
<div class="quiz-card">
    <div class="quiz-header" onclick="toggleQuestions('<%=quiz.getId()%>')">
        <div class="quiz-title"><%= index++ %>. <%= quiz.getQuizName() %></div>
        <div class="quiz-category"><%= quiz.getCategory() %></div>
    </div>

    <div id="q<%=quiz.getId()%>" class="question-section">
        <%
        int qNum = 1;
        for (Question q : quiz.getQuestions()) {
        %>
        <div class="question-card" onclick="toggleQuestionContent(this)">
            <strong>Q<%=qNum++%>:</strong> <%= q.getQuestionText() %>
            <div class="question-content">
                <p>A: <%= q.getOptionA() %></p>
                <p>B: <%= q.getOptionB() %></p>
                <p>C: <%= q.getOptionC() %></p>
                <p>D: <%= q.getOptionD() %></p>
                <p><strong>Answer: <%= q.getCorrectOption() %></strong></p>
            </div>
        </div>
        <% } %>
    </div>
</div>
<% } %>

<!-- Pagination -->
<div class="pager">
<% for (int i = 1; i <= totalPages; i++) { %>
    <% if (i == currentPage) { %>
        <span><%= i %></span>
    <% } else { %>
        <a href="<%=request.getContextPath()%>/admin/quiz-list?page=<%=i%>"><%= i %></a>
    <% } %>
<% } %>
</div>

<script>
function toggleQuestions(id) {
    const el = document.getElementById("q" + id);
    el.style.display = el.style.display === "block" ? "none" : "block";
}

function toggleQuestionContent(card) {
    const content = card.querySelector('.question-content');
    if (content.style.display === "block") {
        content.style.display = "none";
    } else {
        content.style.display = "block";
    }
}
</script>

</body>
</html>

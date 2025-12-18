<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setAttribute("pageContext", "user");
%>

<jsp:include page="/common/navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attempt Quiz</title>

<style>
/* =========================
   PAGE
========================= */
body {
    margin: 0;
    padding-top: 70px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: linear-gradient(135deg, #1f2933, #374151);
    color: #f9fafb;
}

/* =========================
   TITLE
========================= */
h2 {
    text-align: center;
    margin: 30px 0;
    font-size: 26px;
    color: #93c5fd;
}

/* =========================
   QUIZ CARD
========================= */
form {
    max-width: 900px;
    margin: 0 auto 60px;
    background: rgba(17, 24, 39, 0.95);
    padding: 30px 35px;
    border-radius: 16px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.45);
}

/* =========================
   QUESTION
========================= */
.question {
    font-size: 17px;
    font-weight: 600;
    margin-bottom: 14px;
    margin-top: 30px;
    color: #e5e7eb;
}

/* =========================
   OPTIONS
========================= */
.option {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 12px 14px;
    margin-bottom: 10px;
    border-radius: 10px;
    border: 1px solid rgba(255,255,255,0.15);
    background: rgba(31, 41, 55, 0.85);
    cursor: pointer;
    transition: all 0.2s ease;
}

.option:hover {
    background: rgba(59, 130, 246, 0.25);
    border-color: #60a5fa;
}

/* Hide default radio */
.option input[type="radio"] {
    accent-color: #3b82f6;
    transform: scale(1.15);
}

/* =========================
   SUBMIT BUTTON
========================= */
input[type="submit"] {
    display: block;
    margin: 40px auto 0;
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    color: white;
    border: none;
    padding: 14px 40px;
    border-radius: 999px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.25s ease;
    box-shadow: 0 8px 20px rgba(59,130,246,0.45);
}

input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 25px rgba(59,130,246,0.65);
}

/* =========================
   MOBILE
========================= */
@media (max-width: 600px) {
    form {
        padding: 22px;
    }

    h2 {
        font-size: 22px;
    }

    .question {
        font-size: 15px;
    }
}
</style>
</head>

<body>

<h2>📝 Attempt Quiz</h2>

<%
    List<Map<String,Object>> questions =
        (List<Map<String,Object>>) session.getAttribute("questions");

    if (questions == null) {
        response.sendRedirect("User/UserDashboard.jsp");
        return;
    }
%>

<form action="<%=request.getContextPath() %>/submitQuiz" method="post">

<%
    int qNo = 1;
    for (Map<String,Object> q : questions) {
%>

    <p class="question">
        <%= qNo++ %>. <%= q.get("question_text") %>
    </p>

    <label class="option">
        <input type="radio" name="q<%= q.get("id") %>" value="A" required>
        <span><%= q.get("option_a") %></span>
    </label>

    <label class="option">
        <input type="radio" name="q<%= q.get("id") %>" value="B">
        <span><%= q.get("option_b") %></span>
    </label>

    <label class="option">
        <input type="radio" name="q<%= q.get("id") %>" value="C">
        <span><%= q.get("option_c") %></span>
    </label>

    <label class="option">
        <input type="radio" name="q<%= q.get("id") %>" value="D">
        <span><%= q.get("option_d") %></span>
    </label>

<% } %>

<input type="submit" value="Submit Quiz">

</form>

</body>
</html>

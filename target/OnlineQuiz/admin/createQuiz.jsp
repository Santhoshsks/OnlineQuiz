<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.quiz.dao.QuizDAO" %>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "quiz");

    QuizDAO dao = new QuizDAO();
    List<String> categories = dao.getAllCategories();

    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light";
%>
<body data-theme="<%= theme %>">

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Quiz</title>
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
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.container {
    background: var(--card);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    padding: 40px 35px;
    border-radius: 20px;
    box-shadow: 0 18px 40px rgba(0,0,0,0.35);
    width: 400px;
    text-align: center;
    animation: fadeIn 0.5s ease-in-out;
    transition: all 0.3s ease;
}

@keyframes fadeIn {
    from {opacity: 0; transform: translateY(15px);}
    to {opacity: 1; transform: translateY(0);}
}

h2 {
    font-size: 26px;
    font-weight: 700;
    margin-bottom: 25px;
    color: var(--text);
}

label {
    display: block;
    text-align: left;
    font-weight: 600;
    margin-top: 15px;
    margin-bottom: 5px;
    color: var(--text);
}

input[type="text"], select {
    width: 100%;
    padding: 12px;
    border-radius: 10px;
    border: 1px solid rgba(0,0,0,0.15);
    background: rgba(255,255,255,0.1);
    color: var(--text);
    font-size: 15px;
    outline: none;
    transition: 0.3s ease;
    appearance: none;
}

input[type="text"]:focus, select:focus {
    border-color: var(--accent);
    box-shadow: 0 0 0 3px rgba(59,130,246,0.25);
}

button {
    margin-top: 25px;
    width: 100%;
    padding: 12px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    background: linear-gradient(135deg, var(--accent), var(--accent-hover));
    border: none;
    border-radius: 12px;
    cursor: pointer;
    box-shadow: 0 6px 18px rgba(59,130,246,0.5);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

button:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 30px rgba(59,130,246,0.7);
}

select option {
    color: #000;
}

.footer {
    margin-top: 20px;
    font-size: 13px;
    color: rgba(255,255,255,0.5);
}
</style>
</head>
<body>
    <div class="container">
        <h2>Create New Quiz</h2>
        <form action="../CreateQuizServlet" method="post">
            <label for="title">Quiz Title</label>
            <input type="text" id="title" name="title" placeholder="Enter quiz title" required>

            <label for="category">Category</label>
            <select id="category" name="category" required>
                <option value="" disabled selected>--- Select Category ---</option>
                <%
                    for(String cat : categories) {
                %>
                    <option value="<%=cat%>"><%=cat%></option>
                <%
                    }
                %>
            </select>

            <button type="submit">Create Quiz</button>
        </form>
        <div class="footer">My Quiz Portal</div>
    </div>
</body>
</html>

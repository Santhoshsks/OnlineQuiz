<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.quiz.dao.QuizDAO" %>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "quiz");
%>
<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<%
    QuizDAO dao = new QuizDAO();
    List<String> categories = dao.getAllCategories();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Quiz</title>

<style>
    body {
        margin: 0;
        padding-top: 70px;
        font-family: "Inter", "Segoe UI", sans-serif;
        background: linear-gradient(135deg, #1f2933, #374151);
        color: #f9fafb;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background: rgba(255,255,255,0.08);
        backdrop-filter: blur(14px);
        -webkit-backdrop-filter: blur(14px);
        padding: 40px 35px;
        border-radius: 20px;
        box-shadow: 0 18px 40px rgba(0,0,0,0.5);
        width: 380px;
        text-align: center;
        animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(15px);}
        to {opacity: 1; transform: translateY(0);}
    }

    h2 {
        font-size: 26px;
        font-weight: 700;
        margin-bottom: 25px;
        color: #f9fafb;
    }

    label {
        display: block;
        text-align: left;
        font-weight: 600;
        margin-top: 15px;
        margin-bottom: 5px;
        color: rgba(255,255,255,0.85);
    }

    input[type="text"], select {
        width: 100%;
        padding: 12px;
        border-radius: 10px;
        border: 1px solid rgba(255,255,255,0.3);
        background: rgba(255,255,255,0.1);
        color: #f9fafb;
        font-size: 15px;
        outline: none;
        transition: 0.3s ease;
        appearance: none;
    }

    input[type="text"]:focus, select:focus {
        border-color: #3b82f6;
        box-shadow: 0 0 0 3px rgba(59,130,246,0.3);
    }

    button {
        margin-top: 25px;
        width: 100%;
        padding: 12px;
        font-size: 16px;
        font-weight: 600;
        color: #fff;
        background: linear-gradient(135deg, #3b82f6, #2563eb);
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
        <div class="footer">
            Online Quiz Portal by Srinithi
        </div>
    </div>
</body>
</html>

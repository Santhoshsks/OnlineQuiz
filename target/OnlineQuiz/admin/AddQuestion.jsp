<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "question");
%>
<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Question</title>
<style>
  body {
    margin: 0;
    padding-top: 70px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: linear-gradient(135deg, #1f2933, #374151);
    color: #f9fafb;
  }

  h2.page-title {
    text-align: center;
    font-size: 28px;
    color: #3b82f6;
    margin-bottom: 30px;
  }

  main.content {
    max-width: 600px;
    margin: 0 auto 50px auto;
    padding: 0 15px;
  }

  form {
    background: rgba(255,255,255,0.08);
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.35);
  }

  label {
    display: block;
    font-weight: 600;
    margin-top: 15px;
    color: #e5e7eb;
  }

  input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    border-radius: 8px;
    border: 1px solid rgba(255,255,255,0.25);
    background: rgba(255,255,255,0.1);
    color: #f9fafb;
    font-size: 14px;
    outline: none;
  }

  option {
      background-color: #1f2933; /* dark background for dropdown items */
      color: #f9fafb; /* white text */
  }

  select {
      width: 100%;
      padding: 10px;
      margin-top: 6px;
      border-radius: 8px;
      border: 1px solid rgba(255,255,255,0.25);
      background: rgba(255,255,255,0.1); /* semi-transparent dark-ish background */
      color: #f9fafb; /* white text */
      font-size: 14px;
      outline: none;
      appearance: none; /* removes default arrow on some browsers */
  }

  select::-ms-expand {
      display: none;
  }

  textarea {
    resize: none;
  }

  input[type="submit"] {
    margin-top: 20px;
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    color: white;
    cursor: pointer;
    box-shadow: 0 6px 18px rgba(59,130,246,0.5);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }

  input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 30px rgba(59,130,246,0.7);
  }

  .message {
    text-align: center;
    font-weight: bold;
    margin-bottom: 15px;
  }

  .success { color: #4ade80; }
  .error { color: #f87171; }

  a.back-link {
    display: block;
    text-align: center;
    margin-top: 20px;
    color: #3b82f6;
    text-decoration: none;
    font-weight: 500;
  }

  a.back-link:hover {
    text-decoration: underline;
  }

  @media (max-width: 600px) {
    form {
      padding: 20px;
    }

    input[type="submit"] {
      font-size: 15px;
    }
  }
</style>
</head>

<body>

<main class="content">
  <h2 class="page-title">Add New Question</h2>

  <%
      String success = request.getParameter("success");
      String error = request.getParameter("error");
      if (success != null) {
  %>
    <p class="message success"><%= success %></p>
  <% } else if (error != null) { %>
    <p class="message error"><%= error %></p>
  <% } %>

  <form action="/OnlineQuiz/AddQuestionServlet" method="post">
    <label>Category:</label>
    <select name="category" required>
      <option value="">--Select Category--</option>
      <option value="Java">Java</option>
      <option value="Python">Python</option>
      <option value="Web Development">Web Development</option>
      <option value="Databases">Databases</option>
      <option value="Networking">Networking</option>
    </select>

    <label>Question Text:</label>
    <textarea name="questionText" rows="3" required></textarea>

    <label>Option A:</label>
    <input type="text" name="optionA" required>

    <label>Option B:</label>
    <input type="text" name="optionB" required>

    <label>Option C:</label>
    <input type="text" name="optionC" required>

    <label>Option D:</label>
    <input type="text" name="optionD" required>

    <label>Correct Option:</label>
    <select name="correctOption" required>
      <option value="">--Select Correct Option--</option>
      <option value="A">Option A</option>
      <option value="B">Option B</option>
      <option value="C">Option C</option>
      <option value="D">Option D</option>
    </select>

    <input type="submit" value="Add Question">
  </form>

  <a href="<%=request.getContextPath()%>/admin/dashboard" class="back-link">
    ⬅ Back to Dashboard
  </a>
</main>

</body>
</html>

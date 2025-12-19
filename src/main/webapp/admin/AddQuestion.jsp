<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageContext", "admin");
    request.setAttribute("activeMenu", "question");
    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light";
%>
<body data-theme="<%= theme %>">

<jsp:include page="/common/navbar.jsp"/>
<jsp:include page="/common/adminSidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Question</title>
<style>
/* Theme variables */
body[data-theme="light"] {
    --bg: #f3f4f6;
    --text: #1f2937;
    --card: #ffffff;
    --input-bg: #ffffff;
    --input-border: #d1d5db;
    --accent: #3b82f6;
    --accent-hover: rgba(59,130,246,0.15);
    --placeholder: #6b7280;
}

body[data-theme="dark"] {
    --bg: #1f2933;
    --text: #f9fafb;
    --card: rgba(255,255,255,0.08);
    --input-bg: rgba(255,255,255,0.1);
    --input-border: rgba(255,255,255,0.25);
    --accent: #3b82f6;
    --accent-hover: rgba(59,130,246,0.2);
    --placeholder: #9ca3af;
}

body {
    margin: 0;
    padding-top: 70px;
    font-family: "Inter", "Segoe UI", sans-serif;
    background: var(--bg);
    color: var(--text);
}

/* Page container */
main.content {
    max-width: 600px;
    margin: 40px auto 60px auto;
    padding: 0 15px;
}

/* Page title */
h2.page-title {
    text-align: center;
    font-size: 28px;
    color: var(--accent);
    margin-bottom: 30px;
}

/* Form styling */
form {
    background: var(--card);
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.35);
    display: flex;
    flex-direction: column;
}

/* Labels */
label {
    display: block;
    font-weight: 600;
    margin-top: 15px;
    color: var(--text);
}

/* Inputs, textareas, selects */
input[type="text"],
textarea,
select {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    border-radius: 8px;
    border: 1px solid var(--input-border);
    background: var(--input-bg);
    color: var(--text);
    font-size: 14px;
    outline: none;
    transition: border-color 0.2s, box-shadow 0.2s;
}

input[type="text"]::placeholder,
textarea::placeholder,
select option {
    color: var(--placeholder);
}

/* Focus styles */
input[type="text"]:focus,
textarea:focus,
select:focus {
    border-color: var(--accent);
    box-shadow: 0 0 0 3px var(--accent-hover);
}

/* Selection */
::selection {
    background: var(--accent);
    color: #ffffff;
}

input::selection,
textarea::selection,
select::selection {
    background: var(--accent);
    color: #ffffff;
}

/* Textarea */
textarea {
    resize: none;
}

/* Submit button */
input[type="submit"] {
    margin-top: 20px;
    width: 100%;
    padding: 12px;
    background: var(--accent);
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

/* Messages */
.message {
    text-align: center;
    font-weight: bold;
    margin-bottom: 15px;
}

.success { color: #4ade80; }
.error { color: #f87171; }

/* Back link */
a.back-link {
    display: block;
    text-align: center;
    margin-top: 20px;
    color: var(--accent);
    text-decoration: none;
    font-weight: 500;
}

a.back-link:hover {
    text-decoration: underline;
}

/* Responsive */
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
    <textarea name="questionText" rows="3" placeholder="Enter the question..." required></textarea>

    <label>Option A:</label>
    <input type="text" name="optionA" placeholder="Option A" required>

    <label>Option B:</label>
    <input type="text" name="optionB" placeholder="Option B" required>

    <label>Option C:</label>
    <input type="text" name="optionC" placeholder="Option C" required>

    <label>Option D:</label>
    <input type="text" name="optionD" placeholder="Option D" required>

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

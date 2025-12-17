<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageContext", "admin");
%>
<jsp:include page="/common/navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Question</title>

<style>
  body {
    font-family: 'Segoe UI', sans-serif;
    background-color: #f2f5fa;
    margin: 0;
    padding: 0;
  }

  /* Header */
  header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 55px;
    background-color: #004aad;
    color: white;
    display: flex;
    align-items: center;
    padding: 0 20px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    z-index: 1001;
  }

  header h2 {
    margin: 0;
    font-size: 18px;
  }

  .burger {
    width: 25px;
    height: 20px;
    cursor: pointer;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    margin-right: 15px;
  }

  .burger div {
    height: 3px;
    background-color: white;
    border-radius: 2px;
  }

  /* Sidebar */
  nav.sidebar {
    position: fixed;
    top: 55px;
    left: -220px;
    width: 220px;
    height: calc(100vh - 55px);
    background-color: #1e2a38;
    padding-top: 20px;
    transition: left 0.3s ease;
    z-index: 1000;
  }

  nav.sidebar.open {
    left: 0;
  }

  nav.sidebar button {
    background: none;
    border: none;
    color: #f5f5f5;
    padding: 12px 20px;
    text-align: left;
    font-size: 15px;
    width: 100%;
    cursor: pointer;
    transition: background 0.2s ease;
  }

  nav.sidebar button:hover {
    background-color: #2e3b4a;
  }

  /* Main Content */
  main.content {
    padding: 80px 20px;
    max-width: 600px;
    margin: auto;
  }

  form {
    background-color: #ffffff;
    padding: 25px 30px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
  }

  label {
    font-weight: 600;
    margin-top: 12px;
    display: block;
    color: #333;
  }

  input[type="text"],
  textarea,
  select {
    width: 100%;
    padding: 8px;
    margin-top: 6px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
  }

  textarea {
    resize: none;
  }

  input[type="submit"] {
    background-color: #004aad;
    color: white;
    border: none;
    padding: 10px 16px;
    margin-top: 20px;
    cursor: pointer;
    border-radius: 6px;
    font-size: 15px;
    width: 100%;
    transition: background 0.2s ease;
  }

  input[type="submit"]:hover {
    background-color: #003580;
  }

  .message {
    text-align: center;
    font-weight: bold;
    margin-bottom: 15px;
  }

  .success { color: green; }
  .error { color: red; }

  a.back-link {
    display: block;
    text-align: center;
    margin-top: 15px;
    color: #004aad;
    text-decoration: none;
    font-weight: 500;
  }

  a.back-link:hover {
    text-decoration: underline;
  }

  @media (max-width: 600px) {
    main.content {
      padding: 75px 10px 20px;
    }

    form {
      padding: 15px;
    }

    input[type="submit"] {
      width: 100%;
    }
  }
</style>
</head>

<body>

  <!-- Header -->
  <header>
    <div class="burger" id="burger">
      <div></div>
      <div></div>
      <div></div>
    </div>
    <h2>Add New Question</h2>
  </header>

  <!-- Sidebar -->
  <nav class="sidebar" id="sidebar">
    <button onclick="window.location.href='AdminDashboard.jsp'"> Dashboard</button>
    <button onclick="window.location.href='AdminLogin.jsp'"> Logout</button>
    <button onclick="window.location.href='/OnlineQuiz/QuestionListServlet'"> Question List</button>
  </nav>

  <!-- Content -->
  <main class="content">

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

    <a href="<%=request.getContextPath()%>/admin/AdminDashboard.jsp" class="back-link">
      ⬅ Back to Dashboard
    </a>
  </main>

  <script>
    const burger = document.getElementById('burger');
    const sidebar = document.getElementById('sidebar');

    burger.addEventListener('click', () => {
      sidebar.classList.toggle('open');
    });
  </script>

</body>
</html>

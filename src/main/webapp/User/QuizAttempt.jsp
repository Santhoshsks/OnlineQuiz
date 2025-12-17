<%@ page import="java.util.*" %>
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
  body {
    font-family: 'Segoe UI', sans-serif;
    background-color: #f2f5fa;
    margin: 0;
    padding: 0;
  }

  h2 {
    text-align: center;
    margin-top: 40px;
    color: #004aad;
  }

  form {
    background-color: #fff;
    max-width: 700px;
    margin: 2rem auto;
    padding: 25px 30px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
  }

  p.question {
    font-weight: 600;
    margin-bottom: 10px;
  }

  .option {
    display: block;
    padding: 8px 12px;
    margin-bottom: 8px;
    border: 1px solid #ccc;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.2s;
    background-color: #f8f9fb;
  }

  .option:hover {
    background-color: #e3f2fd;
    border-color: #004aad;
  }

  input[type="radio"] {
    margin-right: 8px;
  }

  input[type="submit"] {
    display: block;
    margin: 20px auto 0 auto;
    background-color: #004aad;
    color: white;
    border: none;
    padding: 12px 25px;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
    transition: 0.2s;
  }

  input[type="submit"]:hover {
    background-color: #003580;
  }

  @media (max-width: 600px) {
    form {
      padding: 20px;
    }

    input[type="submit"] {
      width: 100%;
      padding: 10px;
    }
  }
</style>
</head>
<body>
<jsp:include page="UserHeader.jsp" />

<h2>Quiz Attempt</h2>

<%
    List<Map<String,Object>> questions = (List<Map<String,Object>>) session.getAttribute("questions");
    if (questions == null) { response.sendRedirect("User/UserDashboard.jsp"); return; }
%>

<form action="<%=request.getContextPath() %>/submitQuiz" method="post">
<%
    int qNo = 1;
    for (Map<String,Object> q : questions) {
%>
    <p class="question"><%= qNo++ %>. <%= q.get("question_text") %></p>
    <label class="option">
      <input type="radio" name="q<%= q.get("id") %>" value="A"> <%= q.get("option_a") %>
    </label>
    <label class="option">
      <input type="radio" name="q<%= q.get("id") %>" value="B"> <%= q.get("option_b") %>
    </label>
    <label class="option">
      <input type="radio" name="q<%= q.get("id") %>" value="C"> <%= q.get("option_c") %>
    </label>
    <label class="option">
      <input type="radio" name="q<%= q.get("id") %>" value="D"> <%= q.get("option_d") %>
    </label>
<% } %>

<input type="submit" value="Submit Quiz">
</form>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.quiz.dao.QuizDAO" %>
<%
    request.setAttribute("pageContext", "admin");
%>
<jsp:include page="/common/navbar.jsp"/>

<%
    QuizDAO dao = new QuizDAO();
    List<String> categories = dao.getAllCategories();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #FFDFE9;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .container {
        background-color: white;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        width: 350px;
        text-align: center;
    }
    h2 {
        color: #2d3436;
        margin-bottom: 20px;
    }
    label {
        display: block;
        margin-top: 10px;
        font-weight: bold;
        text-align: left;
        color: #2d3436;
    }
    input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #b2bec3;
        border-radius: 6px;
        font-size: 14px;
    }
    button {
        margin-top: 20px;
        width: 100%;
        padding: 10px;
        background-color: #0984e3;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
    }
    button:hover {
        background-color: #74b9ff;
    }
    select {
	    width: 100%;
	    padding: 8px;
	    margin-top: 5px;
	    border: 1px solid #b2bec3;
	    border-radius: 6px;
	    font-size: 14px;
	    background-color: white;
	    appearance: none;
	}
	.footer {
            margin-top: 20px;
            font-size: 13px;
            color: #777;
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
            © 2025 Online Quiz Portal by Srinithi
        </div>
    </div>
    
</body>
</html>
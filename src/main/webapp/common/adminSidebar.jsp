<%@ page contentType="text/html; charset=UTF-8" %>

<style>
    /* ☰ Trigger */
    .menu-trigger {
        position: fixed;
        top: 82px;
        left: 20px;
        font-size: 28px;
        cursor: pointer;
        z-index: 1200;
        color: #e5e7eb;
        transition: opacity 0.3s ease;
    }

    .menu-trigger.hidden {
        opacity: 0;
        visibility: hidden;
    }

    /* Sidebar */
    .sidebar {
        position: fixed;
        top: 70px;
        left: 0;
        height: calc(100vh - 70px);
        width: 0;
        background: rgba(17, 24, 39, 0.96);
        backdrop-filter: blur(10px);
        overflow-x: hidden;
        transition: width 0.3s ease;
        z-index: 1100;
        padding-top: 70px;
        box-shadow: 4px 0 20px rgba(0,0,0,0.4);
    }

    .sidebar.open {
        width: 260px;
    }

    /* Close button */
    .close-btn {
        position: absolute;
        top: 18px;
        right: 20px;
        font-size: 30px;
        cursor: pointer;
        color: #f9fafb;
    }

    /* Menu items */
    .menu-item > a {
        display: block;
        padding: 14px 30px;
        color: #e5e7eb;
        font-size: 16px;
        text-decoration: none;
        transition: background 0.2s;
    }

    .menu-item > a:hover {
        background: rgba(255,255,255,0.12);
    }

    .sub-menu {
        display: none;
        background: rgba(255,255,255,0.06);
    }

    .sub-menu a {
        padding: 12px 45px;
        font-size: 14px;
        color: #d1d5db;
        display: block;
        text-decoration: none;
    }

    .sub-menu a:hover {
        background: rgba(255,255,255,0.1);
    }
</style>

<!-- ☰ Trigger -->
<div id="menuTrigger" class="menu-trigger" onclick="openMenu()">☰</div>

<!-- Sidebar -->
<div id="sidebar" class="sidebar">
    <span class="close-btn" onclick="closeMenu()">&times;</span>

    <div class="menu-item">
        <a href="javascript:void(0)" onclick="toggleSubMenu('quizSub')">
            Quiz Manager ▾
        </a>
        <div id="quizSub" class="sub-menu">
            <a href="<%=request.getContextPath()%>/admin/QuizList.jsp">Quiz List</a>
            <a href="<%=request.getContextPath()%>/admin/createQuiz.jsp">Create Quiz</a>
        </div>
    </div>

    <div class="menu-item">
        <a href="javascript:void(0)" onclick="toggleSubMenu('questionSub')">
            Question Manager ▾
        </a>
        <div id="questionSub" class="sub-menu">
            <a href="<%=request.getContextPath()%>/AddQuestion.jsp">Add Questions</a>
            <a href="<%=request.getContextPath()%>/QuestionListServlet">Question List</a>
        </div>
    </div>

    <div class="menu-item">
        <a href="<%=request.getContextPath()%>/User/Leaderboard.jsp">Leaderboard</a>
    </div>
</div>

<script>
    function openMenu() {
        document.getElementById("sidebar").classList.add("open");
        document.getElementById("menuTrigger").classList.add("hidden");
    }

    function closeMenu() {
        document.getElementById("sidebar").classList.remove("open");
        setTimeout(() => {
            document.getElementById("menuTrigger").classList.remove("hidden");
        }, 250);
    }

    function toggleSubMenu(id) {
        const el = document.getElementById(id);
        el.style.display = (el.style.display === "block") ? "none" : "block";
    }
</script>

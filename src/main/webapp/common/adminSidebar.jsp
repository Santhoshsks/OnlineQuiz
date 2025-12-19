<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String theme = (String) session.getAttribute("theme");
    if (theme == null) theme = "light";
%>
<body data-theme="<%= theme %>">

<%
    String activeMenu = (String) request.getAttribute("activeMenu");
    if (activeMenu == null) activeMenu = "";
%>

<style>
/* =========================
   THEME VARIABLES
========================= */
:root {
    --sidebar-bg: #020617;
    --sidebar-border: rgba(255,255,255,0.12);
    --text: #e5e7eb;
    --muted: #9ca3af;
    --accent: #60a5fa;
    --hover: rgba(255,255,255,0.08);
}

body[data-theme="light"] {
    --sidebar-bg: #f8fafc;
    --sidebar-border: #e5e7eb;
    --text: #0f172a;
    --muted: #475569;
    --accent: #2563eb;
    --hover: rgba(0,0,0,0.06);
}

/* =========================
   MENU TRIGGER
========================= */
.menu-trigger {
    position: fixed;
    top: 82px;
    left: 20px;
    font-size: 26px;
    cursor: pointer;
    z-index: 1200;
    color: var(--text);
    transition: transform 0.3s ease, opacity 0.3s ease;
}

.menu-trigger.hidden {
    opacity: 0;
    pointer-events: none;
    transform: rotate(90deg);
}

/* =========================
   SIDEBAR
========================= */
.sidebar {
    position: fixed;
    top: 70px;
    left: 0;
    height: calc(100vh - 70px);
    width: 0;
    background: var(--sidebar-bg);
    border-right: 1px solid var(--sidebar-border);
    overflow: hidden;
    transition: width 0.35s ease;
    z-index: 1100;
    padding-top: 80px;
    box-shadow: 6px 0 25px rgba(0,0,0,0.35);
}

.sidebar.open {
    width: 270px;
}

/* =========================
   CLOSE BUTTON
========================= */
.close-btn {
    position: absolute;
    top: 18px;
    right: 20px;
    font-size: 28px;
    cursor: pointer;
    color: var(--text);
    transition: transform 0.3s ease;
}

.close-btn:hover {
    transform: rotate(90deg);
}

/* =========================
   MENU ITEMS
========================= */
.menu-item > a {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 14px 30px;
    color: var(--text);
    font-size: 15px;
    text-decoration: none;
    transition: background 0.25s ease, color 0.25s ease;
    white-space: nowrap;
}

.menu-item > a:hover {
    background: var(--hover);
}

/* ACTIVE MENU */
.menu-item.active > a {
    background: rgba(59,130,246,0.15);
    color: var(--accent);
    font-weight: 600;
    border-left: 4px solid var(--accent);
}

/* ICONS */
.menu-icon {
    font-size: 18px;
    opacity: 0.85;
}

/* =========================
   SUB MENU
========================= */
.sub-menu {
    display: none;
    background: rgba(0,0,0,0.05);
}

.sub-menu a {
    padding: 12px 50px;
    font-size: 14px;
    color: var(--muted);
    display: block;
    text-decoration: none;
    transition: background 0.25s;
}

.sub-menu a:hover {
    background: var(--hover);
    color: var(--text);
}

/* =========================
   SMOOTH SUBMENU ANIMATION
========================= */
.sub-menu.show {
    display: block;
    animation: slideDown 0.25s ease;
}

@keyframes slideDown {
    from { opacity: 0; transform: translateY(-6px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>

<!-- ☰ MENU TRIGGER -->
<div id="menuTrigger" class="menu-trigger" onclick="openMenu()">☰</div>

<!-- SIDEBAR -->
<div id="sidebar" class="sidebar">

    <span class="close-btn" onclick="closeMenu()">×</span>

    <!-- Dashboard -->
    <div class="menu-item <%= "dashboard".equals(activeMenu) ? "active" : "" %>">
        <a href="<%=request.getContextPath()%>/admin/dashboard">
            <span class="menu-icon">📊</span> Dashboard
        </a>
    </div>

    <!-- Quiz Manager -->
    <div class="menu-item <%= "quiz".equals(activeMenu) ? "active" : "" %>">
        <a href="javascript:void(0)" onclick="toggleSubMenu('quizSub')">
            <span class="menu-icon">🧠</span> Quiz Manager
        </a>
        <div id="quizSub" class="sub-menu <%= "quiz".equals(activeMenu) ? "show" : "" %>">
            <a href="<%=request.getContextPath()%>/admin/quiz-list">📄 Quiz List</a>
            <a href="<%=request.getContextPath()%>/admin/createQuiz.jsp">➕ Create Quiz</a>
        </div>
    </div>

    <!-- Question Manager -->
    <div class="menu-item <%= "question".equals(activeMenu) ? "active" : "" %>">
        <a href="javascript:void(0)" onclick="toggleSubMenu('questionSub')">
            <span class="menu-icon">❓</span> Question Manager
        </a>
        <div id="questionSub" class="sub-menu <%= "question".equals(activeMenu) ? "show" : "" %>">
            <a href="<%=request.getContextPath()%>/admin/AddQuestion.jsp">➕ Add Questions</a>
            <a href="<%=request.getContextPath()%>/QuestionListServlet">📋 Question List</a>
        </div>
    </div>

    <!-- Leaderboard -->
    <div class="menu-item <%= "leaderboard".equals(activeMenu) ? "active" : "" %>">
        <a href="<%=request.getContextPath()%>/admin/leaderboard.jsp">
            <span class="menu-icon">🏆</span> Leaderboard
        </a>
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
    }, 300);
}

function toggleSubMenu(id) {
    document.getElementById(id).classList.toggle("show");
}
</script>

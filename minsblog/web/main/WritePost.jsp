<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sangminlee
  Date: 2020/01/18
  Time: 3:58 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-145824378-2"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-145824378-2');
    </script>


    <title>Min's TIL Blog</title>
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="stylesheet" href="/main/lib/material-icons.css">
    <link rel="stylesheet" href="/main/lib/base16-light.css">
    <link rel="stylesheet" href="/main/codemirror/lib/codemirror.css">
    <link rel="stylesheet" href="/main/lib/default.css">
    <link rel="stylesheet" href="/main/lib/github-markdown.css">
    <link rel="stylesheet" href="/main/lib/spell-checker.min.css">
    <link rel="stylesheet" href="/main/lib/sweetalert.css">
    <link rel="stylesheet" href="/main/index.css">
    <!-- Custom styles for this template -->
    <link href="/main/css/sb-admin-2.min.css" rel="stylesheet">

    <script>
        function setValue(target) {
            document.getElementById('categoryButtonId').innerHTML = target.innerHTML;
        }
    </script>
    <script>
        window.onload = function () {
            var savebutton = document.getElementById('browsersavebutton');
            savebutton.onclick = function () {
                if (document.getElementById('titleInputId').value === '') {
                    alert('제목을 반드시 입력해주세요.');
                } else if (document.getElementById('categoryButtonId').innerHTML === 'Category') {
                    alert('카테고리를 반드시 선택해주세요.');
                } else {
                    document.getElementById('titleId').value = document.getElementById('titleInputId').value;
                    document.getElementById('categoryId').value = document.getElementById('categoryButtonId').innerHTML;
                    document.getElementById('htmlContentId').value = document.getElementById('out').innerHTML;
                    document.getElementById('markdownContentId').value = editor.getValue();
                    document.getElementById('context').submit();
                }
            }
        };
    </script>
</head>
<body id="toplevel">
<form id="context" method="post" action="add.do">
    <input id="titleId" name="title" type="hidden">
    <input id="categoryId" name="name" type="hidden">
    <input id="htmlContentId" name="htmlContent" type="hidden">
    <input id="markdownContentId" name="markdownContent" type="hidden">
</form>
<div id="in">
    <textarea id="code" name="content"></textarea>
</div>
<div id="out" class="markdown-body"></div>
<div id="menu">
    <span>Save As</span>
    <div id="saveas-markdown">
        <svg height="64" width="64" xmlns="http://www.w3.org/2000/svg">
            <g transform="scale(0.0625)">
                <path d="M950.154 192H73.846C33.127 192 0 225.12699999999995 0 265.846v492.308C0 798.875 33.127 832 73.846 832h876.308c40.721 0 73.846-33.125 73.846-73.846V265.846C1024 225.12699999999995 990.875 192 950.154 192zM576 703.875L448 704V512l-96 123.077L256 512v192H128V320h128l96 128 96-128 128-0.125V703.875zM767.091 735.875L608 512h96V320h128v192h96L767.091 735.875z"/>
            </g>
        </svg>
        <span>Markdown</span>
    </div>
    <div id="saveas-html">
        <svg height="64" width="64" xmlns="http://www.w3.org/2000/svg">
            <g transform="scale(0.0625) translate(64,0)">
                <path d="M608 192l-96 96 224 224L512 736l96 96 288-320L608 192zM288 192L0 512l288 320 96-96L160 512l224-224L288 192z"/>
            </g>
        </svg>
        <span>HTML</span>
    </div>
    <a id="close-menu">&times;</a>
</div>
<div id="navbar">
    <div id="navcontent">
        <a id="logo" href="${pageContext.request.contextPath}/category/list.do?cid=Main"
           tooltip="Check out the code on Github!">
            <p id="title" class="left">Min's Blog</p>
        </a>
        <p id="browsersavebutton" title="Browser Save (Experimental)" class="navbutton left"><a><i
                style="color: aliceblue" class="material-icons">save</i></a></p>
        <p id="sharebutton" title="Generate Shareable Link" class="navbutton left"><a
                href="${pageContext.request.contextPath}/category/list.do?cid=Main"><i
                style="color: aliceblue" class="material-icons">cancel</i></a></p>
        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-1 my-md-0 mw-100 navbar-search">
            <div class="input-group">
                <input id="titleInputId" type="text" class="form-control bg-light border-30small" placeholder="제목"
                       aria-label="Search"
                       aria-describedby="basic-addon2">
                <button id="categoryButtonId" class="btn btn-primary dropdown-toggle" type="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Category
                </button>
                <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                    <c:forEach var="category" items="${categories}">
                        <a class="dropdown-item" onclick="setValue(this);">${category.name}</a>
                    </c:forEach>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="/main/vendor/jquery/jquery.min.js"></script>
<script src="/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/main/lib/markdown-it.js"></script>
<script src="/main/lib/markdown-it-footnote.js"></script>
<script src="/main/lib/highlight.pack.js"></script>
<script src="/main/lib/emojify.js"></script>
<script src="/main/codemirror/lib/codemirror.js"></script>
<script src="/main/codemirror/overlay.js"></script>
<script src="/main/codemirror/xml/xml.js"></script>
<script src="/main/codemirror/markdown/markdown.js"></script>
<script src="/main/codemirror/gfm/gfm.js"></script>
<script src="/main/codemirror/javascript/javascript.js"></script>
<script src="/main/codemirror/css/css.js"></script>
<script src="/main/codemirror/htmlmixed/htmlmixed.js"></script>
<script src="/main/codemirror/lib/util/continuelist.js"></script>
<script src="/main/lib/spell-checker.min.js"></script>
<script src="/main/lib/rawinflate.js"></script>
<script src="/main/lib/rawdeflate.js"></script>
<script src="/main/lib/sweetalert.min.js"></script>
<script src="/main/index.js"></script>
</body>
</html>

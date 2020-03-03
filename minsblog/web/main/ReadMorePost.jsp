<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.Post" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="vo.Comment" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: soengwon
  Date: 2020/02/21
  Time: 3:00 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Post post = (Post) request.getAttribute("post");
    Date date = post.getDate();
    System.out.println(date);
    String printDate = "Posted on ";
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd, HH : mm");

    int thisPostId = post.getId();

    printDate += format.format(date);
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Min's TIL Blog</title>

    <!-- Bootstrap core CSS -->
    <link href="/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/main/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link rel="icon" type="/main/image/png" href="favicon.png">
    <link rel="stylesheet" href="/main/lib/material-icons.css">
    <link rel="stylesheet" href="/main/lib/base16-light.css">
    <link rel="stylesheet" href="/main/codemirror/lib/codemirror.css">
    <link rel="stylesheet" href="/main/lib/default.css">
    <link rel="stylesheet" href="/main/lib/github-markdown.css">
    <link rel="stylesheet" href="/main/lib/spell-checker.min.css">
    <link rel="stylesheet" href="/main/lib/sweetalert.css">

    <!-- Custom styles for this template -->
    <link href="/main/css/blog-post.css" rel="stylesheet">
    <script>
        window.onload = function () {
            var submitButton = document.getElementById('submitButton');
            submitButton.onclick = function () {
                if (document.getElementById('writerId').value === '') {
                    alert('작성자 이름을 반드시 입력해주세요.');
                } else if (document.getElementById('contentId').value === '') {
                    alert('내용을 반드시 입력해주세요.');
                } else {
                    document.getElementById('writerRealId').value =
                        document.getElementById('writerId').value;
                    document.getElementById('contentRealId').value =
                        document.getElementById('contentId').value;
                    document.getElementById('context').submit();
                }
            };

            document.getElementById('postInfoId').onclick = function () {
                var infoForm = document.getElementById('postInfoFormId');
                <%--infoForm.value = ${comment.postId};--%>
                infoForm.submit();
            };

            document.getElementById('postDeleteId').onclick = function () {
                var deleteForm = document.getElementById('postDeleteFormId');
                <%--deleteForm.value = ${comment.postId};--%>
                deleteForm.submit();
            };
        };
    </script>
</head>

<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/category/list.do?cid=Main">
            Min's TIL Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/category/list.do?cid=Main">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">

    <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">
            <p></p>
            <h1 class="mt-4" style="text-align: center; font-style: italic">${post.title}</h1>
            <p style="text-align: center; font-style: italic"><%=printDate%>
            </p>

            <hr>

            <div data-brackets-id="18939" id="out" class="markdown-body">

                <form id="context" action="/comment/add.do" method="post">
                    <input id="contentRealId" name="content" type="hidden">
                    <input id="postRealId" name="postId" value="<%=thisPostId%>" type="hidden">
                    <input id="writerRealId" name="writer" type="hidden">
                </form>
                <!-- markdown 입력-->
                <div style="margin-bottom: 3cm">
                    ${post.htmlContent}

                </div>
                <div class="card my-4">
                    <h5 class="card-header">작성자 :
                        <input id="writerId" type="text" name="writer">
                    </h5>
                    <div class="card-body">
                        <div class="form-group">
                            <textarea id="contentId" class="form-control" rows="3" name="content"></textarea>
                        </div>
                        <button id="submitButton" type="button" class="btn btn-primary">Submit</button>
                    </div>
                </div>
                <div style="margin-bottom: 3cm">
                    <c:forEach var="comment" items="${comments}">
                        <div class="media mb-5">
                            <img class="d-flex mr-3 rounded-circle"
                                 src="${pageContext.request.contextPath}/main/user.png"
                                 alt="" width="50em">
                            <div class="media-body">
                                <h5 class="mt-0">${comment.writer}
                                    <form action="/comment/delete.do" method="post">
                                        <input name="deleteCommentId" type="hidden" value="${comment.id}">
                                        <input name="deleteCommentOnPostId" type="hidden" value="${comment.postId}">
                                        <c:if test="${!empty sessionScope.adminMember}">
                                            <button
                                                    class="btn btn-danger btn-circle btn-sm  ml-4"
                                                    style="background-color: #dc3545;">
                                                <i class="fas fa-trash" style="color: #fff"></i>
                                            </button>
                                        </c:if>
                                    </form>
                                </h5>
                                <p style="font-style: italic; font-size: small;">Posted on ${comment.date}</p>
                                <div>
                                        ${comment.content}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <!-- Side Widget -->
            <div class="card my-4">
                <h5 class="card-header">Side Widget</h5>
                <div class="card-body">
                    <form id="postInfoFormId" action="/post/info.do" method="post">
                        <input name="id" type="hidden" value="${post.id}">
                    </form>
                    <form id="postDeleteFormId" action="/post/delete.do" method="post">
                        <input name="id" type="hidden" value="${post.id}">
                    </form>
                    <a id="postInfoId" class="btn btn-info btn-circle btn-circle">
                        <i class="fas fa-info-circle" style="color: #fff"></i>
                    </a>
                    <a id="postDeleteId" class="btn btn-danger btn-circle btn-circle">
                        <i class="fas fa-trash" style="color: #fff"></i>
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>

<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="/main/vendor/jquery/jquery.min.js"></script>
<script src="/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
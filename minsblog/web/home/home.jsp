<%@ page import="vo.Post" %><%--
  Created by IntelliJ IDEA.
  User: sangminlee
  Date: 2020/01/10
  Time: 11:02 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <title class="browser-title">Min's TIL Blog</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- canonical -->
    <link rel="canonical" href="https://minsblog.wisoft.io">

    <!-- SEO -->
    <meta name="title" content="Min's TIL Blog" class="meta-title">
    <meta name="description" content="개발자를 꿈꾸는 이상민의 TIL 블로그" class="meta-desc">
    <meta name="keywords" content="와이소프트, Wisoft, WISOFT, wisoft, wisoftlab, 이상민, sangmin, bolg, 블로그, 자바, 개발자, developments, java, css, 백엔드">
    <meta name="apple-mobile-web-app-title" content="Min's TIL Blog">
    <link rel="image_src" href="https://avatars3.githubusercontent.com/u/43431081?s=460&v=4">
    <!-- //SEO -->

    <!-- SNS Share ======================================= -->
    <!-- FB -->
    <meta property="og:site_name" content="Min's TIL Blog" class="meta-title">
    <meta property="og:title" content="Min's TIL Blog" class="meta-title">
    <meta property="og:description" content="개발자를 꿈꾸는 이상민의 TIL 블로그" class="meta-desc">
    <meta property="og:type" content="website">
    <meta property="og:locale" content="KR">
    <meta property="og:url" content="https://minsblog.wisoft.io">
    <meta property="og:image" content="https://avatars3.githubusercontent.com/u/43431081?s=460&v=4">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">

    <!-- TW -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="Min's TIL Blog" class="meta-title">
    <meta name="twitter:description" content="개발자를 꿈꾸는 이상민의 TIL 블로그" class="meta-desc">
    <meta name="twitter:url" content="https://minsblog.wisoft.io">
    <meta name="twitter:image" content="https://avatars3.githubusercontent.com/u/43431081?s=460&v=4">
    <!-- //SNS Share ======================================= -->

    <!-- Bootstrap core CSS -->
    <link href="/home/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/home/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/home/css/blog-home.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Min's TIL Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/category/list.do?cid=Main">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <c:if test="${empty sessionScope.adminMember}">
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/login.do">Log in</a>
                    </li>
                </c:if>
                <c:if test="${!empty sessionScope.adminMember}">
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/logout.do">Log out</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/join.do">Sign up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/myinfo.do">My Info</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">

            <h1 class="my-4">Today I Learned<br>
                <small></small>
            </h1>

            <c:forEach var="post" items="${posts}">
                <div class="card mb-4">
                    <div class="card-body">
                        <h2 class="card-title">${post.title}</h2>
                        <a href="${pageContext.request.contextPath}/post/read.do?postid=${post.id}"
                           class="btn btn-primary">Read More &rarr;</a>
                    </div>
                    <div class="card-footer text-muted">
                        Posted on ${post.date}
                    </div>
                </div>
            </c:forEach>

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

            <!-- Search Widget -->
            <div class="card my-4">
                <h5 class="card-header">Search</h5>
                <div class="card-body">
                    <div class="input-group">
                        <form action="/category/list.do" method="post" class="form-inline">
                            <input name="searchPost" type="text" class="form-control" placeholder="Search for..."
                            >
                            <button type="submit" class="btn btn-secondary">Go!</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Categories Widget -->
            <div class="card my-4">
                <h5 class="card-header">Categories</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled mb-0">
                                <c:forEach var="category" items="${categories}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/category/list.do?cid=${category.name}">${category.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <c:if test="${!empty sessionScope.adminMember}">

                                <hr>
                                <div class="dropdown">
                                    <button class="btn btn-success" type="button" id="createCategoryButton"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Create Category
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="createCategoryButton">
                                        <div class="input-group">
                                            <form action="add.do" method="post">
                                                <input name="name" type="text" class="form-control"
                                                       placeholder="Category...">
                                                <span class="input-group-btn">
                <input type="submit" class="btn btn-secondary" type="button" value="Create!">
              </span>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <p></p>
                                <div class="dropdown">
                                    <button class="btn btn-danger" type="button" id="deleteCategoryButton"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Delete Category
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="deleteCategoryButton">
                                        <div class="input-group">
                                            <form action="delete.do" method="post">
                                                <input name="name" type="text" class="form-control"
                                                       placeholder="Category...">
                                                <span class="input-group-btn">
                <input class="btn btn-secondary" type="submit" value="Delete!">
              </span>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <p></p>
                                <div class="dropdown">
                                    <button class="btn btn-info" type="button" id="adjustCategoryButton"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Adjust Category
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="adjustCategoryButton">
                                        <div class="input-group">
                                            <form action="/category/update.do" method="post">
                                                <p>
                                                    <input name="beforeName" type="text" class="form-control"
                                                           placeholder="Category...">
                                                </p>
                                                <input name="changeName" type="text" class="form-control"
                                                       placeholder="Category...">
                                                <span class="input-group-btn">
                <input class="btn btn-secondary" type="submit" value="Adjust!">
              </span>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>

                </div>
            </div>
            <c:if test="${!empty sessionScope.adminMember}">
                <div class="card my-4">
                    <h5 class="card-header">Side Widget</h5>
                    <div class="card-body">
                        <a href="/post/add.do" class="btn btn-primary">Write Post &rarr;</a>
                    </div>
                </div>
            </c:if>

        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy;
            <a href="https://github.com/LeeSM0518">sangmin</a> 2020</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="/home/vendor/jquery/jquery.min.js"></script>
<script src="/home/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="/home/js/sb-admin-2.min.js"></script>

</body>

</html>

<%@ page import="vo.Post" %><%--
  Created by IntelliJ IDEA.
  User: sangminlee
  Date: 2020/01/10
  Time: 11:02 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Min's TIL Blog</title>

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

            <!-- Pagination -->
            <ul class="pagination justify-content-center mb-4">
                <li class="page-item">
                    <a class="page-link" href="#">&larr; Older</a>
                </li>
                <li class="page-item disabled">
                    <a class="page-link" href="#">Newer &rarr;</a>
                </li>
            </ul>

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

            <!-- Search Widget -->
            <div class="card my-4">
                <h5 class="card-header">Search</h5>
                <div class="card-body">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
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
        <p class="m-0 text-center text-white">Copyright &copy; Min's Blog 2019</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="/home/vendor/jquery/jquery.min.js"></script>
<script src="/home/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="/home/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/home/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/home/js/demo/chart-area-demo.js"></script>
<script src="/home/js/demo/chart-pie-demo.js"></script>

</body>

</html>

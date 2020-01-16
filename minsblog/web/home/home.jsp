<%--
  Created by IntelliJ IDEA.
  User: sangminlee
  Date: 2020/01/10
  Time: 11:02 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Blog Home - Start Bootstrap Template</title>

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
                    <a class="nav-link" href="/home.do">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Log in (Log out)</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Sign up</a>
                </li>
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

            <!-- Blog Post -->
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="card-title">Post Title</h2>
                    <a href="#" class="btn btn-primary">Read More &rarr;</a>
                </div>
                <div class="card-footer text-muted">
                    Posted on January 1, 2017 by
                    <a href="#">Start Bootstrap</a>
                </div>
            </div>

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
                                <li>
                                    <a href="#">ALL</a>
                                </li>
                                <li>
                                    <a href="#">Web Design</a>
                                </li>
                                <li>
                                    <a href="#">HTML</a>
                                </li>
                                <li>
                                    <a href="#">Freebies</a>
                                </li>
                                <li>
                                    <a href="#">JavaScript</a>
                                </li>
                                <li>
                                    <a href="#">CSS</a>
                                </li>
                                <li>
                                    <a href="#">Tutorials</a>
                                </li>
                            </ul>
                            <hr>
                            <div class="dropdown">
                                <button class="btn btn-success" type="button" id="createCategoryButton"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Create Category
                                </button>
                                <div class="dropdown-menu" aria-labelledby="createCategoryButton">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Category...">
                                        <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Create!</button>
              </span>
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
                                        <input type="text" class="form-control" placeholder="Category...">
                                        <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Delete!</button>
              </span>
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
                                        <p>
                                            <input type="text" class="form-control" placeholder="Category...">
                                        </p>
                                        <input type="text" class="form-control" placeholder="Category...">
                                        <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Adjust!</button>
              </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Side Widget -->
            <div class="card my-4">
                <h5 class="card-header">Side Widget</h5>
                <div class="card-body">
                    <a href="#" class="btn btn-primary">Write Post &rarr;</a>
                </div>
            </div>

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
<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <title>관리자 페이지</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- styles -->
        <link href="/resources/css/styles.css" rel="stylesheet">

        <script src="/resources/js/confirm.js" type="text/javascript"></script>

<!--        <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script>
            $(document).ready(function () {
                if (window.location.pathname.match("/admin/main/")) {
                    $("#showcase").click();
                }
            });
        </script>-->
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <!-- Logo -->
                        <div class="logo">
                            <h1><a href="/admin/main">Admin Dashboard</a></h1>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <!--                        <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="input-group form">
                                                            <input type="text" class="form-control" placeholder="Search...">
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-primary" type="button">Search</button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>-->
                    </div>
                    <div class="col-md-2">
                        <div class="navbar navbar-inverse" role="banner">
                            <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                                <ul class="nav navbar-nav">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">내 계정 <b class="caret"></b></a>
                                        <ul class="dropdown-menu animated fadeInUp">
                                            <li><a href="/member/memberModifyForm">내정보</a></li>
                                            <li><a href="/member/logout">로그아웃</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-md-2">
                    <div class="sidebar content-box" style="display: block;">
                        <ul class="nav">
                            <!-- Main menu -->
                            <li class="current"><a href="/admin/main"><i class="glyphicon glyphicon-home"></i> 관리</a></li>
                            <li class="current"><a href="/main"><i class="glyphicon glyphicon-home"></i> 홈으로</a></li>
                            <li class="submenu">
                                <a href="#">
                                    <i class="glyphicon glyphicon-pencil" id="showcase"></i> 전시글관리
                                    <span class="caret pull-right"></span>
                                </a>
                                <!-- Sub menu -->
                                <ul>
                                    <li><a href="/admin/main/list">리스트</a></li>
                                    <li><a href="/admin/main/write">쓰기</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="#">
                                    <i class="glyphicon glyphicon-user"></i> 맴버관리
                                    <span class="caret pull-right"></span>
                                </a>
                                <!-- Sub menu -->
                                <ul>
                                    <li><a href="member/admin/list">리스트</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="#">
                                    <i class="glyphicon glyphicon-barcode"></i> 예매관리
                                    <span class="caret pull-right"></span>
                                </a>
                                <!-- Sub menu -->
                                <ul>
                                    <li><a href="/order/admin/list">리스트</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="#">
                                    <i class="glyphicon glyphicon-check"></i> FAQ
                                    <span class="caret pull-right"></span>
                                </a>
                                <!-- Sub menu -->
                                <ul>
                                    <li><a href="login.html">리스트</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="#">
                                    <i class="glyphicon glyphicon-file"></i> 공지글관리
                                    <span class="caret pull-right"></span>
                                </a>
                                <!-- Sub menu -->
                                <ul>
                                    <li><a href="login.html">리스트</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="#">
                                    <i class="glyphicon glyphicon-send"></i> 문의글관리
                                    <span class="caret pull-right"></span>
                                </a>
                                <!-- Sub menu -->
                                <ul>
                                    <li><a href="login.html">리스트</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-11 panel-warning">
                            <div class="content-box-large">
                                <div class="panel-body">
                                    <h4><tiles:insertAttribute name="tab" /></h4>
                                </div>
                                <tiles:insertAttribute name="body" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="container">
                <div class="copy text-center">
                    Copyright 2016 <a href='#'>Team Kong2</a>
                </div>
            </div>
        </footer>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://code.jquery.com/jquery.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="/resources/js/custom.js"></script>
    </body>
</html>
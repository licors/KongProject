<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE>
<html>
    <head>
        <!-- 부트스트랩 -->
        <!--        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
                <link href="/resources/css/index.css" rel="stylesheet">
                <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>  메인 드랍다운용 
                <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>  메인 드랍다운용 
                <script type="text/javascript" src="/resources/js/index.js"></script> 로그인용 -->
        <link href="/resources/css/index.css" rel="stylesheet">
        <script src="/resources/js/cangoto_bootstrap.js"></script>
        <script src="/resources/js/cangoto.js"></script>
        <script src="/resources/js/cangoto_jquery.js"></script>
        <script src="/resources/js/cangoto_jqueryval.js"></script>
        <script src="/resources/js/cangoto_knockout.js"></script>
        <script src="/resources/js/cangoto_plugin.js"></script>
        <script src="/resources/js/cangoto_160818.js"></script>
        <script src="/resources/js/cangoto_cgtAD.js"></script>
        <link rel="shortcut icon" href="/resources/cangoto_ico_16x16.ico" type="image/x-icon" /><!-- 파비콘 추가 -->
    </head>
    <body>
        <div>
            <div>
                <tiles:insertAttribute name="header" />
            </div>
        </div>
        <div>
            <div>
                <tiles:insertAttribute name="top" />
            </div>
        </div>
        <div>
            <div>
                <div>
                    <br>
                    <tiles:insertAttribute name="body" />
                </div>
            </div>
        </div>
        <div id="wrap">
            <div id="footer">
                <tiles:insertAttribute name="footer" />
            </div>
        </div>
    </body>
</html>
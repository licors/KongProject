<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta charset="utf-8">
        <title>로그인</title>
        <script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
        <script charset="UTF-8" type="text/javascript" src="https://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1478062179046/161102.js"></script>
        <link rel="shortcut icon" href="/resources/cangoto_ico_16x16.ico" type="image/x-icon">
        <link href="https://www.cangoto.kr/bundles/css?v=sxPhSaXU4JhQpqRv4PK5CLAAKkUp415GmELDt_1hT6g1" rel="stylesheet">
        <script src="https://www.cangoto.kr/bundles/jquery?v=FVs3ACwOLIVInrAl5sdzR2jrCDmVOWFbZMY6g6Q0ulE1"></script>
        <script src="https://www.cangoto.kr/bundles/jqueryval?v=rV2aNnSGyu71gTy2WfJPJPfX7j7SjxPZ7xVQbcrJuiA1"></script>
        <script src="https://www.cangoto.kr/bundles/bootstrap?v=2Fz3B0iizV2NnnamQFrx-NbYJNTFeBJ2GM05SilbtQU1"></script>
        <script src="https://www.cangoto.kr/bundles/knockout?v=76AIGLyY_agf8nmHAUeHF5fo0HxMeiQhRw6ATlkJEeQ1"></script>
        <script src="https://www.cangoto.kr/bundles/plugin?v=i9A69iKEluopRvNBa2j4LOqTCT46VCT4r_fzZpgwGCs1"></script>
        <script src="https://www.cangoto.kr/bundles/cangoto?v=WGB7u9RHVNpprNZXum2VrQlDLJTZf5tHOYJdmHKq2s01"></script>

        <script type="text/javascript" src="https://api.cangoto.kr/Scripts/cgtAD.js"></script>
        <style type="text/css">.fancybox-margin{margin-right:0px;}</style>
    </head>
    <body>
        <section class="container body-content">
            <div id="ContentPanel"></div>
            <section class="cgt-content-wrapper main-content clear-fix cgt_mt_30">
                <style>
                    html, body, .login-wrapper {
                        background: #fff;
                    }
                </style>
                <div class="login-wrapper">
                    <h1 class="title" style="padding-top:20px;">
                        <a href="/"><img src="/resources/image/member/logo.jpg" alt="KONG"></a>
                    </h1>
                    <h2 style="font-weight:bold;margin:30px 0">
                        	문화를 즐기는 방법, KONG 에 오신 것을 환영합니다.
                    </h2>
                    <section id="loginForm">
                        <form action="/loginProcess" class="form-horizontal" method="post">
                            <div class="cgt-login">
                                <div class="login-form pull-left">
                                    <input id="Username" name="id_email" placeholder="이메일주소" style="width:100%;font-size:18px;" type="text" value="">
                                    <input id="Password" name="password" placeholder="비밀번호" type="password" style="width:100%;font-size:18px;" value="">
                                    <div style="margin-top:10px;">
                                        <span class="field-validation-valid text-danger" data-valmsg-for="Username" data-valmsg-replace="true" style="font-size:18px;"></span>
                                        <span class="field-validation-valid text-danger" data-valmsg-for="Password" data-valmsg-replace="true" style="font-size:18px;"></span>
                                    </div>
                                </div>
                                <div class="login-btn pull-right">
                                    <button type="submit"><img src="/resources/image/member/cgt_login_btn_submit.png" alt="로그인 버튼"></button>
                                </div>
                            </div>
                            <div class="autologin-find">
                                <div class="pull-right" style="display: block; vertical-align: top;">
                                    <a href="${contextPath}/member/memberPwFind" class="btn_cgt_LostPassWDStart cgt-single-load btn" style="width:100%;font-size:17px">비밀번호찾기</a>
                                </div>
                            </div>
                            <div class="btn-join">
                                <a href="${contextPath}/member/memberJoin"><img src="/resources/image/member/cgt_login_btn_join.png" alt=""></a>
                            </div>
                            <div style="margin-top:30px; margin-bottom:30px; text-align:center">
                                <div style="display:inline-block; margin-right:10px;"><a href="#">회사소개/제휴문의</a></div>
                                <div style="display:inline-block; margin-right:10px;"><a href="#">광고(제휴)문의</a></div>
                                <div style="display:inline-block; margin-right:10px;"><a href="#">이용약관</a></div>
                                <div style="display:inline-block;"><a href="#">개인정보취급방침</a></div>
                                <div class="cgt_mb_10"></div>
                                <p style="margin:0px; padding:0px;">서울 강남구 역삼동 콩콩콩콩(콩콩동 142-2) 콩콩빌딩 3층 | 통신판매업신고번호 : 2014-서울금천-0181</p>
                                <p style="margin:0px; padding:0px;">Copyright © 2016 KONG Inc. All rights® reserved.</p>
                            </div>
                        </form>        
                    </section>
                </div>
            </section>
        </section>
    </body>
</html>
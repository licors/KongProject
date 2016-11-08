<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div>
    <section>
        <nav class="navbar" style="margin:0px; padding:0px; min-height:0px;">
            <div style="width:100%; background-color:#E9E9E9; ">
                <div style="max-width:1200px;height:52px;margin:0px auto;padding-top:10px;">
                    <div style="float: left;padding-top:4px;"></div>
                    <div style="float:right;height:28px">
                        <ul>
                            <sec:authorize access="hasRole('ROLE_USER')">
                                <sec:authentication var="userDetail" property="principal" />
                                <li class="topshortlink" style="list-style:none; display:inline-block;"><a class="login-button" href="/member/memberModifyForm">${userDetail.name }</a></li>
                                <li class="topshortlink" style="list-style:none; display:inline-block;"><a class="login-button" href="/member/logout">로그아웃</a></li>
                                <li class="dropdown topshortlink" style="list-style:none; display:inline-block;">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이페이지 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/order/list/1">마이티켓</a></li>
                                        <li><a href="/basket/list">관심티켓</a></li>
                                        <li><a href="/support/write/${userDetail.member_num}">1:1 문의</a></li>
                                        <li><a href="/member/memberModifyForm">내정보</a></li>
                                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <li><a href="/admin/main">관리</a></li>
                                            </sec:authorize>
                                    </ul>
                                </li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <sec:authentication var="userDetail" property="principal" />
                                <li class="topshortlink" style="list-style:none; display:inline-block;">${userDetail.name }</li>
                                <li class="topshortlink" style="list-style:none; display:inline-block;"><a class="login-button" href="/member/logout">로그아웃</a></li>
                                <li class="dropdown topshortlink" style="list-style:none; display:inline-block;">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이페이지 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/admin/main">관리</a></li>
                                    </ul>
                                </li>
                            </sec:authorize>
                            <sec:authorize access="isAnonymous()">
                                <li class="topshortlink" style="list-style:none; display:inline-block;"><img style="height:28px;"><a class="login-button" href="/member/login">로그인</a></li>
                                <li class="topshortlink" style="list-style:none; display:inline-block;"><a class="login-button" href="/member/memberJoin">회원가입</a></li>
                                </sec:authorize>
                            <li class="dropdown topshortlink" style="list-style:none; display:inline-block;">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객센터 <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="/fag/list">FAQ</a>
                                    </li>
                                    <li>
                                        <a href="/notice/list_user">공지사항</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </div>
        </nav>
        <div style="background-color:#FFFFFF;">
            <div style="max-width:900px; margin:0px auto; text-align:center; padding:30px 0px;">
                <div class="boxes">
                    <div class="box box2" style="text-align:center;padding-top:5px">
                        <div style="display: inline-block; margin: 0px auto;">
                            <a href="/main"><img src="/resources/image/header/logo.png" alt="CANGOTO" height="40" style="float:left;margin-right:50px"></a>
                            <div style="float:left;">
                                <input type="text" class="form-control mainSerchBox" placeholder="검색어, #해시태그" id="txtMainSearch">
                            </div>
                            <c:choose>
                                <c:when test="${category ne null}">
                                    <c:choose>
                                        <c:when test="${category eq '전시'}">
                                            <c:set var="category_en" value="aticle" />
                                        </c:when>
                                        <c:when test="${category eq '미술'}">
                                            <c:set var="category_en" value="art" />
                                        </c:when>
                                        <c:when test="${category eq '이벤트'}">
                                            <c:set var="category_en" value="event" />
                                        </c:when>
                                    </c:choose>
                                    <a href="/main/${category_en}" id="btnSearch">
                                    </c:when>
                                    <c:when test="${category eq null}">
                                        <a href="/main/search" id="btnSearch">
                                        </c:when>
                                    </c:choose>
                                    <div style="float:left; background-color:#12B1DB; width:40px; height:40px; line-height:40px;margin-right:30px">
                                        <img src="/resources/image/header/icon_search.jpg">
                                    </div>
                                </a>
                                <div style="clear:both;"></div>
                        </div>
                    </div>
                    <div class="box box3" style="text-align:right;">
                        <img src="/resources/image/header/top_banner.png">
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-bottom:0px;height:40px;">
            <div style="position: absolute; width: 100%; left: 0px; box-sizing: border-box;" id="cgt-top-menu-bg">
                <div style="width: 50%; background: #12B1DB; height: 40px; float: left;"></div><div style="width: 50%; background: #FBA92C; height: 40px; float: left; "></div>
            </div>
            <div style="position: absolute; width: 100%; left: 0px;" align="center" id="cgt-top-menu-front">
                <div style="line-height: 40px; max-width: 1200px; box-sizing: border-box; font-size: 16px; left: 0px;" id="menu">
                    <a href="/main/aticle"><div style="float: left; width: 387px;" class="cgt_m_menu_ctype_1"><span>전시</span></div></a>

                    <a href="/main/art"><div style="float: left; width: 387px;" class="cgt_m_menu_ctype_2"><span>미술</span></div></a>

                    <a href="/main/event"><div style="float: left; width: 387px;" class="cgt_m_menu_ctype_3"><span>이벤트</span></div></a>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script type="text/javascript">
            jQuery().ready(function () {

                jQuery('#btnSearch').on('click', function () {
                    if (jQuery('#txtMainSearch').val().match('#')) {
                        document.location.href = jQuery('#btnSearch').attr('href') + '/Tag/' + jQuery('#txtMainSearch').val().replace(/^#/gi, '');
                    } else {
                        document.location.href = jQuery('#btnSearch').attr('href') + '/' + jQuery('#txtMainSearch').val();
                    }
                    return false;
                });

                jQuery("#txtMainSearch").keydown(function (key) {
                    if (key.keyCode == 13) {
                        if (jQuery('#txtMainSearch').val().match('#')) {
                            document.location.href = jQuery('#btnSearch').attr('href') + '/Tag/' + jQuery('#txtMainSearch').val().replace(/^#/gi, '');
                        } else {
                            document.location.href = jQuery('#btnSearch').attr('href') + '/' + jQuery('#txtMainSearch').val();
                        }
                    }
                });

                jQuery('#txtMainSearch').focus();
            });
        </script>
        <div style="clear:both;"></div>
    </section>
</div>
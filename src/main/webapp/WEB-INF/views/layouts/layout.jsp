<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta charset="utf-8">
        <link href="https://www.cangoto.kr/bundles/css?v=sxPhSaXU4JhQpqRv4PK5CLAAKkUp415GmELDt_1hT6g1" rel="stylesheet"><!-- css -->
        <!-- 원본 -->
        <script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
        <script charset="UTF-8" type="text/javascript" src="https://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1471501634021/160818.js"></script>
        <script src="https://www.cangoto.kr/bundles/jquery?v=FVs3ACwOLIVInrAl5sdzR2jrCDmVOWFbZMY6g6Q0ulE1"></script>
        <script src="https://www.cangoto.kr/bundles/jqueryajax"></script>
        <script src="https://www.cangoto.kr/bundles/jqueryval?v=rV2aNnSGyu71gTy2WfJPJPfX7j7SjxPZ7xVQbcrJuiA1"></script>
        <script src="https://www.cangoto.kr/bundles/bootstrap?v=2Fz3B0iizV2NnnamQFrx-NbYJNTFeBJ2GM05SilbtQU1"></script>
        <script src="https://www.cangoto.kr/bundles/angular"></script>
        <script src="https://www.cangoto.kr/bundles/plugin?v=i9A69iKEluopRvNBa2j4LOqTCT46VCT4r_fzZpgwGCs1"></script>
        <script src="https://www.cangoto.kr/bundles/cangoto?v=WGB7u9RHVNpprNZXum2VrQlDLJTZf5tHOYJdmHKq2s01"></script>
        <script src="https://www.cangoto.kr/bundles/knockout?v=76AIGLyY_agf8nmHAUeHF5fo0HxMeiQhRw6ATlkJEeQ1"></script>
        <script type="text/javascript" src="https://api.cangoto.kr/Scripts/cgtAD.js"></script>
        <!-- 메인 jQuery등록부분 -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script><!-- 메인 드랍다운용 -->
        <script type="text/javascript">
            $(window).ready(function mainList() {
                jQuery(".cgt_list_mask").width(jQuery(".cgt_latest_image_area").width());
                jQuery(".cgt_list_mask").height(jQuery(".cgt_latest_image_area").height());
                jQuery(".cgt-latest").hover(function () {
                    jQuery(this).addClass("active");
                    jQuery(this).find(".cgt_list_count").css("color", "#FFF");
                    jQuery(this).find(".application_icon").attr("src", "/resources/image/main/icon_apply_blue.jpg");
                    jQuery(this).find(".view_icon").attr("src", "/resources/image/main/icon_eye_blue.jpg");
                    jQuery(this).find(".cgt_list_mask").stop().fadeTo(150, .7);
                    jQuery(this).find(".btn-detail").stop().animate({
                        left: "38px",
                        opacity: 1
                    }, 150);
                    jQuery(this).find(".btn-application").stop().animate({
                        right: "38px",
                        opacity: 1
                    }, 150)
                }, function () {
                    jQuery(this).find(".cgt_list_mask").stop().fadeTo(150, 0);
                    jQuery(this).find(".btn-detail").stop().animate({
                        left: "-38px",
                        opacity: 0
                    }, 150, function () {
                        jQuery(this).parent().parent().removeClass("active").find(".application_icon").attr("src", "/resources/image/main/icon_apply.jpg");
                        jQuery(this).parent().parent().find(".view_icon").attr("src", "/resources/image/main/icon_eye.jpg");
                        jQuery(this).parent().parent().find(".cgt_list_count").css("color", "#666")
                    });
                    jQuery(this).find(".btn-application").stop().animate({
                        right: "-38px",
                        opacity: 0
                    }, 150)
                })
            });
        </script>
        <!-- 다운받은 사본 -->
        <!--        <script type="text/javascript" src="/resources/js/cangoto_bootstrap.js"></script>
                <script type="text/javascript" src="/resources/js/cangoto.js"></script>
                <script type="text/javascript" src="/resources/js/cangoto_jquery.js"></script>
                <script type="text/javascript" src="/resources/js/cangoto_jqueryval.js"></script>
                <script type="text/javascript" src="/resources/js/cangoto_knockout.js"></script>
                <script type="text/javascript" src="/resources/js/cangoto_plugin.js"></script>
                <script type="text/javascript" src="/resources/js/cangoto_160818.js"></script>
                <script type="text/javascript" src="/resources/js/cangoto_cgtAD.js"></script>-->

        <style type="text/css">.fancybox-margin{margin-right:17px;}</style>
        <title><tiles:getAsString name="title" /></title>
        <link rel="shortcut icon" href="/resources/cangoto_ico_16x16.ico" type="image/x-icon" />
    </head>
    <body>
        <tiles:insertAttribute name="top" />
        <tiles:insertAttribute name="left" />
        <br>
        <tiles:insertAttribute name="body" />
        <tiles:insertAttribute name="bottom" />
    </body>
</html>
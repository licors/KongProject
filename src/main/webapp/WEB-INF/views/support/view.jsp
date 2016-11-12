<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!--<div id="pjax-container">-->
<!--<div id="cgt_modal_support_detail" class="modal latest in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="background: transparent; display: block;">-->
<div class="modal-dialog">
    <div class="cgt_detail_body">
        <div class="modal-content">
            <div style="clear:both;padding-left:40px;">
                <!--<div class="pull-right" style="width: 68px; height: 68px; padding-top:20px; cursor:pointer; " id="btnClose"><img src="/Content/img/detail_close.jpg" style="display: block; margin: 0 auto; box-sizing: border-box"></div>-->
                <div class="pull-left" style="padding-top: 19px; box-sizing: border-box">
                    <div style="border-top:3px solid black;width:45px;"></div>
                    <div style="font-size:2.5em;padding-top:18px;color:black;">문의내용 &nbsp;</div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="cgt_ht_20"></div>
            <div class="container">
                <h4 class="cgt_color_black"></h4>
                <div class="writer pull-right">
                    <span class="title right-padding20 bold">작성일</span>
                    <span><fmt:formatDate value="${view.reg_date}" pattern="yyyy-MM-dd"/></span>
                </div>
                <div class="clearfix"></div>
                <div class="panel panel-default">
                    <div class="panel-heading">문의내용<br><br>${view.content}</div>
                    <div class="panel-body bold">답변<br><br><div class="reply"></div></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
    $(window).ready(function () {
        jQuery.ajax({
            url: "/support/reply/" + ${view.support_num},
            type: "get",
            success: function (data) {
                jQuery('.reply').text(data.content);
            }
        });
    });
</script>
<!--</div>-->
<!--</div>-->


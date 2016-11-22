
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQ</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    </head>
    <body>

                        <div class="form-group" style="float: right">
                            <!-- <input name="support" type="button" value="1:1 문의"
                                   onClick="javascript:location.href = '/support/supportlist'" class="btn btn-default"> -->
                 
                                <input name="support" type="button" value="QnA 추가"
                                       onClick="javascript:location.href = '/faq/write'" class="btn btn-default">

                        </div>

                <table align="center" class="table table-hover">
                    <c:forEach var="list" items="${list}">
                        <tr>
                        <tr class="tr_visible">
                            <th colspan="1" width="50" align="center" scope="row"><a href="#"><strong>Q.</strong></a></th>
                            <td colspan="2" width="430" align="left"><a href="#">${list.subject }</a></td>
  
                                <td colspan="3" width="120" align="center">
                                    <input name="support" type="button" value="수정" onClick="javascript:location.href = '/faq/modify?faq_num=${list.faq_num }'" class="btn btn-default btn-xs">
                                    <input name="support" type="button" value="삭제" onClick="javascript:location.href = '/faq/delete?faq_num=${list.faq_num }'" class="btn btn-default btn-xs">
                                </td>

                        </tr>
                        <tr>
                        <tr style="display:none" class="tr_invisible">
                            <th colspan="1" width="50" align="center"><strong>A.</strong></th>
                            <td colspan="2" width="550"><pre class="text-left" style="background-color: rgba( 255, 255, 255, 0.0 );border: none !important; border-radius: initial !important;color: none !important;margin: 0px 0px 0px 0px;">${list.content }</pre></td>
                            <td colspan="3"></td>
                        </tr>
                   </c:forEach>
                </table>
       <script>
    $(".tr_visible a").click(function() {
    	$('.tr_invisible').hide();
    $(this).parent().parent().nextUntil(".tr_visible").toggle();
    return false;
   
});
</script>
    </body>
</html>

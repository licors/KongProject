
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQ</title>
       <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
       <script>
    $(".tr_visible a").click(function() {
    $(this).parent().parent().nextUntil(".tr_visible").toggle();
    return false;
});
</script>
    

    </head>
    <body>
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="form-inline">
                        <div class="form-group">
                            <p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 0px 0px; padding:0px;">자주 물어보시는 질문입니다.</p>
                        </div>

                    </div>
                </div>
                <table align="center" class="table table-striped">
                    <c:forEach var="list" items="${list}">
                        <tbody>
                        
                        <tr class="tr_visible">
                        
                            <th colspan="1" width="50" align="center" scope="row"><a href="#"><strong>Q.</strong></a></th>
                            <td colspan="2" width="430" align="left"><a href="#">${list.subject }</a></td>
                        </tr>
                        
                        <tr style="display:none" class="tr_invisible">
                            <th scope="row" colspan="1" width="50" align="center"><strong>A.</strong></th>
                            <td colspan="2" width="550"><pre class="text-left" style="background-color: rgba( 255, 255, 255, 0.0 );border: none !important; border-radius: initial !important;color: none !important;margin: 0px 0px 0px 0px;" >${list.content }</pre></td>
                            <td colspan="3"></td>
                        </tr>
                        </tbody>
                   </c:forEach>
                </table>
            </div>
        </div>
             <script>
    $(".tr_visible a").click(function() {
    	$('.tr_invisible').hide();
    $(this).parent().parent().nextUntil(".tr_visible").toggle();
    return false;
   
});
</script>
    </body>
</html>

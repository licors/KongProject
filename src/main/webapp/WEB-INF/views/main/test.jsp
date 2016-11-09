<%-- 
    Document   : test
    Created on : 2016. 11. 10, 오전 3:04:26
    Author     : Li
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script type="text/javascript">
            $(window).ready(function test() {
                jQuery.ajax({
                    url: "/test/1",
                    type: "get",
//                    data: {"type": "art"},
                    success: function (data) {
                        jQuery("#ajax").remove();
                        alert(data);
                        if (!data) {
                            alert("null");
                            return false;
                        }
                        var html = '';
                        html += '---';
                        html += data.showcase_num;
                        html += '---';
                        html += data.subject;
                        html += '---';
                        jQuery("#container").after(html);
                    }
                });
            });
        </script>
        <script src="/resources/js/jquery.pjax.js"></script>
        <script type="text/javascript">
                  $(function () {
                      // pjax
                      $(document).pjax('a', '#pjax-container')
                  })
        </script>
        <div id="pjax-container">
            <a href="/test/1">test</a>
        </div>
    </body>
</html>

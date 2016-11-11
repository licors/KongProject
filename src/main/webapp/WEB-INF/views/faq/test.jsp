<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>




<script>

$(document).ready(function() {

     jQuery.ajax({

          type:"GET",

       url:"http://localhost:8080/best",

          dataType:"json", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨 

           success : function(json) {
                 // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                 alert(json.date[0].subject);
  

	

                 
                 alert("성공!");
           },

         /*   complete : function(data) {

                 // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.

                 // TODO

           }, */

           
           
           error : function(xhr, status, error) {

                 alert("에러발생");

           }

     });

});

</script>

</head>
<body>


</body>
</html>
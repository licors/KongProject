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

          dataType:"json", // �ɼ��̹Ƿ� JSON���� ������ �ƴϸ� �Ƚᵵ �� 

           success : function(json) {
                 // ����� ���������� �̷������ �� �� �Լ��� Ÿ�� �ȴ�.
                 alert(json.date[0].subject);
  

	

                 
                 alert("����!");
           },

         /*   complete : function(data) {

                 // ����� �����߾ �Ϸᰡ �Ǿ��� �� �� �Լ��� Ÿ�� �ȴ�.

                 // TODO

           }, */

           
           
           error : function(xhr, status, error) {

                 alert("�����߻�");

           }

     });

});

</script>

</head>
<body>


</body>
</html>
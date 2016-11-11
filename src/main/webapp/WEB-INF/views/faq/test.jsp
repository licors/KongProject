<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="jquery.js"></script>  
<script type="text/javascript" src="jquery.vticker-min.js"></script> 

<script type="text/javascript">  
$(function(){  
    $('#dv_rolling').vTicker({   
        // ��ũ�� �ӵ�(default: 700)  
        speed: 500,  
        // ��ũ�� ������ ���ð�(default: 4000)  
        pause: 3000,  
        // ��ũ�� �ִϸ��̼�  
        animation: 'fade',  
        // ���콺 over �϶� ���� ����  
        mousePause: false,  
       // �ѹ��� ���� ����Ʈ��(default: 2)  
        showItems: 4,  
        // ��ũ�� �����̳� ����(default: 0)  
        height: 0,  
        // �������� �����̴� ����, up/down (default: up)  
        direction: 'up'  
    });  
});  
  





$(document).ready(function() {

     jQuery.ajax({

          type:"GET",

       url:"http://localhost:8080/best",

          dataType:"JSON", // �ɼ��̹Ƿ� JSON���� ������ �ƴϸ� �Ƚᵵ �� 

           success : function(data) {
                  // ����� ���������� �̷������ �� �� �Լ��� Ÿ�� �ȴ�.
        	  
               var best_10='';
                 /*  best_10+='<div style="border:1px solid #e0e0e0;height:120px;width:238px;padding-top:5px;">';  */
					best_10+="<div id='dv_rolling' >";
					best_10+='<ul>';
                jQuery.each(data, function(index,value){
               	 best_10+="<li>"+(index+1) + "��" + value.subject+"</li>";
               	
                });
                best_10+="</ul>";
                best_10+="</div>";
             /*    best_10+='</div>'; */
         	$('#update_tm').html(best_10);
             /* $('#update_tm').html(value.subject); */
             /*   alert(data[0].subject); */
           },
  
          
	

                 
        

         /*   complete : function(data) {

                 // ����� �����߾ �Ϸᰡ �Ǿ��� �� �� �Լ��� Ÿ�� �ȴ�.

                

           }, */

           
           
           error : function(xhr, status, error) {

                 alert("�����߻�");

           }

     });

});

</script>

</head>
<body>
<div style="border:1px solid #e0e0e0;height:120px;width:238px;padding-top:5px;" id="update_tm">
</div>
<!-- <table>
<tr>
<td id="update_tm"></td>
</tr>
</table> -->
</body>

</html>
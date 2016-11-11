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
        // 스크롤 속도(default: 700)  
        speed: 500,  
        // 스크롤 사이의 대기시간(default: 4000)  
        pause: 3000,  
        // 스크롤 애니메이션  
        animation: 'fade',  
        // 마우스 over 일때 멈출 설정  
        mousePause: false,  
       // 한번에 보일 리스트수(default: 2)  
        showItems: 4,  
        // 스크롤 컨테이너 높이(default: 0)  
        height: 0,  
        // 아이템이 움직이는 방향, up/down (default: up)  
        direction: 'up'  
    });  
});  
  





$(document).ready(function() {

     jQuery.ajax({

          type:"GET",

       url:"http://localhost:8080/best",

          dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨 

           success : function(data) {
                  // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
        	  
               var best_10='';
                 /*  best_10+='<div style="border:1px solid #e0e0e0;height:120px;width:238px;padding-top:5px;">';  */
					best_10+="<div id='dv_rolling' >";
					best_10+='<ul>';
                jQuery.each(data, function(index,value){
               	 best_10+="<li>"+(index+1) + "등" + value.subject+"</li>";
               	
                });
                best_10+="</ul>";
                best_10+="</div>";
             /*    best_10+='</div>'; */
         	$('#update_tm').html(best_10);
             /* $('#update_tm').html(value.subject); */
             /*   alert(data[0].subject); */
           },
  
          
	

                 
        

         /*   complete : function(data) {

                 // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.

                

           }, */

           
           
           error : function(xhr, status, error) {

                 alert("에러발생");

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
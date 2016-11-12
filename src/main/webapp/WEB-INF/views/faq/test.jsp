<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="jquery.js"></script>  
<script>

$(document).ready(function() {
	$(function() {
		timer=setInterval(function(){
           jQuery.ajax({

           type:"GET",

           url:"http://localhost:8080/best",

           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨 
           cache : false,
           
               success : function(data) {       	   
               var best_10='';
           
               jQuery.each(data, function(index,value){
               best_10 += (index+1) + ".&nbsp" + value.subject +"<br/>";
               });
               
               $('#best').html(best_10);
            
               
               },

               error : function(xhr, status, error) {




               }
     
           });
},15000);
});
});

</script>
<script type="text/javascript">
 var rollingTimeIntervalID;
 var durationTime = 1000;
 var rollingTime  = 3000;

function scrollTextUp(){
  $("#textup").animate({"top":"-=20"},{
    duration: durationTime,
    easing: "linear",
    complete:function(){
      $("#textup").children(":last").after("<div style='line-height:20px;'>"+$("#textup").children(":first").html()+"</div>");
      if($("#textup").children(":first").height() <= (parseInt($("#textup").css("top"))*-1)){
        $("#textup").children(":first").remove();
        $("#textup").css({"top":0});
      }
    }
  });
}
rollingTimeIntervalID = setInterval(scrollTextUp, rollingTime);
</script>





</head>
  <body>
  <h3>실시간 주문 순위</h3>
       <div id="scrolltextup" style="background-color:#44b316;border:1px solid #e0e0e0; overflow:hidden; position:relative; width:200px; height:55px;">
  <div id="textup" style="text-align:center; position:absolute; top:0; left:0; width:200px;color:#fff;">
    <div style="line-height:20px;" id="best">
    
     <!--  +++text1.<br/>
      +++text2.<br/>
      +++text3.<br/>
      +++text4 -->
    </div>
  </div>
</div>



    </body>
</html>
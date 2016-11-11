<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!--<script>
    function modify() {
        if (confirm("정보를 수정하시겠습니까?")) {
        } else {
            alert("취소되었습니다");
            return false;
        }
    }
</script>-->
<style>
	body {
		background-color: #fff;
	}
</style>

<div style="width:100%; background-color:#FFF;">
	<div style="margin-bottom: 40px; margin-top: 0px;">
		<h1 class="title" align="center">
			<a href="/"><img src="/resources/image/member/logo.jpg" alt="KONG"></a>
		</h1>
	</div>
    <div id="ContentPanel"></div>
    <section class="cgt-content-wrapper main-content clear-fix">
        <div style="padding-top:50px;">
            <div class="row" style="margin:0px;">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form:form commandName="member" action="${contextPath}/member/memberModify" method="post" name="modifyform" id="form0">
                        <div style="max-width:1200px; text-align:left; margin:0px auto 40px auto;">
                            <div class="clearfix" style="width:100%; max-width:1200px;">
                                <div class="col-md-6" style="text-align:left; padding:0px"><p style="font-size:28px; color:#000000; font-weight:bold; margin:0px 0px 10px 0px; padding:0px;">마이페이지</p></div>
                                <div class="col-md-6" style="text-align:right; padding:0px;">
                                </div>
                            </div>
                        </div>
                        <div style="padding-bottom:40px;">
                            <div class="col-md-12" style="margin-bottom:10px;">* 이메일 주소는 문의내용 확인 및 회신을 위한 용도로만 사용됩니다.</div>
                        </div>
                        <div style="max-width:1200px; margin:0px auto; padding-bottom:40px;">
                            <div class="container user_info">
                                <div class="clearfix" style="padding-bottom:10px;line-height:35px;">
                                    <div class="col-md-3">이름</div>
                                    <div class="col-md-9">
                                        <form:input type="text" name="name" class="form-control search_box_input" path="name" onclick="this.value=''" style="width:100%;" /> 
                                        <font color="red">
                                        <form:errors path="name" />
                                        </font>
                                    </div>
                                </div>
                                <div class="clearfix" style="padding-bottom:10px;line-height:35px;">
                                    <div class="col-md-3">회사명</div>
                                    <div class="col-md-9">
                                        <form:input type="text" name="company" class="form-control search_box_input" path="company" onclick="this.value=''" style="width:100%;" /> 
                                        <font color="red">
                                        <form:errors path="company" />
                                        </font>
                                    </div>
                                </div>
                                <div class="clearfix" style="padding-bottom:10px;line-height:35px;">
                                    <div class="col-md-3">아이디</div>
                                    <form:input type="hidden" path="member_num"/>
                                    <form:input type="hidden" path="id_email"/>
                                    <div class="col-md-9">${member.id_email }</div>
                                </div>
                                <div class="clearfix" style="padding-bottom:10px;line-height:35px;">
                                    <div class="col-md-3">전화번호</div>
                                    <div class="col-md-9">
                                        <form:input type="text" name="phone" class="form-control search_box_input" path="phone" onclick="this.value=''" style="width:100%;" /> 
                                        <font color="red">
                                        <form:errors path="phone" />
                                        </font>                                    
                                    </div>
                                </div>
                                <div class="clearfix" style="padding-bottom:10px;line-height:35px;">
                                    <div class="col-md-3">새로운비밀번호</div>
                                    <div class="col-md-9">
                                        <form:input type="password" class="form-control search_box_input" path="password" onclick="this.value=''" style="width:100%;" />
                                        <font color="red">
                                        <form:errors path="password" />
                                        </font>
                                    </div>
                                </div>
                                
                                <div style="max-width:1200px; text-align:center; margin:20px auto 40px auto;">
                                    <button type="submit" class="btn btn-light-blue" style="display:inline-block; width:120px;">정보수정</button>
                                    <!--<input class="btn btn-light-blue" type="button" style="display:inline-block; width:100px;" value="회원탈퇴" onClick="javascript:location.href = '${contextPath}/member/memberDeleteForm'">-->
                                    <input class="btn btn-light-blue" type="button" style="display:inline-block; width:120px;" value="취소" onClick="javascript:location.href = '${contextPath}/main'">
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="col-md-3"></div>
            </div>
            <div id="AlertPop"></div>
        </div>
    </section>
</div>
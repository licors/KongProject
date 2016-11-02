<%-- 
    Document   : main
    Created on : 2016. 11. 2, 오후 5:57:51
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h3>환영합니다.</h3>
<p>어드민 타일즈 설정은 아래와 같이 설정해주세요.</p>
<pre>
    &lt;definition name="타일즈이름" extends="default_admin"&gt;
        &lt;put-attribute name="tab" value="위에"공지사항"부분 글자" /&gt;
        &lt;put-attribute name="body" value="/WEB-INF/views/admin/주소" /&gt;
    &lt;/definition&gt;
</pre>

<p>리스트를 사용하실때는 아래와 비슷하게 사용하시면 됩니다.</p>
<pre>
    &lt;table class="table table-hover"&gt;
    &lt;thead&gt;
        &lt;tr style="text-align:center;vertical-align:middle;"&gt;
            &lt;th style="width: 5%;"&gt;No.&lt;/th&gt;
            &lt;th style="width: 80%;"&gt;subject&lt;/th&gt;
            &lt;th style="width: 5%;"&gt;status&lt;/th&gt;
            &lt;th style="width: 5%;"&gt;readcount&lt;/th&gt;
            &lt;th style="width: 5%;"&gt;ordercount&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;c:forEach var="list" items="${list}" varStatus="stat"&gt;
            &lt;tr style="text-align:center;vertical-align:middle;"&gt;
                &lt;td&gt;${list.showcase_num}&lt;/td&gt;
                &lt;td align="left"&gt;&nbsp;&lt;a href=""&gt;${list.subject}&lt;/a&gt;&lt;/td&gt;
                &lt;td align="center"&gt;${list.show_status}&lt;/td&gt;
                &lt;td align="center"&gt;${list.readcount}&lt;/td&gt;
                &lt;td align="center"&gt;${list.ordercount}&lt;/td&gt;
            &lt;/tr&gt;
        &lt;/c:forEach&gt;
    &lt;/tbody&gt;
    &lt;/table&gt;
</pre>
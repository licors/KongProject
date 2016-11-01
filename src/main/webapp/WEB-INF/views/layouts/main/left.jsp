<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    $(document).ready(function () {
        $('#myCarousel').carousel('cycle');
        $('#myCarousel2').carousel('cycle');
    });
</script>
<div style="width:100%; padding:20px 20px 20px 20px;">
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                <li data-target="#myCarousel" data-slide-to="3" class=""></li>
                <li data-target="#myCarousel" data-slide-to="4" class=""></li>
                <li data-target="#myCarousel" data-slide-to="5" class=""></li>
                <li data-target="#myCarousel" data-slide-to="6" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="/resources/image/navi/leftslide1.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="/resources/image/navi/leftslide2.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="/resources/image/navi/leftslide3.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="/resources/image/navi/leftslide4.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="/resources/image/navi/leftslide5.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="/resources/image/navi/leftslide6.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="/resources/image/navi/leftslide7.jpg" alt="...">
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>

<%--<div class="row">--%>


	<%--<div id="myCarousel" class="carousel slide" data-ride="carousel">--%>
		<%--<!-- Carousel indicators -->--%>
		<%--<ol class="carousel-indicators">--%>
			<%--<li data-target="#myCarousel" data-slide-to="0" class="active"></li>--%>
			<%--<li data-target="#myCarousel" data-slide-to="1"></li>--%>
			<%--<li data-target="#myCarousel" data-slide-to="2"></li>--%>
		<%--</ol>--%>
		<%--<!-- Wrapper for carousel items -->--%>
		<%--<div class="carousel-inner">--%>
			<%--<div class="item active">--%>
				<%--<img src="http://0.tqn.com/d/sneakers/1/S/Z/N/-/-/flight-club.jpg" alt="First Slide">--%>
			<%--</div>--%>
			<%--<div class="item">--%>
				<%--<img src="https://mir-s3-cdn-cf.behance.net/project_modules/disp/b37fad17521153.562bb05f79712.gif" alt="Second Slide">--%>
			<%--</div>--%>
			<%--<div class="item">--%>
				<%--<img src="https://s-media-cache-ak0.pinimg.com/736x/25/0b/9e/250b9e70816a649dbe38ba5616450605.jpg" alt="Third Slide">--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<!-- Carousel controls -->--%>
		<%--<a class="carousel-control left" href="#myCarousel" data-slide="prev">--%>
			<%--<span class="glyphicon glyphicon-chevron-left"></span>--%>
		<%--</a>--%>
		<%--<a class="carousel-control right" href="#myCarousel" data-slide="next">--%>
			<%--<span class="glyphicon glyphicon-chevron-right"></span>--%>
		<%--</a>--%>
	<%--</div>--%>
<%--</div>--%>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	.mySlides {display:none;}
</style>
<body>

<h2 class="w3-center"><b>WELCOME !</b></h2>

<div class="w3-content w3-section">
	<img class="mySlides" src="http://0.tqn.com/d/sneakers/1/S/Z/N/-/-/flight-club.jpg" style="width:100%;height: 600px;">
	<img class="mySlides" src="https://mir-s3-cdn-cf.behance.net/project_modules/disp/b37fad17521153.562bb05f79712.gif" style="width:100%; height: 600px;">
	<img class="mySlides" src="https://s-media-cache-ak0.pinimg.com/736x/25/0b/9e/250b9e70816a649dbe38ba5616450605.jpg" style="width:100%;height: 600px;">
</div>

<script>
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 2000); // Change image every 2 seconds
    }
</script>

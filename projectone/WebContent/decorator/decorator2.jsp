<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="login" value="${sessionScope.login }"/>
<!DOCTYPE html>
<html>
<head> 
<title><decorator:title/> </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap&subset=korean" rel="stylesheet">
<decorator:head/>
<script type="text/javascript">
$(document).ready(function(){ 
    $('html').css('width', $(window).width()); 
    $('html').css('height', $(window).height()); 
    $(window).resize(function() { 
        $('html').css('width', $(window).width()); 
        $('html').css('height', $(window).height()); 
    }); 
});
</script>
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
<style>
body,h1{
	font-family: 'East Sea Dokdo', cursive;
	font-style: black; 
	color: black; 
}
#myNavbar, #mySidebar{
	font-size: 27px;
}
footer{
	font-size: 18px;
}
body, html {
  height: 100%;
  line-height: 1.8;
} 
#out {
 width: 100%;

 }
#in {
 display: inline-block;
 }
 
/* Full height image header */
.bgimg-1 {
  background-position: center;
  background-size: cover;
  background-color: rgb(192,165,154);
  background-image: url("../../imgs/mainbackground.png");
  min-height: 93%;
}

.w3-bar .w3-button {
  padding: 16px;
}
</style>
</head>
<body style="background-color: rgb(231,228,211);">

<!-- Navbar (sit on top) -->
<div class="w3-top" >
  <div class="w3-bar" style="background-color: rgb(231,228,211);" id="myNavbar">
    <a href="/projectone/model2/member/main.do" style="font-style: italic;" class="w3-bar-item w3-button w3-hover-pale-red w3-hover-text-yellow w3-hover-text-grey">HOME</a>
    <!-- Right-sided navbar links -->
    <span class="w3-center w3-hide-small  w3-hide-medium" >
      <c:if test="${empty sessionScope.login }">
      <a href="" style="font-style: italic;" onclick="javascript:alert('로그인후 이용가능')"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">응원과 위로의 말</a>
      <a href="" style="font-style: italic;" onclick="javascript:alert('로그인후 이용가능')"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">작은 순간을 예쁜 물감으로</a>
      <a href="" style="font-style: italic;" onclick="javascript:alert('로그인후 이용가능')"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">이 밤 잠 못 들게</a>
      <a href="" style="font-style: italic;" onclick="javascript:alert('로그인후 이용가능')"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">yellow CARD</a>
      <a href="${path }/model2/member/loginForm.do" style="font-style: italic;"
      class="w3-bar-item w3-right  w3-button w3-hover-pale-red w3-hover-text-grey">로그인</a>
      <a href="${path }/model2/member/joinForm.do" style="font-style: italic;"
      class="w3-bar-item w3-right  w3-button w3-hover-pale-red w3-hover-text-grey">회원가입</a>
      </c:if>
      <c:if test="${!empty sessionScope.login}">
      <a href="${path }/model2/board/list.do" style="font-style: italic;"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">응원과 위로의 말</a>
      <a href="${path }/model2/imageboard/list.do?boardtype=2" style="font-style: italic;"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">작은 순간을 예쁜 물감으로</a>
      <a href="${path }/model2/playboard/list.do" style="font-style: italic;"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">이 밤 잠 못 들게</a>
      <a href="${path }/model2/warnboard/list.do" style="font-style: italic;"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">yellow CARD</a>
      <a href="${path }/model2/member/logout.do" style="font-style: italic;"
      class="w3-bar-item w3-right  w3-button w3-hover-pale-red w3-hover-text-grey">로그아웃</a>
      <a href="${path }/model2/member/mypageForm.do?id=${sessionScope.login }&pageNum=1" style="font-style: italic;"
      class="w3-bar-item w3-right  w3-button w3-hover-pale-red w3-hover-text-grey">마이페이지</a>
      </c:if>
      
    </span>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large" onclick="w3_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div> 

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-black w3-card w3-animate-left w3-hide-large "
 style="display: none; background-color: rgb(192,165,154)" id="mySidebar">
  <c:if test="${empty sessionScope.login }">
  <a href="javascript:void(0)" onclick="w3_close()" 
  class="w3-bar-item w3-button w3-padding-16  w3-hover-pale-red w3-hover-text-grey">Close ×</a><br>
      <a href="" style="font-style: italic;" onclick="javascript:alert('로그인후 이용가능')"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">응원과 위로의 말</a><br>
      <a href="" style="font-style: italic;" onclick="javascript:alert('로그인후 이용가능')"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">작은 순간을 예쁜 물감으로</a><br>
      <a href="" style="font-style: italic;" onclick="javascript:alert('로그인후 이용가능')"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">이 밤 잠 못 들게</a><br>
      <a href="" style="font-style: italic;" onclick="javascript:alert('로그인후 이용가능')"
      class="w3-bar-item  w3-button w3-hover-pale-red w3-hover-text-grey">yellow CARD</a><br>
  <a href="${path }/model2/member/loginForm.do" onclick="w3_close()" 
  class="w3-bar-item w3-button  w3-hover-pale-red w3-hover-text-grey">로그인</a><br>
  <a href="${path }/model2/member/joinForm.do" onclick="w3_close()"
  class="w3-bar-item w3-button  w3-hover-pale-red w3-hover-text-grey">회원가입</a><br>
  </c:if>
  <c:if test="${!empty sessionScope.login}">
  <a href="javascript:void(0)" onclick="w3_close()" 
  class="w3-bar-item w3-button  w3-padding-16  w3-hover-pale-red w3-hover-text-grey">Close ×</a><br>
  <a href="${path }/model2/board/list.do" onclick="w3_close()" 
  class="w3-bar-item w3-button  w3-hover-pale-red w3-hover-text-grey">응원과 위로의 말</a><br>
  <a href="${path }/model2/imageboard/list.do?boardtype=2" onclick="w3_close()" 
  class="w3-bar-item w3-button  w3-hover-pale-red w3-hover-text-grey">작은 순간을 예쁜 물감으로</a><br>
  <a href="${path }/model2/playboard/list.do" onclick="w3_close()" 
  class="w3-bar-item w3-button  w3-hover-pale-red w3-hover-text-grey">이 밤 잠 못 들게</a><br>
  <a href="${path }/model2/warnboard/list.do" onclick="w3_close()" 
  class="w3-bar-item w3-button  w3-hover-pale-red w3-hover-text-grey">yellow CARD</a><br>
  <a href="${path }/model2/member/logout.do" onclick="w3_close()" 
  class="w3-bar-item w3-button  w3-hover-pale-red w3-hover-text-grey">로그아웃</a><br>
  <a href="${path }/model2/member/mypageForm.do?id=${sessionScope.login }&pageNum=1" onclick="w3_close()"
  class="w3-bar-item w3-button  w3-hover-pale-red w3-hover-text-grey">마이페이지</a>
  </c:if>
</nav>

<!-- Header with full-height image -->
 <!-- w3-display-container  -->   


<!--  
<header style="height: 40px">
<div class="w3-display-topleft w3-text-white" style="padding:48px; left: 200px; top:200px;">
    <span class="w3-display-center " style="font-size: 80px; background-color: rgb(210,181,177)"> 모 이 다 </span><br>
    <br>
    <span class="w3-xlarge " style="background-color: rgb(210,181,177)"> 1. 모 이런 이쁜 아이유가 다 있어? </span><br>
    <span class="w3-xlarge " style="background-color: rgb(210,181,177)"> 2. 작고 여무지다</span> 
  </div> -->
  <!-- 
  <div class="w3-display-bottomright w3-text-grey w3-large" style="padding:10px 48px">
    <a href="https://www.facebook.com/iu.loen"><i class="fa fa-facebook-official w3-xxlarge w3-hover-opacity">&nbsp;&nbsp;</i></a>
    <a href="https://www.instagram.com/dlwlrma/"><i class="fa fa-instagram w3-xxlarge w3-hover-opacity">&nbsp;&nbsp;</i></a>
    <a href="https://twitter.com/_IUofficial"><i class="fa fa-twitter  w3-xxlarge w3-hover-opacity">&nbsp;&nbsp;</i></a>
  </div> 
</header>
  -->
  
<!-- About Section -->

 <table class="w3-padding-16 bgimg-1" id="out"> 
 <tr>
 	<td id="in">
		<decorator:body/>
	</td>
</tr>
</table>


<!-- Promo Section - "We know design" -->
<!-- <div class="w3-container w3-light-grey" style="padding:128px 16px">
  <div class="w3-row-padding">
    <div class="w3-col m6">
      <h3>We know design.</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod<br>tempor incididunt ut labore et dolore.</p>
      <p><a href="#work" class="w3-button w3-black"><i class="fa fa-th"> </i> View Our Works</a></p>
    </div>
    <div class="w3-col m6">
      <img class="w3-image w3-round-large" src="/w3images/phone_buildings.jpg" alt="Buildings" width="700" height="394">
    </div>
  </div>
</div> -->

<!-- Team Section -->
<!-- <div class="w3-container" style="padding:128px 16px" id="team">
  <h3 class="w3-center">THE TEAM</h3>
  <p class="w3-center w3-large">The ones who runs this company</p>
  <div class="w3-row-padding w3-grayscale" style="margin-top:64px">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="/w3images/team2.jpg" alt="John" style="width:100%">
        <div class="w3-container">
          <h3>John Doe</h3>
          <p class="w3-opacity">CEO & Founder</p>
          <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
          <p><button class="w3-button w3-light-grey w3-block"><i class="fa fa-envelope"></i> Contact</button></p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="/w3images/team1.jpg" alt="Jane" style="width:100%">
        <div class="w3-container">
          <h3>Anja Doe</h3>
          <p class="w3-opacity">Art Director</p>
          <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
          <p><button class="w3-button w3-light-grey w3-block"><i class="fa fa-envelope"></i> Contact</button></p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="/w3images/team3.jpg" alt="Mike" style="width:100%">
        <div class="w3-container">
          <h3>Mike Ross</h3>
          <p class="w3-opacity">Web Designer</p>
          <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
          <p><button class="w3-button w3-light-grey w3-block"><i class="fa fa-envelope"></i> Contact</button></p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="/w3images/team4.jpg" alt="Dan" style="width:100%">
        <div class="w3-container">
          <h3>Dan Star</h3>
          <p class="w3-opacity">Designer</p>
          <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
          <p><button class="w3-button w3-light-grey w3-block"><i class="fa fa-envelope"></i> Contact</button></p>
        </div>
      </div>
    </div>
  </div>
</div> -->

<!-- Promo Section "Statistics" -->
<!-- <div class="w3-container w3-row w3-center w3-dark-grey w3-padding-64">
  <div class="w3-quarter">
    <span class="w3-xxlarge">14+</span>
    <br>Partners
  </div>
  <div class="w3-quarter">
    <span class="w3-xxlarge">55+</span>
    <br>Projects Done
  </div>
  <div class="w3-quarter">
    <span class="w3-xxlarge">89+</span>
    <br>Happy Clients
  </div>
  <div class="w3-quarter">
    <span class="w3-xxlarge">150+</span>
    <br>Meetings
  </div>
</div>
 -->
<!-- Work Section -->
<!-- <div class="w3-container" style="padding:128px 16px" id="work">
  <h3 class="w3-center">OUR WORK</h3>
  <p class="w3-center w3-large">What we've done for people</p>

  <div class="w3-row-padding" style="margin-top:64px">
    <div class="w3-col l3 m6">
      <img src="/w3images/tech_mic.jpg" style="width:100%" onclick="onClick(this)" class="w3-hover-opacity" alt="A microphone">
    </div>
    <div class="w3-col l3 m6">
      <img src="/w3images/tech_phone.jpg" style="width:100%" onclick="onClick(this)" class="w3-hover-opacity" alt="A phone">
    </div>
    <div class="w3-col l3 m6">
      <img src="/w3images/tech_drone.jpg" style="width:100%" onclick="onClick(this)" class="w3-hover-opacity" alt="A drone">
    </div>
    <div class="w3-col l3 m6">
      <img src="/w3images/tech_sound.jpg" style="width:100%" onclick="onClick(this)" class="w3-hover-opacity" alt="Soundbox">
    </div>
  </div>

  <div class="w3-row-padding w3-section">
    <div class="w3-col l3 m6">
      <img src="/w3images/tech_tablet.jpg" style="width:100%" onclick="onClick(this)" class="w3-hover-opacity" alt="A tablet">
    </div>
    <div class="w3-col l3 m6">
      <img src="/w3images/tech_camera.jpg" style="width:100%" onclick="onClick(this)" class="w3-hover-opacity" alt="A camera">
    </div>
    <div class="w3-col l3 m6">
      <img src="/w3images/tech_typewriter.jpg" style="width:100%" onclick="onClick(this)" class="w3-hover-opacity" alt="A typewriter">
    </div>
    <div class="w3-col l3 m6">
      <img src="/w3images/tech_tableturner.jpg" style="width:100%" onclick="onClick(this)" class="w3-hover-opacity" alt="A tableturner">
    </div>
  </div>
</div>

Modal for full size images on click
<div id="modal01" class="w3-modal w3-black" onclick="this.style.display='none'">
  <span class="w3-button w3-xxlarge w3-black w3-padding-large w3-display-topright" title="Close Modal Image">×</span>
  <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
    <img id="img01" class="w3-image">
    <p id="caption" class="w3-opacity w3-large"></p>
  </div>
</div> -->

<!-- Skills Section -->
<!-- <div class="w3-container w3-light-grey w3-padding-64">
  <div class="w3-row-padding">
    <div class="w3-col m6">
      <h3>Our Skills.</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod<br>
      tempor incididunt ut labore et dolore.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod<br>
      tempor incididunt ut labore et dolore.</p>
    </div>
    <div class="w3-col m6">
      <p class="w3-wide"><i class="fa fa-camera w3-margin-right"></i>Photography</p>
      <div class="w3-grey">
        <div class="w3-container w3-dark-grey w3-center" style="width:90%">90%</div>
      </div>
      <p class="w3-wide"><i class="fa fa-desktop w3-margin-right"></i>Web Design</p>
      <div class="w3-grey">
        <div class="w3-container w3-dark-grey w3-center" style="width:85%">85%</div>
      </div>
      <p class="w3-wide"><i class="fa fa-photo w3-margin-right"></i>Photoshop</p>
      <div class="w3-grey">
        <div class="w3-container w3-dark-grey w3-center" style="width:75%">75%</div>
      </div>
    </div>
  </div>
</div> -->

<!-- Pricing Section -->
<!-- <div class="w3-container w3-center w3-dark-grey" style="padding:128px 16px" id="pricing">
  <h3>PRICING</h3>
  <p class="w3-large">Choose a pricing plan that fits your needs.</p>
  <div class="w3-row-padding" style="margin-top:64px">
    <div class="w3-third w3-section">
      <ul class="w3-ul w3-white w3-hover-shadow">
        <li class="w3-black w3-xlarge w3-padding-32">Basic</li>
        <li class="w3-padding-16"><b>10GB</b> Storage</li>
        <li class="w3-padding-16"><b>10</b> Emails</li>
        <li class="w3-padding-16"><b>10</b> Domains</li>
        <li class="w3-padding-16"><b>Endless</b> Support</li>
        <li class="w3-padding-16">
          <h2 class="w3-wide">$ 10</h2>
          <span class="w3-opacity">per month</span>
        </li>
        <li class="w3-light-grey w3-padding-24">
          <button class="w3-button w3-black w3-padding-large">Sign Up</button>
        </li>
      </ul>
    </div>
    <div class="w3-third">
      <ul class="w3-ul w3-white w3-hover-shadow">
        <li class="w3-red w3-xlarge w3-padding-48">Pro</li>
        <li class="w3-padding-16"><b>25GB</b> Storage</li>
        <li class="w3-padding-16"><b>25</b> Emails</li>
        <li class="w3-padding-16"><b>25</b> Domains</li>
        <li class="w3-padding-16"><b>Endless</b> Support</li>
        <li class="w3-padding-16">
          <h2 class="w3-wide">$ 25</h2>
          <span class="w3-opacity">per month</span>
        </li>
        <li class="w3-light-grey w3-padding-24">
          <button class="w3-button w3-black w3-padding-large">Sign Up</button>
        </li>
      </ul>
    </div>
    <div class="w3-third w3-section">
      <ul class="w3-ul w3-white w3-hover-shadow">
        <li class="w3-black w3-xlarge w3-padding-32">Premium</li>
        <li class="w3-padding-16"><b>50GB</b> Storage</li>
        <li class="w3-padding-16"><b>50</b> Emails</li>
        <li class="w3-padding-16"><b>50</b> Domains</li>
        <li class="w3-padding-16"><b>Endless</b> Support</li>
        <li class="w3-padding-16">
          <h2 class="w3-wide">$ 50</h2>
          <span class="w3-opacity">per month</span>
        </li>
        <li class="w3-light-grey w3-padding-24">
          <button class="w3-button w3-black w3-padding-large">Sign Up</button>
        </li>
      </ul>
    </div>
  </div>
</div> -->

<!-- Contact Section -->
<!-- <div class="w3-container w3-light-grey" style="padding:128px 16px" id="contact">
  <h3 class="w3-center">CONTACT</h3>
  <p class="w3-center w3-large">Lets get in touch. Send us a message:</p>
  <div style="margin-top:48px">
    <p><i class="fa fa-map-marker fa-fw w3-xxlarge w3-margin-right"></i> Chicago, US</p>
    <p><i class="fa fa-phone fa-fw w3-xxlarge w3-margin-right"></i> Phone: +00 151515</p>
    <p><i class="fa fa-envelope fa-fw w3-xxlarge w3-margin-right"> </i> Email: mail@mail.com</p>
    <br>
    <form action="/action_page.php" target="_blank">
      <p><input class="w3-input w3-border" type="text" placeholder="Name" required name="Name"></p>
      <p><input class="w3-input w3-border" type="text" placeholder="Email" required name="Email"></p>
      <p><input class="w3-input w3-border" type="text" placeholder="Subject" required name="Subject"></p>
      <p><input class="w3-input w3-border" type="text" placeholder="Message" required name="Message"></p>
      <p>
        <button class="w3-button w3-black" type="submit">
          <i class="fa fa-paper-plane"></i> SEND MESSAGE
        </button>
      </p>
    </form>
    Image of location/map
    <img src="/w3images/map.jpg" class="w3-image w3-greyscale" style="width:100%;margin-top:48px">
  </div>
</div> -->

<!-- Footer -->
<footer class="w3-center w3-padding-8" style=" background-color: rgb(231,228,211);">
  <p class="">
  Product by choi yoon jeong&nbsp;
  Tel : 010-4176-1051&nbsp;
  Email : dkrnahs951816@naver.com
  </p> 
</footer> 
 
<script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}


// Toggle between showing and hiding the sidebar when clicking the menu icon
var mySidebar = document.getElementById("mySidebar");

function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
  } else {
    mySidebar.style.display = 'block';
  }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
}
</script>

</body>
</html>
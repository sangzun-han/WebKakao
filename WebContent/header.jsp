<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="top-header">
    <div class="header__top">
        <div class="header__column">
            <i class="fa fa-fighter-jet"></i>
            <i class="fa fa-wifi"></i>
        </div>
        <div class="header__column">
            <span class="header__time" id="dpTime"></span>
        </div>
        <div class="header__column">
            <i class="fa fa-moon-o"></i>
            <i class="fa fa-bluetooth-b"></i>
            <span class="header__battery">100% <i class="fa fa-battery-full"></i></span>
        </div>
    </div>
    <div class="header__bottom">
        <div class="header__column">
            <span class="header__text"></span>
        </div>
        <div class="header__column">
            <span class="header__text">카카오톡<span class="header__number"></span></span>
        </div>
        <div class="header__column">
          <a href="./profile.jsp"><i class="fa fa-cog fa-lg" style="color:white"></i></a>
        </div>
    </div>
</header>
<script type="text/javascript">
    setInterval("dpTime()",1000);
    function dpTime(){
       var now = new Date();
        hours = now.getHours();
        minutes = now.getMinutes();
        seconds = now.getSeconds();
 
        if (hours > 12){
            hours -= 12;
        ampm = "오후 ";
        }else{
            ampm = "오전 ";
        }
        if (hours < 10){
            hours = "0" + hours;
        }
        if (minutes < 10){
            minutes = "0" + minutes;
        }
		document.getElementById("dpTime").innerHTML = ampm + hours + ":" + minutes;
    }
</script>
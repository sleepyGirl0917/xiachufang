$(function(){
    var index=0;
    function ChangeImg() { 
        index++; 
        var a=document.getElementsByClassName("carousel-item"); 
        if(index>=a.length) index=0; 
        for(var i=0;i<a.length;i++){ 
            a[i].style.display='none'; 
        } 
        a[index].style.display='block'; 
    } 
    //设置定时器，每隔两秒切换一张图片 
    setInterval(ChangeImg,2000);   
})

/* <div id="demo" class="carousel" data-ride="carousel">
  <!-- 导航的图片-->
  <div class="carousel-inner w-100 text-center">
    <div class="carousel-item active">
        <img src="banner1.png" />
        <div class="carousel-caption text-danger">
            <h3>第一张图片的标题</h3>
            <p>第一张图片的内容</p>
        </div>
    </div>
    <div class="carousel-item">
        <img src="banner2.png" />
    </div>
    <div class="carousel-item">
        <img src="banner3.png" />
    </div>
    <div class="carousel-item">
        <img src="banner4.png" />
    </div>
  </div>
  <!-- 导航指示符-->
  <ul class="carousel-indicators">
    <li class="active" data-target="#demo" data-slide-to="0" ></li>
    <li data-slide-to="1" data-target="#demo"></li>
    <li data-slide-to="2" data-target="#demo"></li>
    <li data-slide-to="3" data-target="#demo"></li>
  </ul>
  <!-- 左右箭头-->
  <a href="#demo" data-slide="prev" class="carousel-control-prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a href="#demo" data-slide="next" class="carousel-control-next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div> */
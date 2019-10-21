//仅DOM内容加载后就提前执行
$(function(){
  // 控制二级列表的显示/隐藏
  $(function () {
    var $submenu=$("[data-list=submenu]");
    $submenu.parent().hover(
      function(){
        $(this).find('[data-list=submenu]').css("display","block");
      }, //mouseenter
      function(){
        $(this).find('[data-list=submenu]').css("display","none");
      }  //mouseleave
    )
  })

  /* window.onload = function () {
    var elems = document.querySelectorAll("[data-list=submenu]");
    for (let elem of elems) {
      let parent = elem.parentElement;
      // 添加事件监听对象
      parent.addEventListener("mouseover",function () {
        elem.setAttribute("style","display:block;")
      });
      parent.addEventListener("mouseout",function () {
        elem.setAttribute("style","display:none;")
      });
    }
  } */

  // JQ实现点击返回顶部（有动画过渡）
  $(function () {
    $(window).scroll(function () {
      if ($(window).scrollTop() > 800) {
        $("#toTop").fadeIn(500);
      }
      else {
        $("#toTop").fadeOut(500);
      }
    });
    $("#toTop").click(function () {
      $('body,html').animate({ scrollTop: 0 }, 20);
    });
  });

/* window.onscroll = function () {
// 获得滚动过的距离——网页顶部超出文档显示区顶部的距离
var scrollTop = document.body.scrollTop
  || document.documentElement.scrollTop;
// console.log(scrollTop);
if (scrollTop >= 800)
  toTop.style.display = "block";
else
  toTop.style.display = "none";
}

window.onload=function() {
  var toTop = document.getElementById("toTop");
  toTop.addEventListener("click", function () {
    scrollTo(0, 0);
  })
} */
  
  // 轮播图
  $.ajax({
    url:"http://localhost:3000/carousel",
    type:"get",
    dataType:"json",//自动JSON.parse()
    //提前给success赋值一个回调函数
    //在请求成功后自动执行
    //参数data可自动获得服务端返回的数据
    success:function(data){
      //data形参接住了ajax抛出的服务端返回的数据对象
      // 轮播图1
      for(var i=0;i<5;i++){
        var list=data[i];
        //复制轮播图第一张图的HTML片段，并用模板字符串，填充其中动态生成的部分
        var html = `<a href="${list.recipe_href}">
          <img src="${list.recipe_img}" title="${list.recipe_title}" alt="${list.recipe_title}">
        </a>
        <div class="carousel-caption p-0" title="${list.recipe_title}">
          <a href="${list.recipe_href}" class="d-block text-white carousel-title">${list.recipe_title}</a>
          <div>
            <a href="${list.recipe_href}" class="text-white carousel-num">${list.num_used} 人做过这道菜&nbsp;&nbsp;</a>
            <a href="${list.user_href}" class="text-white carousel-author">&nbsp;&nbsp;by ${list.uname}</a>
          </div>
        </div>`;
        //将片段填充回页面中原父元素内 
        $("#home-carousel .carousel-inner .carousel-item").eq(i).html(html);
      } 
    }
  })

  /* var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      var result = JSON.parse(xhr.responseText);
      console.log(result)
      for(var i=0;i<result.length;i++){
        var list=result[i];
        // $("#home-carousel img")[i]; //返回的是DOM对象，attr() 方法 只能被JQuery对象使用
        $("#home-carousel img").eq(i).attr({
          'src':list.recipe_img,
          'title':list.recipe_title,
          'alt':list.recipe_title,
        });
        $("#home-carousel .carousel-title").eq(i).html(list.recipe_title)
        console.log($("#home-carousel img").eq(i).parent()[0].href)
      }
    }
  };
  xhr.open("get", "/carousel", true);
  xhr.send(null); */

  // 新秀菜谱
  $.ajax({
    url: "http://localhost:3000/explore",
    type: "get",
    dataType: "json",
    success: function (data) {
      for (var i = 0; i < 5; i++) {
        var list = data[i];
        var html = `<li class="d-block" style="width:20%;">
          <ul class="list-unstyled d-flex justify-content-between">
            
          </ul>
        </li>`;
        {/* 每组3张图 */ }
        for (var j = 0; j < 3; j++) {
          var sub_list = list[j];
          var sub_html = `<li class="rookie-recipe-item text-center">
            <a href="#" class="d-block">
              <img src="./img/recipe/rising/8465141fae7d4256bd6133171a6cf3af_913w_1370h.jpg" title="奥特曼生日蛋糕">
            </a>
            <div class="m-1 text-truncate">
              <a href="#" class="homemenu-link">奥特曼生日蛋糕</a>
            </div>
          </li>`;
          $(".rookie-recipe .rookie-recipe-list>ul ul").eq(j).html(html);
        }
        $(".rookie-recipe .rookie-recipe-list>ul").eq(i).html(html);
      }
    }
  })

})

    // 5组
    <li class="d-block" style="width:20%;">
      <ul class="list-unstyled d-flex justify-content-between">
        {/* 每组3张图 */}
        <li class="rookie-recipe-item text-center">
          <a href="#" class="d-block">
            <img src="./img/recipe/rising/8465141fae7d4256bd6133171a6cf3af_913w_1370h.jpg" title="奥特曼生日蛋糕">
          </a>
          <div class="m-1 text-truncate">
            <a href="#" class="homemenu-link">奥特曼生日蛋糕</a>
          </div>
        </li>  
      </ul>
    </li>
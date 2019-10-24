//仅DOM内容加载后就提前执行
$(function () {
  // 控制二级列表的显示/隐藏
  $(function () {
    var $submenu = $("[data-list=submenu]");
    $submenu.parent().hover(
      function () {
        $(this).find('[data-list=submenu]').css("display", "block");
      }, //mouseenter
      function () {
        $(this).find('[data-list=submenu]').css("display", "none");
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
    url: "http://localhost:3000/carousel",
    type: "get",
    dataType: "json",
    success: function (data) {
      console.log(data)
      for (var i = 0; i < 5; i++) {
        var list = data[i];
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
    .then(function () {
      // getHeight($("#home-carousel .carousel-item img"),0.5); //和轮播图冲突
    });

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
    url: "http://localhost:3000/explore/rising",
    type: "get",
    dataType: "json",
    success: function (data) {
      console.log(data)
      for (var i = 0; i < 15; i++) {
        var list = data[i];
        var html = `<a href="${list.recipe_href}" class="d-block">
          <img src="${list.recipe_img}" title="${list.recipe_title}">
        </a>
        <div class="m-1 text-truncate">
          <a href="${list.recipe_href}" class="homemenu-link">${list.recipe_title}</a>
        </div>`;
        $(".rookie-recipe .rookie-recipe-list .rookie-recipe-item").eq(i).html(html);
      }
    }
  })
    .then(function () {
      getHeight($(".rookie-recipe-item img"));
      // 记录移动次数
      var step = 0;
      var $btnLeft = $(".rookie-recipe .rookie-recipe-title .home-icon-left-arrow");
      var $btnRight = $btnLeft.next();
      var width = $(".rookie-recipe-list").width();
      var $ul = $(".rookie-recipe-list>ul");
      // 拉伸窗口时，width和ul的外边距跟随改变
      $(window).resize(function () {
        width = $(".rookie-recipe-list").width();
        $ul.css("margin-left", -width * step);
      })
      // $ul左外边距为0时，禁用左边按钮
      if ($ul.css("margin-left") == '0px') {
        $btnLeft.addClass("disabled");
      }
      // 图片数量<=3时，禁用右边按钮
      if ($ul.find("img").length <= 3) {
        $btnRight.addClass("disabled");
      }
      // 右边按钮不是disabled时，点击按钮ul向左移动一次
      $btnRight.click(function () {
        if ($(this).is(":not(.disabled)")) {
          step++;
          $ul.css("margin-left", -width * step);
          // console.log(step)
          // 启用左边按钮
          $btnLeft.removeClass("disabled");
          if (3 * step + 3 == 15) {
            $(this).addClass("disabled");
          }
        }
      })
      // 左边按钮不是disabled时，点击按钮ul向右移动一次
      $btnLeft.click(function () {
        if ($(this).is(":not(.disabled)")) {
          step--;
          $ul.css("margin-left", -width * step);
          // console.log(step)
          // 启用右边按钮
          $btnRight.removeClass("disabled");
          if (step == 0) {
            $(this).addClass("disabled");
          }
        }
      })
    })

  // 最近流行
  $.ajax({
    url: "http://localhost:3000/explore",
    type: "get",
    dataType: "json",
    success: function (data) {
      console.log(data)
      var html = "";
      for (var i = 0; i < 12; i++) {
        var list = data[i];
        html += `<li>
          <div class="text-center recipe-pop-border recipe-width">
            <a href="${list.recipe_href}" class="d-block">
              <img src="${list.recipe_img}" title="${list.recipe_title}">
            </a>
            <div class="recipe-title">
              <a href="${list.recipe_href}" class="homemenu-link d-block text-truncate">${list.recipe_title}</a>
            </div>
            <div class="stats mb-3">
              <a href="${list.user_href}" class="homemenu-link">${list.uname}</a>
              &nbsp;&nbsp;&nbsp;
              <span>${list.num_used} 做过</span>
            </div>
          </div>
        </li>`;
      }
      $(".rencent-pop ul").html(html);
    }
  })
    .then(function () {
      getHeight($(".rencent-pop ul img"));
    })

  // 时令食材
  $.ajax({
    url: "http://localhost:3000/season",
    type: "get",
    dataType: "json",
    success: function (data) {
      console.log(data)
      var html = "";
      for (var i = 0; i < 12; i++) {
        var list = data[i];
        html += `<li>
          <a href="${list.category_href}" class="homemenu-link">
            <img src="${list.food_img}" alt="${list.fname}"><br>
            <span>${list.fname}</span>
          </a>
        </li>`;
      }
      $(".seasonal-ingredients .season-bg ul").html(html);
      for (var j = 0; j < 8; j++) {
        var _list = data[j];
        var $li = $(`<li><a href="${_list.category_href}" class="head-link">${_list.fname}</a><span>${_list.score.toFixed(1)}</span></li>`);
        $li.appendTo($("header .season"));
      }
    }
  })
    .then(function () {
      getHeight($(".seasonal-ingredients .season-bg ul img"), 1)
    })

  // 流行菜单
  $.ajax({
    url: "http://localhost:3000/menu",
    type: "get",
    dataType: "json",
    success: function (data) {
      console.log(data)
      var html = "";
      for (var i = 0; i < 4; i++) {
        var list = data[i];
        html += `<li>
          <a href="#" class="text-center recipe-pop-border d-block homemenu-link" title="那些拿得出手的硬菜">
            <img src="./img/recipe/pop/c4722f06870111e6a9a10242ac110002_640w_414h.jpg">
            <div class="pop-recipe-title text-truncate">那些拿得出手的硬菜</div>
          </a>
        </li>`;
      }
      $(".pop-recipe ul").html(html);
    }
  })
    .then(function () {
      getHeight()
    })

  // 下厨房的厨友们
  $.ajax({
    url: "http://localhost:3000/user",
    type: "get",
    dataType: "json",
    success: function (data) {
      console.log(data)
      var html = "";
      for (var i = 0; i < 7; i++) {
        var list = data[i];
        html += `<li>
          <div class="cooker-container">
            <div class="avatar">
              <a href="${list.user_href}"><img src="${list.avatar}"></a>
            </div>
            <div class="detail">
              <div class="text-truncate name"><a href="${list.user_href}" class="homemenu-link">${list.uname}</a></div>
              <div class="stats">680&nbsp;关注</div>
              <div class="stats">56&nbsp;个菜谱&nbsp;3973&nbsp;个作品</div>
            </div>
            <div class="concern">
              <a href="#" class="button">关注</a>
            </div>
          </div>
        </li>`;
        // 修改用户数据表，增加关注的人，被关注，作品，收藏菜谱数量
      }
      $(".cookers ul").html(html);
    }
  })
    .then(function () {
      getHeight($(".cookers img"), 1)
    })

  // 宽高比例自适应
  function getHeight($img, n = 0.6) {
    console.log($img)
    var width = $img.width();
    $img.css("height", width * n)
    $(window).resize(function () {
      width = $img.width();
      $img.css("height", $img.width() * n)
      console.log('width：' + width + '，height：' + width * n)
    })
  }

})
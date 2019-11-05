//仅DOM内容加载后就提前执行
$(function () {
  // 宽高比例自适应
  function getHeight($img, n = 0.6) {
    // console.log($img)
    var width = $img.width();
    $img.css("height", width * n);
    $(window).resize(function () {
      width = $img.width();
      $img.css("height", $img.width() * n);
      // console.log('width：' + width + '，height：' + width * n)
    })
  }

  $.ajax({
    url: "http://localhost:3000/index",
    type: "get",
    dataType: "json",
    success: function (data) {
      console.log(data);
      var { carouselItems, risingItems, exploreItems, seasonItems, menuItems, userItems } = data;
      var html = "";
      // 轮播图
      for (var i = 0; i < 5; i++) {
        var list = carouselItems[i];
        //复制轮播图的HTML片段，并用模板字符串，填充其中动态生成的部分
        if (i == 0) {
          html += `<div class="carousel-item active">`;
        } else {
          html += `<div class="carousel-item">`;
        }
        html += `<a href="${list.recipe_href}">
            <img src="${list.recipe_img}" title="${list.recipe_title}" alt="${list.recipe_title}">
          </a>
          <div class="carousel-caption p-0" title="${list.recipe_title}">
            <a href="${list.recipe_href}" class="d-block text-white carousel-title">${list.recipe_title}</a>
            <div>
              <a href="${list.recipe_href}" class="text-white carousel-num">${list.num_used} 人做过这道菜&nbsp;&nbsp;</a>
              <a href="${list.user_href}" class="text-white carousel-author">&nbsp;&nbsp;by ${list.uname}</a>
            </div>
          </div>
        </div>`;
        //将片段填充回页面中原父元素内 
        $("#home-carousel .carousel-inner").html(html);
      }
      // 新秀菜谱
      for (var i = 0; i < 15; i++) {
        var list = risingItems[i];
        var html = `<a href="${list.recipe_href}" class="d-block">
          <img src="${list.recipe_img}" title="${list.recipe_title}">
        </a>
        <div class="m-1 text-truncate">
          <a href="${list.recipe_href}" class="homemenu-link">${list.recipe_title}</a>
        </div>`;
        $(".rookie-recipe .rookie-recipe-list .rookie-recipe-item").eq(i).html(html);
      }
      // 最近流行
      var html = "";
      for (var i = 0; i < 12; i++) {
        var list = exploreItems[i];
        html += `<li>
          <div class="text-center item-border recipe-width">
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
      // 时令食材
      var html = "";
      for (var i = 0; i < 12; i++) {
        var list = seasonItems[i];
        html += `<li>
          <a href="${list.category_href}" class="homemenu-link">
            <img src="${list.food_img}" alt="${list.fname}"><br>
            <span class="text-truncate">${list.fname}</span>
          </a>
        </li>`;
      }
      for (var i = 0; i < 8; i++) {
        var _list = seasonItems[i];
        var $li = $(`<li><a href="${_list.category_href}" class="link">${_list.fname}</a><span>${_list.score.toFixed(1)}</span></li>`);
        $li.appendTo($("header .season"));
      }
      $(".seasonal-ingredients .season-bg ul").html(html);
      // 流行菜单
      var html = "";
      for (var i = 0; i < 6; i++) {
        var list = menuItems[i];
        html += `<li>
          <a href="${list.menu_href}" class="text-center item-border d-block homemenu-link" title="${list.menu_title}">
            <img src="${list.cover_img}">
            <div class="menu-items-title text-truncate">${list.menu_title}</div>
          </a>
        </li>`;
      }
      $(".pop-menu ul").html(html);
      // 下厨房的厨友们
      var html = "";
      for (var i = 0; i < 8; i++) {
        var list = userItems[i];
        html += `<li>
          <div class="cooker-container">
            <div class="avatar">
              <a href="${list.user_href}"><img src="${list.avatar}"></a>
            </div>
            <div class="detail">
              <div class="text-truncate name"><a href="${list.user_href}" class="homemenu-link">${list.uname}</a></div>
              <div class="stats">${list.num_concerned}&nbsp;关注</div>
              <div class="stats">${list.num_recipe}&nbsp;个菜谱&nbsp;${list.num_upload}&nbsp;个作品</div>
            </div>
            <div class="concern">
              <a href="javascript:;" class="button" data-user-id="${list.uid}">关注</a>
            </div>
          </div>
        </li>`;
      }
      $(".cookers ul").html(html);
    }
  })
    .then(function () {
      getHeight($(".rookie-recipe-item img"));
      getHeight($(".rencent-pop ul img"));
      getHeight($(".seasonal-ingredients .season-bg ul img"), 1);
      getHeight($(".pop-menu ul img"));
      getHeight($(".cookers img"), 1);
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

}) 
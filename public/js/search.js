$(function () {
  $.ajax({
    url: "/index",
    type: "get",
    dataType: "json",
    success: function (data) {
      var { seasonItems } = data;
      // header:时令食材
      var html = "";
      for (var i = 0; i < 8; i++) {
        var list = seasonItems[i];
        var $li = $(`<li><a href="${list.category_href}" class="link">${list.fname}</a><span>${list.score.toFixed(1)}</span></li>`);
        $li.appendTo($("header .season"));
      }
      $(".seasonal-ingredients .season-bg ul").html(html);
    }
  })

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

  if (location.search !== "") {
    // 对编码的url进行解码，获取地址栏参数
    var str = decodeURI(location.search);
    str = str.slice(1);
    str = str.split("&");
    var param = {};
    for (var i = 0; i < str.length; i++) {
      param[str[i].split("=")[0]] = str[i].split("=")[1]
    }
    // console.log(param)

    // 向服务器发送请求
    $.ajax({
      url: "/search",
      type: "get",
      data: param,
      dataType: "json",
      success: function (data) {
        console.log(data)
        var code = data.code;
        var mode = data.mode;
        if (code == 400) {
          window.location.href = "/search.html";
        } else {
          var { firstList, secondList } = data.data;
          if (mode == 1) {
            if (firstList.length > 0) {
              $(".search-result-list .has-result").css("display", "block")
              $(".has-result .search-title").html(`${param.keyword}`);
              var html = "";
              for (var i = 0; i < firstList.length; i++) {
                var list = firstList[i];
                html += `<li>
                    <div class="list-item-float clearfix">
                      <a href="javascript:;" class="w-40 pr-3" title="${list.recipe_title}">
                        <img src="${list.recipe_img}" alt="">
                      </a>
                      <div class="info w-60">
                        <p class="name text-truncate"><a href="javascript:;">${list.recipe_title}</a></p>
                        <p class="details text-truncate">${list.category}</p>
                        <p class="stats text-truncate">
                          综合评分&nbsp;<span class="score bold green-font">${list.score}</span>&nbsp;（<span class="bold score">${list.num_used}</span>&nbsp;做过）
                        </p>
                        <p class="author text-truncate">
                          <a href="javascript:;" target="_blank">${list.uname}</a>
                        </p>
                      </div>
                    </div>
                  </li>`;
              }
              $(".search-result ul").html(html);
              // 右侧
              var html = "";
              if (secondList.length > 0) {
                for (var i = 0; i < secondList.length; i++) {
                  var list = secondList[i];
                  html += `<li>
                      <a href="${list.menu_href}" class="text-center item-border d-block homemenu-link" title="${list.menu_title}">
                        <img src="${list.cover_img}" alt="">
                        <div class="menu-items-title text-truncate">${list.menu_title}</div>
                      </a>
                    </li>`;
                }
                $(".search-page .title").html("相关菜单");
                $(".search-page ul").html(html);
              } else {
                $(".search-page .title").html("没有相关菜单");
              }
            } else {
              $(".search-result-list .no-result").css("display", "block");
              $(".no-result .link").html(`创建一个“${param.keyword}”菜谱`);
              $(".search-page .menu-items").html("");
            }
          }
          if (mode == 2) {
            if (firstList.length > 0) {
              $(".search-result").css("display", "block");
              var html = "";
              for (var i = 0; i < firstList.length; i++) {
                var list = firstList[i];
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
              $(".search-result ul").html(html);
            }
            // 右侧
            var html = "";
            for (var i = 0; i < secondList.length; i++) {
              var list = secondList[i];
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
                        <a href="javascript:;" class="button"  data-user-id="${list.uid}">关注</a>
                      </div>
                    </div>
                  </li>`;
            }
            $(".search-cookers .cookers-list ul").html(html);
          }
          if (mode == 3) {
            if (firstList.length > 0) {
              $(".search-result .has-result").css("display", "block");
              $(".search-result-list .search-title").html(`${param.keyword}`)
              var html = "";
              for (var i = 0; i < firstList.length; i++) {
                var list = firstList[i];
                html += `<li>
                    <div class="list-item-float clearfix item-border">
                      <a href="${list.menu_href}" class="w-40 pr-3" title="${list.menu_title}">
                        <img src="${list.cover_img}" alt="">
                      </a>
                      <div class="info w-60">
                        <p class="name text-truncate"><a href="${list.menu_href}">${list.menu_title}</a></p>
                        <div class="stats">
                          <p class="time green-font">${list.num_contains}菜谱</p>
                          <a href="${list.user_href}" class="gray-font author">${list.uname}</a>
                          <span>&nbsp;创建&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.num_collected}&nbsp;收藏</span>
                        </div>
                      </div>
                    </div>
                  </li>`;
              }
              $(".search-result ul").html(html);
              // 右侧
              var html = "";
              for (var i = 0; i < secondList.length; i++) {
                var list = secondList[i];
                html += `<li>
                    <a href="${list.menu_href}" class="text-center item-border d-block homemenu-link" title="${list.menu_title}">
                      <img src="${list.cover_img}" alt="">
                      <div class="menu-items-title text-truncate">${list.menu_title}</div>
                    </a>
                  </li>`;
              }
              $(".search-page ul").html(html);
            } else {
              $(".search-result .no-result").css("display", "block");
              $(".no-result .link").html(`创建一个“${param.keyword}”菜单`);
            }
          }
        }
      }
    })
      .then(function () {
        getHeight($(".search-page ul img"), 0.47)
      })
  }

})
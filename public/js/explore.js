$(function () {
  $.ajax({
    url: "/index",
    type: "get",
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

  if (location.search !== "") {
    // 对编码的url进行解码，获取地址栏参数
    var str = decodeURI(location.search);
    str = str.slice(1);
    str = str.split("&");
    var param = {};
    for (var i = 0; i < str.length; i++) {
      param[str[i].split("=")[0]] = str[i].split("=")[1]
    }

    if (param.class == 'head') { // /explore.html?class=head 
      $.ajax({
        url: "/explore/head",
        type: "get",
        data: "pageSize=7&page="+page,
        success: function (data) {
          console.log(data)
          var { name, firstList, secondList, page, pageSize, count, total } = data;

          // 中间
          var html = "";
          for (var i = 0; i < firstList.length; i++) {
            var list = firstList[i];
            html += `<li>
              <div class="list-item-float clearfix">
                <a href="javascript:;" class="w-40 pr-1" title="${list.recipe_title}">
                  <img src="${list.recipe_img}" alt="">
                </a>
                <div class="info w-60">
                  <p class="name text-truncate"><a href="javascript:;">${list.recipe_title}</a></p>
                  <p class="details text-truncate">${list.category}</p>
                  <p class="stats text-truncate">
                    <span class="green-font font16">${list.date}&nbsp;头条推荐</span>
                  </p>
                  <p class="author text-truncate">
                    <a href="javascript:;" target="_blank">${list.uname}</a>
                  </p>
                </div>
              </div>
            </li>`;
          }
          $(".search-result .search-title").html(name);
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

          // 分页 
          var html = "";
          var str = `<a class="prev">上一页</a>`
          for (var i = 1; i <= total; i++) {
            str += `<a class="page" href="/explore.html?class=head?page=${i}">${i}</a>`
          }
          str += `<a class="next">下一页</a>`
          $(".pager").html(str)
          $('.pager .page').eq(page - 1).addClass('active')
          if (page > 1) {
            $(".pager .prev").attr("href", "/explore.html?class=head?page=" + page)
          } 
          if(page<total){
            $(".pager .next").attr("href", "/explore.html?class=head?page=" + `${parseInt(page)+1}`)
          }
        }
      })
        .then(function () {
          getHeight($(".search-page ul img"), 0.47)
        })
    }
    if (param.class == 'rising') { // /explore.html?class=rising
      $.ajax({
        url: "/explore/rising",
        type: "get",
        success: function (data) {
          console.log(data)
          var { name, firstList, secondList } = data;

          // 中间
          var html = "";
          for (var i = 0; i < firstList.length; i++) {
            var list = firstList[i];
            html += `<li>
              <div class="list-item-float clearfix">
                <a href="javascript:;" class="w-40 pr-1" title="${list.recipe_title}">
                  <img src="${list.recipe_img}" alt="">
                </a>
                <div class="info w-60">
                  <p class="name text-truncate"><a href="javascript:;">${list.recipe_title}</a></p>
                  <p class="details text-truncate">${list.category}</p>
                  <p class="stats text-truncate">
                    <span class="green-font font16">${list.date}&nbsp;第${list.num_used}人做过</span>
                  </p>
                  <p class="author text-truncate">
                    <a href="javascript:;" target="_blank">${list.uname}</a>
                  </p>
                </div>
              </div>
            </li>`;
          }
          $(".search-result .search-title").html(name);
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
        }

      })
        .then(function () {
          getHeight($(".search-page ul img"), 0.47)
        })
    }
    if (param.class == 'popmenu') { // /explore.html?class=popmenu
      $.ajax({
        url: "/explore/popmenu",
        type: "get",
        success: function (data) {
          console.log(data)
          var { name, firstList, secondList } = data;

          // 中间
          var html = "";
          for (var i = 0; i < firstList.length; i++) {
            var list = firstList[i];
            html += `<li>
            <div class="list-item-float clearfix item-border">
              <a href="${list.menu_href}" class="w-40 pr-1" title="${list.menu_title}">
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
          $(".search-result .search-title").html(name);
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
        }
      })
        .then(function () {
          getHeight($(".search-page ul img"), 0.47)
        })
    }

  } else { // /explore.html
    $.ajax({
      url: "/explore",
      type: "get",
      success: function (data) {
        console.log(data)
        var { name, firstList, secondList } = data;

        // 中间
        var html = "";
        for (var i = 0; i < firstList.length; i++) {
          var list = firstList[i];
          html += `<li>
              <div class="list-item-float clearfix">
                <a href="javascript:;" class="w-40 pr-1" title="${list.recipe_title}">
                  <img src="${list.recipe_img}" alt="">
                </a>
                <div class="info w-60">
                  <p class="name text-truncate"><a href="javascript:;">${list.recipe_title}</a></p>
                  <p class="details text-truncate">${list.category}</p>
                  <p class="stats text-truncate">
                    7天内&nbsp;<span class="bold">${list.sevenday_used}</span>&nbsp;人做过
                  </p>
                  <p class="author text-truncate">
                    <a href="javascript:;" target="_blank">${list.uname}</a>
                  </p>
                </div>
              </div>
            </li>`;
        }
        $(".search-result .search-title").html(name);
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
      }
    })
      .then(function () {
        getHeight($(".search-page ul img"), 0.47)
      })
  }

})
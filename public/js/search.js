$(function () {
  /*   $.ajax({
      url: "http://localhost:3000/index",
      type: "get",
      dataType: "json",
      success: function (data) {
        console.log(data);
        var { carouselItems, risingItems, exploreItems, seasonItems, menuItems, userItems } = data;
        
        // 时令食材
        var html = "";
        
        for (var i = 0; i < 8; i++) {
          var _list = seasonItems[i];
          var $li = $(`<li><a href="${_list.category_href}" class="head-link">${_list.fname}</a><span>${_list.score.toFixed(1)}</span></li>`);
          $li.appendTo($("header .season"));
        }
        $(".seasonal-ingredients .season-bg ul").html(html);
        
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
                <a href="#" class="button">关注</a>
              </div>
            </div>
          </li>`;
        }
        $(".cookers ul").html(html);
      }
    })
    .then(function () {
      getHeight($(".cookers img"), 1);
    }) */

  $(function () {
    if (location.search !== "") {
      // 对编码的url进行解码，获取地址栏参数
      var str = decodeURI(location.search);
      str = str.slice(1);
      str = str.split("&");
      var param = {};
      for (var i = 0; i < str.length; i++) {
        param[str[i].split("=")[0]] = str[i].split("=")[1]
      }
      console.log(param)

      // 向服务器发送请求
      $.ajax({
        url: "http://localhost:3000/search",
        type: "get",
        data: param,
        dataType: "json",
        success: function (data) {
          console.log(data)
          var code = data.code;
          var mode = data.mode;
          
          if (code == 400) {
            // 没有keyword
          } else {
            if (mode == 1) {
              var { menuItems, recipeItems } = data.data;
              if (recipeItems.length > 0) {
                $(".search-result-list .has-result").css("display", "block")
                $(".has-result .serach-title").html(`${param.keyword}`);
                var html = "";
                for (var i = 0; i < recipeItems.length; i++) {
                  var list = recipeItems[i];
                  html += `<li>
                    <div class="list-item-float clearfix">
                      <a href="#" class="w-40 pr-3">
                        <img src="${list.recipe_img}" alt="">
                      </a>
                      <div class="info w-60">
                        <p class="name text-truncate"><a href="#">${list.recipe_title}</a></p>
                        <p class="details text-truncate">${list.category}</p>
                        <p class="stats text-truncate">
                          综合评分&nbsp;<span class="score bold green-font">${list.score}</span>&nbsp;（<span class="bold score">${list.num_used}</span>&nbsp;做过）
                        </p>
                        <p class="author text-truncate">
                          <a href="#" target="_blank">${list.uname}</a>
                        </p>
                      </div>
                    </div>
                  </li>`;
                }
                $(".search-result-recipe ul").html(html);
                // 右侧
                var html = "";
                if (menuItems.length > 0) {
                  for (var i = 0; i < menuItems.length; i++) {
                    var list = menuItems[i];
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
                $(".search-page .menu-items").html("");
              }
            }
            if (mode == 2) {
              var { userItems, popUsers } = data.data;
              if (userItems.length > 0) {
                $(".search-result-cookers").css("display", "block");
                var html = "";
                for (var i = 0; i < userItems.length; i++) {
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
                        <a href="#" class="button">关注</a>
                      </div>
                    </div>
                  </li>`;
                }
                $(".search-result-cookers ul").html(html);
              }
              // 右侧
              var html = "";
              for (var i = 0; i < popUsers.length; i++) {
                var list = popUsers[i];
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
                        <a href="#" class="button">关注</a>
                      </div>
                    </div>
                  </li>`;
              }
              $(".search-cookers .cookers-list ul").html(html);
            }
            if (mode == 3) {
              var { menuItems, popMenus } = data.data;
            }
          }
        }
      })
    }
  })

})
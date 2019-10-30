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
        }
      })
    }
  })

})
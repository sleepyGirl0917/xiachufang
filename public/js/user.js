$(function () {
  $.ajax({
    url: "/user/list",
    type: "get",
    dataType: "json",
    success: function (data) {
      console.log(data);
      // 下厨房的厨友们
      var html = "";
      for (var i = 0; i < 16; i++) {
        var list = data[i];
        var islogin = $.cookie('islogin');
        html += `<li class="no-border">
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
                  <a href="${islogin ? 'javascript:;' : '/login.html'}" class="button" data-user-id="${list.uid}">关注</a>
                </div>
              </div>
            </li>`;
      }
      $(".cookers ul").html(html);
    }
  })
})
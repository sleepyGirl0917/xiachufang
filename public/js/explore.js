$(function () {
  $.ajax({
    url: "http://localhost:3000/index",
    type: "get",
    dataType: "json",
    success: function (data) {
      var { seasonItems } = data;
      // header:时令食材
      var html = "";
      for (var i = 0; i < 8; i++) {
        var list = seasonItems[i];
        var $li = $(`<li><a href="${list.category_href}" class="head-link">${list.fname}</a><span>${list.score.toFixed(1)}</span></li>`);
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

    if (param.class == 'head') { // http://localhost:3000/explore.html?class=head 
      $.ajax({
        url: "http://localhost:3000/explore/head",
        type: "get",
        dataType: "json",
        success: function (data) {
          console.log('往期头条')
        }
      })
    }
    if (param.class == 'rising') { // http://localhost:3000/explore.html?class=rising
      $.ajax({
        url: "http://localhost:3000/explore/rising",
        type: "get",
        dataType: "json",
        success: function (data) {
          console.log('新秀菜谱')
        }
      })
    }
    if (param.class == 'menu') { // http://localhost:3000/explore.html?class=popmenu
      $.ajax({
        url: "http://localhost:3000/explore/popmenu",
        type: "get",
        dataType: "json",
        success: function (data) {
          console.log('流行菜单')
        }
      })
    }

  } else {// http://localhost:3000/explore.html
    $.ajax({
      url: "http://localhost:3000/explore",
      type: "get",
      dataType: "json",
      success: function (data) {
        console.log('最近流行')
      }
    })
  }
})
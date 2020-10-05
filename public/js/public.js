$(function () {
  // 是否登录
  $.ajax({
    url: "/user/islogin",
    type: "get",
    dataType: "json",
    xhrFields: {
      withCredentials: true
    },
    crossDomain: true,
    success: function (data) {
      console.log(data);
      if (data.code == 200) {
        var list = data.msg;
        // header .user-action
        var html = `<div class="visible-xs">
          <a href="javascript:;" class="link">个人中心</a>
          <a href="/logout.html" class="link">退出</a>
        </div>
        <div class="hidden-xs">
          <div class="user-avatar">
            <a href="${list.user_href}" class="avatar">
              <img src="${list.avatar}" alt="">
            </a>
            <div class="head-submenu" data-list="submenu">
              <ul class="list-unstyled">
                <li><a href="javascript:;" class="link">我的厨房</a></li>
                <li><a href="javascript:;" class="link">我的菜单</a></li>
                <li><a href="javascript:;" class="link">账号设置</a></li>
                <li><a href="javascript:;" class="link">发现好友 </a></li>
                <li><a href="/logout.html" class="link">退出</a></li>
              </ul>
            </div>
          </div>
          <div class="user-collect">
            <a href="javascript:;" class="collect">
              <i class="home-icon home-icon-collect"></i>
            </a>
          </div>
        </div>`;          
        $("header .user-action").html(html);

        $('[href="/logout.html"]').click(function (e) {
          e.preventDefault();
          $.ajax({
            url: "/user/logout",
            type: "get",
            dataType: "json",
            xhrFields: {
              withCredentials: true
            },
            crossDomain: true,
            success: function (data) {
              if (data.code == 200) {
                window.location.href = "/login.html"
              }
            }
          })
        });

        // .user-info .login
        var html = `<div class="is-login">
            <div class="avatar">
            <a href="${list.user_href}">
                <img src="${list.avatar}" alt="">
            </a>
            </div>
            <div class="name">
            <a href="javascript:;" class="link">${list.uname}的厨房</a>
            </div>
            <div class="stats">
            <a href="javascript:;" class="link">1 收藏</a>
            &nbsp;|&nbsp;
            <a href="javascript:;" class="link">${list.num_upload} 作品</a>
            &nbsp;|&nbsp;
            <a href="javascript:;" class="link">${list.num_recipe} 菜谱</a>
            &nbsp;|&nbsp;
            <a href="javascript:;" class="link">草稿箱</a>
            </div>
            <div class="action">
            <a href="javascript:;" class="button">创建菜谱</a>
            </div>
        </div>`;
        $(".user-info .login").html(html);
      }
    }
  })
    .then(function () {
      // 控制二级列表的显示/隐藏
      $('[data-list=submenu]').parent().bind({
        mouseenter: function () {
          $(this).find('[data-list=submenu]').css("display", "block");
        },
        mouseleave: function () {
          $(this).find('[data-list=submenu]').css("display", "none");
        }
      })
    })

  // $(window).resize(function(){
  //   var w_width = $(window).width();
  //   console.log(w_width);
  // })

  // JQ实现点击返回顶部（有动画过渡）
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

  // 为搜索框绑定oninput，onfocus
  $("header input[type=text]").bind("input focus", () => {
    // 搜索框的值
    var input = $("header input[type=text]").val();
    var html = `<div class="search-item">
                <a href="/search_user.html?mode=2&keyword=${input}">搜“${input}”相关用户</a>
              </div>
              <div class="search-item">
                <a href="/search_menu.html?mode=3&keyword=${input}">搜“${input}”相关菜单</a>
              </div>`;
    if (input) {
      // 搜索框有值时，显示下拉列表，内容和值绑定
      $(".search-menu").html(html);
      $(".search-menu").css("display", "block");
    } else {
      // 搜索框值为空时，隐藏下拉列表，清空html
      $(".search-menu").html("");
      $(".search-menu").css("display", "none");
    }
  })
  // 失去焦点时，仅隐藏下拉菜单
  $("header input[type=text]").blur(function () {
    $(".search-menu").css("display", "none");
  })

  $("header .search-menu").on("mousedown", "a", function () {
    window.location.href = $(this).attr("href");
  })
  // 搜索相关菜谱：form提交
  $("header input[type=submit]").click(function () {
    // 将隐藏域的值改为在后台获取，避免在浏览器篡改
    $("header input[type=hidden]").attr("value", "1");
  })
  // 用户搜索框：form提交
  $(".cooker-search input[type=submit]").click(function () {
    // 将隐藏域的值改为在后台获取，避免在浏览器篡改
    $(".cooker-search input[type=hidden]").attr("value", "2");
  })

})

$(window).on('load', function () {
  var $btn = $(".concern a.button")
  var onOff = true;
  $btn.click(function () {
    var cookerId = $(this).attr("data-user-id");
    if (onOff == true) {
      $(this).css("background", "#ccc7c2").html("已关注");
      onOff = false;
      // 发送关注请求
      $.ajax({
        url: "/user/addconcern",
        type: "get",
        data: "cookerId=" + cookerId,
        dataType: "json",
        xhrFields: {
          withCredentials: true
        },
        crossDomain: true,
        success: function (result) {
          alert(result.msg)
        }
      })
    } else {
      $(this).css("background", "#dd3915").html("关注");
      onOff = true;
      // 发送取消关注请求
      $.ajax({
        url: "/user/delconcern",
        type: "get",
        data: "cookerId=" + cookerId,
        dataType: "json",
        xhrFields: {
          withCredentials: true
        },
        crossDomain: true,
        success: function (result) {
          alert(result.msg)
        }
      })
    }
  })
})
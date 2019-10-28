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

  $(function () {
    // 为搜索框绑定oninput，onfocus
    $("header input[type=text]").bind("input focus", () => {
      // 搜索框的值
      var input = $("header input[type=text]").val();
      var html = `<div class="search-item">
                  <a href="/search/?mode=2&keyword=${input}">搜“${input}”相关用户</a>
                </div>
                <div class="search-item">
                  <a href="/search/?mode=3&keyword=${input}">搜“${input}”相关菜单</a>
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
    // 问题：blur事件会优先于click事件执行，导致click事件无效
    // 解决：使用mousedown替换click使点击选择事件优先执行
    $("header input[type=text]").blur(function () {
      $(".search-menu").css("display", "none");
    })
    // 搜索相关用户/菜单
    $("header .search-menu").on("mousedown","a", function () {
      window.location.href =$(this).attr("href");
    })
    // 搜索相关菜谱
    $("header input[type=submit]").click(function () {
      // 将隐藏域的值改为在后台获取
      $("header input[type=hidden]").attr("value", "1");
      window.location.href = $(this).attr("href");
    })
  })
})
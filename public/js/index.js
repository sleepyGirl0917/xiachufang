window.onload = function () {
  // 控制二级列表的显示/隐藏
  var elems = document.querySelectorAll("[data-list=submenu]")
  for (let elem of elems) {
    let parent = elem.parentElement;
    // 添加事件监听对象
    parent.addEventListener("mouseover",function () {
      elem.setAttribute("style","display:block;")
    })
    parent.addEventListener("mouseout",function () {
      elem.setAttribute("style","display:none;")
    })
  }
}

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

// JQ实现点击返回顶部（有动画过渡）
$(function () {
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
      return false;
    });
  });
});
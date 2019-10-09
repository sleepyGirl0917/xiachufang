window.onload = function () {
  // 控制二级列表的显示/隐藏
  let elems = document.querySelectorAll("[data-list=submenu]")
  for (let elem of elems) {
    var parent = elem.parentElement;
    parent.onmouseover = function () {
      elem.setAttribute("style","display:block;")
    }
    parent.onmouseout = function () {
      elem.setAttribute("style","display:none;")
    }
  }
}

window.onscroll = function () {
  // 获得滚动过的距离——网页顶部超出文档显示区顶部的距离
  var scrollTop = document.body.scrollTop
    || document.documentElement.scrollTop;
  // console.log(scrollTop);
  if (scrollTop >= 800)
    toTop.style.display = "block";
  else
    toTop.style.display = "none";
}

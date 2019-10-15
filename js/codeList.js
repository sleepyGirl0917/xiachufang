// 封装用ul/li模拟select/option的方法
$(document).ready(function () {
  var $dropdown = $(".dropdown");
  var $li = $(".dropdown ul li");
  $dropdown.click(function () {
    // console.log(1);
    $(this).toggleClass("open");
  });
  $li.click(function () {
    // console.log(2);
    $li.removeClass("active");
    $(this).addClass("active");
    $("span.selected").html($(this).html());
  })
  // 点击网页空白区域收回列表
  $(document).click(function (e) {
    // console.log(3);
    // $dropdown为目标区域
    if (!$dropdown.is(e.target) && $dropdown.has(e.target).length == 0) {
      $dropdown.removeClass("open");
    }
  });
  /* 判断点击事件发生在区域外的条件是：
  1. 点击事件的对象不是目标区域本身 !$dropdown.is(e.target)
  2. 事件对象同时也不是目标区域的子元素 $dropdown.has(e.target).length == 0
  */
})
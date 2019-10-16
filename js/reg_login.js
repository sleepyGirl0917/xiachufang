$(document).ready(function () {
  // 滑动验证的初始值
  var success = false; 

  // 封装用ul/li模拟select/option的方法

  /* 
  <div class="dropdown">
    <span class="selected">中国大陆 +86 </span>
    <span class="carat"></span>
    <div>
      <ul>
        <li class="active">中国大陆 +86 </li>
        <li class="">中国台湾 +886 </li>
        <li class="">中国香港 +852 </li>
        <li class="">中国澳门 +853 </li>
      </ul>
    </div>
  </div> 
  */
  
  function codeList() {
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
  }
  /* 
  判断点击事件发生在区域外的条件是：
  1. 点击事件的对象不是目标区域本身!$dropdown.is(e.target)
  2. 事件对象同时也不是目标区域的子元素 $dropdown.has(e.target).length == 0 
  */
  
  // 验证手机号码格式
  function phone_valid() {
    var $tel = $("input.tel");
    var valid_rule = /^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
    var phone_number = $tel.val();
    // console.log(phone_number)
    if (!valid_rule.test(phone_number)) {
      console.log('手机号码格式有误');
      $("form>.error").html('手机号码格式有误');
      return false;
    } else {
      return true;
    }
  }

  // 判断滑动验证
  /* function vali_success(success) {
    if (!success) {
      console.log('没有进行滑动验证或验证失败');
      return;
    } else {
      console.log('滑动验证成功');
    }
  } */

  // 验证密码格式
  function password_valid() {
    console.log('密码格式验证中···')
    // console.log('密码长度为6~12位');
  }

  // 验证码格式
  function code_valid() {
    console.log('验证码格式验证中···')
  }

  // 发送验证码
  function sendCode() {
    $timer = $("span.timer");
    $("span.action").html('重发验证码');
    $timer.css("display", "inline-block");
    var timeCounter = setInterval(function () {
      var time = parseInt($timer.html());
      time--;
      if (time == 0) {
        // $timer.html("");
        $timer.css("display", "none");
        clearInterval(timeCounter);
      } else {
        $timer.html(time);
      }
    }, 1000);
    // 向服务器发送请求，接收服务器返回的结果
    console.log('验证码发送成功');
  }

  // 判断验证码是否正确：判断输入框的内容与服务器返回结果是否一致
  function codeJudge() {
    console.log('正在判断验证码是否正确···');
  }

  codeList();

  // 点击发送验证码
  $("a.sendCode").click(function () {
    phone_valid();
    if (success) {
      sendCode() 
    } else {
      console.log('没有进行滑动验证');
      return;
    }
  })
  
  // 拖动滑块
  /*
    <div id="dragContainer">
    <div id="dragBg"></div>
    <div id="dragText">
      <span>请按住滑块，拖动到最右边</span>
    </div>
    <div id="dragHandler" class="dragHandlerBg">&gt;&gt;</div>
    </div>
  */
  $("#dragHandler").mousedown(function (e) {
    // 鼠标按下之前必须清除掉后面设置的过渡属性
    $("#dragBg").css("transition", "");
    $("#dragHandler").css("transition", "");
    // 当滑块位于初始位置时，得到鼠标按下时的水平位置
    var startX = e.clientX;
    var $text = $("#dragText>span"); // 文字
    var distanse = $("#dragContainer").width() - $("#dragHandler").width(); // 滑动距离
    // var success = false; // 验证成功的判断标准

    // 按下滑块之后给文档注册鼠标移动事件
    $(document).mousemove(function (e) {
      // 获取鼠标移动后的水平位置
      var endX = e.clientX;
      //鼠标水平位置的偏移量
      var offsetX = endX - startX;
      if (offsetX < 0) {
        offsetX = 0;
      } else if (offsetX >= distanse) {
        offsetX = distanse;
        // 1.设置滑动成功后的样式
        $text.html('验证通过');
        $text.css("color", '#fff');
        $("#dragHandler").html('');
        $("#dragHandler").addClass('btn_ok');
        $("#dragBg").css("background", '#76c61d');
        // 2.设置滑动成功后的状态
        success = true;
        // 3.成功后，清除掉鼠标按下事件和移动事件
        $("#dragHandler").off('mousedown'); // 不清除，验证成功后滑块仍然可以拖动
        $(document).off('mousemove'); // 不清除，滑块始终跟随鼠标移动
      }
      // 4.根据鼠标移动的距离来动态设置滑块的偏移量和背景颜色的宽度 
      $("#dragHandler").css("left", offsetX);
      $("#dragBg").css('width', offsetX);
    });
    
    // 按下滑块之后给文档注册鼠标松开事件
    $(document).mouseup(function (e) {
      if (!success) {
        // console.log(success)
        // 将滑块复位（设置了1s的属性过渡效果）
        $("#dragBg").css({
          "width": 0,
          "transition": "width 1s ease"
        });
        $("#dragHandler").css({
          "left": 0,
          "transition": "left 1s ease"
        });
      } else {
        // console.log(success)
      }
      // 鼠标松开，清除鼠标移动和松开事件
      $(document).off('mousemove'); // 不清除，松开鼠标后滑块仍然跟随鼠标移动
      $(document).off('mouseup');
      // 松开鼠标后，一次滑块拖动完成，返回判断滑动验证是否成功
      if (!success) {
        console.log('滑动验证失败');
      } else {
        console.log('滑动验证成功');
      } 
    })
  })

  // 点击注册
  $(".reg-box input[type=submit]").click(function (e) {
    // 阻止submit的默认提交
    e.preventDefault();
    console.log('开始注册···');
    // 1、验证手机号码格式
    phone_valid();
    // 2、验证密码格式
    password_valid();
    // 3、验证码格式
    code_valid();
    // 4、判断滑动验证
    if (!success) {
      console.log('没有进行滑动验证或验证失败');
      return;
    } else {
      console.log('滑动验证成功');
    }
    // 5、判断验证码：输入框的内容与服务器返回结果是否一致
    codeJudge();
    // 6、注册：写入数据库
    console.log('注册成功')
  })

  // 点击登录
  $(".submit input[type=submit]").click(function (e) {
    // 1、阻止submit的默认提交
    e.preventDefault();
    console.log('开始登录');
    // 2、验证手机号码格式
    phone_valid();
    // 3、验证码格式
    // 4、判断滑动验证
    if (!success) {
      console.log('没有进行滑动验证或验证失败');
      return;
    } else {
      console.log('滑动验证成功');
    }
    // 5、验证登录信息：手机号是否注册（该用户不存在）->验证码
    // 6、登录成功
    console.log('登录成功');
  })
})

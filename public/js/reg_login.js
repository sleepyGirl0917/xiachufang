$(function () {
  // 验证成功的判断标准
  var successPhoneNumber = false; // 手机号码验证初始值
  var successPwd = false; // 密码格式初始值
  var successCode = false; // 验证码格式验证初始值
  var successDrag = false; // 滑动验证的初始值

  codeList();

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
      /* 
      判断点击事件发生在区域外的条件是：
      1. 点击事件的对象不是目标区域本身!$dropdown.is(e.target)
      2. 事件对象同时也不是目标区域的子元素 $dropdown.has(e.target).length == 0 
      */
    });
  }

  // 验证手机号码格式
  function phone_valid() {
    var $tel = $("input.tel");
    var valid_rule = /^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
    var phone_number = $tel.val();
    if (valid_rule.test(phone_number)) {
      successPhoneNumber = true;
    } else {
      successPhoneNumber = false;
    }
  }

  // 验证密码格式
  function password_valid() {
    console.log('密码格式验证中···')
    var $pwd = $("input.password");
    var valid_rule = /^\w{6,12}$/;
    var password = $pwd.val();
    if (valid_rule.test(password)) {
      successPwd = true;
    } else {
      successPwd = false;
    }
  }

  // 判断验证码格式
  function code_valid() {
    console.log('验证码格式验证中···')
    var $code = $("input.code");
    var valid_rule = /^\d{6}$/;  //验证码是6位数字
    var code_number = $code.val();
    if (valid_rule.test(code_number)) {
      successCode = true;
    } else {
      successCode = false;
    }
  }

  // 滑块验证
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
        successDrag = true;
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
      if (!successDrag) {
        // console.log(successDrag)
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
        // console.log(successDrag)
      }
      // 鼠标松开，清除鼠标移动和松开事件
      $(document).off('mousemove'); // 不清除，松开鼠标后滑块仍然跟随鼠标移动
      $(document).off('mouseup');
      // 松开鼠标后，一次滑块拖动完成，返回判断滑动验证是否成功
      if (!successDrag) {
        console.log('滑动验证失败');
      } else {
        console.log('滑动验证成功');
      }
    })
  })

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
    // 向服务器发送请求
    $.ajax({
      url:"http://localhost:3000/user/code",
      type:"post",
      data:{tel:$("input.tel").val()},
      // dataType:"json",
      success:function(res){
        console.log('验证码发送成功，并接收到验证码' + res);
        console.log(typeof (res));
      }
    })
    /* var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
      if (xhr.readyState == 4 && xhr.status == 200) {
        var result = xhr.responseText;
        console.log('验证码发送成功，并接收到验证码' + result);
      }
    }
    xhr.open('post', "/user/code", true)
    var formdata = "tel=" + $("input.tel").val();
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send(formdata); */
  }

  // 点击发送验证码：手机号和滑块验证
  $("a.sendCode").click(function () {
    phone_valid();
    if (!successPhoneNumber) {
      // console.log('手机号码格式有误');
      $("form>.error").html('手机号码格式有误');
      return;
    }
    if (successDrag) {
      sendCode();
    } else {
      // console.log('没有进行滑动验证');
      $("form>.error").html('请完成滑动验证');
      return;
    }
  })

  // 点击注册
  $(".reg-box input[type=submit]").click(function (e) {
    // 阻止submit的默认提交
    e.preventDefault();
    // 1、验证手机号码格式
    phone_valid();
    if (!successPhoneNumber) {
      // console.log('手机号码格式有误');
      $("form>.error").html('手机号码格式有误');
      return;
    }
    // 2、验证密码格式
    password_valid();
    if (!successPwd) {
      // console.log('密码长度为6~12位');
      $("form>.error").html('密码长度为6~12位');
      return;
    }
    // 3、验证码格式(6位)：验证码格式正确之后，判断滑动验证
    code_valid();
    if (!successCode) {
      // console.log('验证码格式错误');
      $("form>.error").html('验证码格式错误');
      return;
    }
    // 4、判断滑动验证
    if (!successDrag) {
      // console.log('没有进行滑动验证或验证失败');
      $("form>.error").html('请完成滑动验证');
      return;
    } else {
      console.log('滑动验证成功');
    }
    // 5、向服务器发送注册请求
    $.ajax({
      url:"http://localhost:3000/user/registe",
      type:"post",
      data:{
        tel:$("input.tel").val(),
        password:$("input.password").val(),
        code:$("input.code").val(),
      },
      dataType:"json",
      success:function(res){
        console.log(res);
        if(res.code==200){
          window.location.href = '/index.html';
        }else{
          $("form>.error").html(res.msg);
        }
      }
    })
    
    /* var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
      if (xhr.readyState == 4 && xhr.status == 200) {
        var result = JSON.parse(xhr.responseText);
        console.log(result);
        if(result.code==200){
          window.location.href = '/index.html';
        }else{
          $("form>.error").html(result.msg);
        }
      }
    };
    xhr.open("post", "/user/registe", true);
    var formdata = "tel=" + $("input.tel").val() + "&password=" + $("input.password").val()+"&code="+$("input.code").val();
    // console.log(formdata)
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send(formdata); */

  })

  // 点击登录
  $(".submit input[type=submit]").click(function (e) {
    // 1、阻止submit的默认提交
    e.preventDefault();
    // 2、验证手机号码格式
    phone_valid();
    if (!successPhoneNumber) {
      // console.log('手机号码格式有误');
      $("form>.error").html('手机号码格式有误');
      return;
    }
    // 3、验证码格式
    code_valid();
    if (!successCode) {
      // console.log('验证码格式错误');
      $("form>.error").html('验证码格式错误');
      return;
    }
    // 4、判断滑动验证
    if (!successDrag) {
      // console.log('没有进行滑动验证或验证失败');
      $("form>.error").html('请完成滑动验证');
      return;
    } else {
      console.log('滑动验证成功');
    }
    // 5、向服务器发送登录请求
    $.ajax({
      url:"http://localhost:3000/user/login",
      type:"post",
      data:{
        tel:$("input.tel").val(),
        code:$("input.code").val(),
      },
      dataType:"json",
      success:function(res){
        console.log(res);
        if(res.code == 200){
          // window.location.href = '/index.html';
        }else{
          $("form>.error").html(res.msg);
        }
      }
    })

    /* var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
      if (xhr.readyState == 4 && xhr.status == 200) {
        var result = JSON.parse(xhr.responseText);
        console.log(result)
        if(result.code == 200){
          window.location.href = '/index.html';
        }else{
          $("form>.error").html(result.msg);
        }
      }
    };
    xhr.open("post", "/user/login", true);
    var formdata = "tel=" + $("input.tel").val() + "&code=" + $("input.code").val();
    // console.log(formdata)
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send(formdata); */

  })

  // 监听error提示，出现3秒后清空
  $("form>.error").bind("DOMNodeInserted", function () {
    setTimeout(() => {
      $("form>.error").html('');
    }, 3000)
  })

})

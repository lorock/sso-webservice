<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>大数据应用分析平台</title>

    <link rel="stylesheet" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />

    <link rel="stylesheet" href="/static/Font-Awesome-3.2.1/css/font-awesome.min.css" />

    <link rel="stylesheet" href="/static/css/animate.css"/>

    <link rel="stylesheet" href="/static/theme/default/index.css"/>

    <link rel="stylesheet" href="/static/nprogress/nprogress.css"/>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static/js/jquery-3.1.1.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <script src="/static/nprogress/nprogress.js"></script>

</head>
<body style="background-size: cover;background-image: url('/static/images/login_bg.jpg')">
<div class="container-fluid text-center">
    <img id="h-login-login-form" src="/static/images/login_form.png" style="display: none"/>
    <div id="h-login-login-input" style="margin-top: -170px;">
        <div style="margin-left: 14px;">
            <input name="username" style="width: 150px; background-color: #38B6FF;height: 24px;
    padding: 6px 12px;    font-size: 12px;    line-height: 1.42857143; font-weight: 600;   color: #f5f5f5;   background-image: none;    border: 1px solid #ccc;    border-radius: 4px;    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;"/>
        </div>
        <div style="margin-top:6px; margin-left: 14px;">
            <input type="password" name="password" style="width: 150px; background-color: #38b3fb;;height: 24px;
    padding: 6px 12px;    font-size: 12px; line-height: 1.42857143; font-weight: 600;   color: #f5f5f5;   background-image: none;    border: 1px solid #ccc;    border-radius: 4px;    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;"/>
        </div>
        <div id="h-login-button-list" style="margin-top: 26px;">
            <button onclick="LoginSubmit(this)" class="btn btn-xs btn-success" style="margin-left: -16px;">登陆</button>
            <button class="btn btn-xs btn-info" onclick="clearInputForm(this)" style="margin-left: 6px;">重置</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="/static/jquery-i18n-properties/jquery.i18n.properties.min.js"></script>
<script type="text/javascript" src="/static/js/utils.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-notify.min.js"></script>
<script>
    NProgress.start();
    $(document).ready(function () {
        var margin_top = (document.documentElement.clientHeight - 370)/2
        if (margin_top < 0) {
            margin_top = 0
        }
        $("#h-login-login-form").css({
            'margin-top':margin_top
        }).show();
    })

    function clearInputForm(obj) {
        $("#h-login-login-input").find("input[name='username']").val("");
        $("#h-login-login-input").find("input[name='password']").val("");
    }

    function LoginSubmit(obj){
        var user = $("#h-login-login-input").find("input[name='username']").val();
        var psd = $("#h-login-login-input").find("input[name='password']").val();

        $.HAjaxRequest({
            url:"/v1/sso/auth",
            type:"POST",
            data:{
                username:user,
                password:psd,
                targetSystem:"sso",
            },
            dataType:"json",
            success:function(data){
                window.location.href="/HomePage";
            },
            error:function(msg){
                console.log(msg);
                if (msg.responseText == undefined){
                    $.Notify({
                        message:"请求失败，错误编码是："+msg.status,
                        type:"danger",
                    });
                    return
                }
                var imsg = JSON.parse(msg.responseText)
                $.Notify({
                    message:imsg.retMsg,
                    type:"danger",
                })
            }
        });

    };

    $(document).keydown(function(e){
        if (e.keyCode == '13'){
            setTimeout(LoginSubmit,200)
        }
    });

    $(document).ready(function () {
        $.i18n.properties({
            name:'Messages',
            path:'/static/jquery-i18n-properties/bundle/',
            mode:'both',
            language :(navigator.language || navigator.browserLanguage).toLowerCase(),
            async: true,
        });

        var $body = $(".container-fluid");
        $body.height(document.documentElement.clientHeight);
        NProgress.done();
    });

    window.onresize = function () {
        $(".container-fluid").height(document.documentElement.clientHeight)
        var margin_top = (document.documentElement.clientHeight - 369)/2
        if (margin_top < 0) {
            margin_top = 10
        }
        $("#h-login-login-form").css('margin-top',margin_top);
    };

</script>
<script type="text/javascript" src="/static/js/spin.min.js"></script>
</html>
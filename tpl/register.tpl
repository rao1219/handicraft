<?php
//处理注册
if(isset($_POST['username'])){
    if(operate::getoneline('member','username="'.$_POST['username'].'" or email="'.$_POST['email'].'"')){
        $errcon="用户名或邮箱已存在,请重试!";
        include "./tpl/err.tpl";
    }else{
        if(operate::insertoneline('member',array('username','email','password','name','gender','intro'),array($_POST['username'],$_POST['email'],$_POST['password'],$_POST['name'],$_POST['gender'],$_POST['intro']))){
            operate::login(mysql_insert_id());
            $errcon="注册成功!";
            $errurl="/";
            include "./tpl/succ.tpl";
        }else{
            $errcon="注册异常,请重试!";
            include "./tpl/err.tpl";
        }
    }
}
?><!DOCTYPE html>
<html lang="cn" class="app">
<head>  
  <meta charset="utf-8" />
  <title>注册会员</title>
  <?php include './tpl/_head.tpl'; ?>
</head>
<body class="">
  <section class="vbox">
    <?php include './tpl/_header.tpl'; ?>
    <section>
      <section class="hbox stretch">
        <?php include './tpl/_aside.tpl'; ?>
        <section id="content">
          <section class="vbox">          
            <section class="scrollable wrapper">
              <section class="panel panel-default">
                <header class="panel-heading font-bold">
                  注册信息
                </header>
                <div class="panel-body">
                  <form class="form-horizontal" method="POST">
                    <div class="form-group">
                      <label class="col-sm-2 control-label">用户名</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name="username">
                      </div> <div class="col-sm-1">
                        <span style="color:red;font-weight:bold;margin-left:-10px;">*</span>
                      </div>
                    </div>
                    <div class="line line-dashed b-b line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">密码</label>
                      <div class="col-sm-9">
                        <input type="password" name="password" class="form-control">
                      </div><div class="col-sm-1">
                        <span style="color:red;font-weight:bold;margin-left:-10px;">*</span>
                      </div>
                    </div><div class="line line-dashed b-b line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">邮箱</label>
                      <div class="col-sm-9">
                        <input type="email" class="form-control" name="email">
                      </div><div class="col-sm-1">
                        <span style="color:red;font-weight:bold;margin-left:-10px;">*</span>
                      </div>
                    </div>
                    <div class="line line-dashed b-b line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">性别</label>
                      <div class="col-sm-10">
                        <label class="radio-inline">
                          <input type="radio" value="0" name="gender"> 男
                        </label>
                        <label class="radio-inline">
                          <input type="radio" value="1" name="gender"> 女
                        </label>
                      </div>
                    </div>
                    <div class="line line-dashed b-b line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">姓名</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="name">
                      </div>
                    </div>
                    <div class="line line-dashed b-b line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">其他介绍</label>
                      <div class="col-sm-10">
                      <textarea rows="4" class="form-control" name="intro"></textarea>
                      </div>
                    </div>

                    <div class="line line-dashed b-b line-lg pull-in"></div>
                    <div class="form-group">
                      <div class="col-sm-4 col-sm-offset-2">
                        <button type="submit" class="btn btn-primary">注册</button>
                      </div>
                    </div>
                  </form>
                </div>
              </section>
            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>


      </section>
    </section>    
  </section>

  <?php include './tpl/_bottom.tpl'; ?>
</body>
</html>
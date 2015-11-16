<!DOCTYPE html>
<html lang="cn" class="app">
<head>  
  <meta charset="utf-8" />
  <title>登录</title>
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
                  登录
                </header>
                <div class="panel-body">
                  <form class="form-horizontal" action="/action.php?ac=login" method="POST">
                    <div class="form-group">
                      <label class="col-sm-2 control-label">用户名/Email</label>
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
                    </div>
                    <div class="line line-dashed b-b line-lg pull-in"></div>
                    <div class="form-group">
                      <div class="col-sm-4 col-sm-offset-2">
                        <button type="submit" class="btn btn-primary">登录</button>
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
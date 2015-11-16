<?php
if(!isset($errtime)) $errtime=4;
if(!isset($errurl)) $errurl='javascript:window.history.go(-1)';
?><!DOCTYPE html>
<html lang="cn" class="app">
<head>  
  <meta charset="utf-8" />
  <title>提示信息</title>
  <?php include './tpl/_head.tpl'; ?>
<style type="text/css">
*{ padding: 0; margin: 0; }
.system-message{ padding: 24px 48px; }
.system-message h1{ font-size: 100px; font-weight: normal; line-height: 120px; margin-bottom: 12px; }
.system-message .jump{ padding-top: 10px}
.system-message .jump a{ color: #333;}
.system-message .success,.system-message .error{ line-height: 1.8em; font-size: 36px }
.system-message .detail{ font-size: 12px; line-height: 20px; margin-top: 12px; display:none}
</style>
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
              <div class="system-message">
                <h1>O(∩_∩)O</h1>
                <p class="error"><?php echo $errcon; ?></p><p class="detail"></p>
                <p class="jump">
                页面自动 <a id="href" href="<?php echo $errurl; ?>">跳转</a> 等待时间： <b id="wait"><?php echo $errtime; ?></b>
                </p>
                </div>
                <script type="text/javascript">
                (function(){
                var wait = document.getElementById('wait'),href = document.getElementById('href').href;
                var interval = setInterval(function(){
                    var time = --wait.innerHTML;
                    if(time == 0) {
                        location.href = href;
                        clearInterval(interval);
                    };
                }, 1000);
                })();
                </script>
            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>


      </section>
    </section>    
  </section>

  <?php include './tpl/_bottom.tpl'; ?>
</body>
</html><?php
exit;
?>
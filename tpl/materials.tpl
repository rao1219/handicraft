<!DOCTYPE html>
<html lang="cn" class="app">
<head>  
  <meta charset="utf-8" />
  <title>物料表查看:<?=$table['name']?></title>
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
           	<div class="panel panel-default">
              <div class="panel-heading">物料表查看:<?=$table['name']?></div>
              <div class="panel-body">
              <form class="form-horizontal">
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label">物料表名称:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" style="border-radius:0;" name="name" value="<?=$table['name']?>" disabled>
                            </div>
                        </div>
                        <div class="panel-heading">物料表内容:</div>
                        <?php
                        $i=0;
                        foreach($content as $key=>$value){
                            echo '<br><div class="form-group form-group-lg"><label class="col-sm-2 control-label">';
                            if($i)echo '自选字段'; else echo '必选字段';
                            echo ':</label><div class="col-sm-9"><input type="text" class="form-control" style="border-radius:0;" value="'.$value.'" disabled></div></div>';
                            $i++;
                        }
                        ?>
                        <br>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-9" style="text-align:right">
                                <input type="hidden" name='update' value="1">
                                <button type="button" class="btn btn-success btn-lg" style="width:100%;" onclick="javascript:window.location.href='material.php?ac=add&id=<?=$_GET['id']?>'">复制该表单</button>
                            </div>
                        </div>
                        </form>
              </div>
            </div>
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
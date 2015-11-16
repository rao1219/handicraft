<?php
include './conn/comment.php';
if(!$login){
    $errtime=3;
    $errcon="请先登陆!";
    $errurl="/action.php?ac=logininfo";
    include "./tpl/err.tpl";
}
if(!isset($_GET['db'])){
    exit;
}
$_GET['db']+=0;
$table=operate::getoneline('materialtable','id='.$_GET['db'].' and uid='.$login);
if(!$table){
    $errcon="不存在该表";
    include "./tpl/err.tpl";
}
$content=unserialize($table['info']);
?>
<section class="panel panel-default" style="margin-left:15%;width:70%;margin-top:5%">
<header class="panel-heading font-bold">添加新数据</header>
<div class="panel-body">
  <form class="bs-example form-horizontal" method="POST">
  <?php
  $i=1;
  foreach($content as $item){
    echo '<div class="form-group"><label class="col-lg-2 control-label">'.$item.'</label><div class="col-lg-10"><input type="text" class="form-control" name="t'.$i.'"></div></div>';
    $i++;
  }
  ?>
    <div class="form-group">
      <div class="col-lg-offset-2 col-lg-10">
        <input type="hidden" class="form-control" name="add" value="1">
        <button type="submit" class="btn btn-default">添加数据</button>
      </div>
    </div>
  </form>
</div>
</section>

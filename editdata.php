<?php
include './conn/comment.php';
if(!$login){
    $errtime=3;
    $errcon="请先登陆!";
    $errurl="/action.php?ac=logininfo";
    include "./tpl/err.tpl";
}
if(!isset($_GET['id'])){
    exit;
}
$_GET['id']+=0;
$info = operate::getoneline('material','id='.$_GET['id']);
if(!$info){
    $errcon="不存在信息";
    include "./tpl/err.tpl";
}
$table=operate::getoneline('materialtable','id='.$info['mid'].' and uid='.$login);
if(!$table){
    $errcon="不存在该表";
    include "./tpl/err.tpl";
}
$content=unserialize($table['info']);
$edit=unserialize($info['info']);
?>
<section class="panel panel-default" style="margin-left:15%;width:70%;margin-top:5%">
<header class="panel-heading font-bold">编辑数据</header>
<div class="panel-body">
  <form class="bs-example form-horizontal" method="POST">
  <?php
  $i=1;
  foreach($content as $item){
    echo '<div class="form-group"><label class="col-lg-2 control-label">'.$item.'</label><div class="col-lg-10"><input type="text" class="form-control" name="t'.$i.'" value="';
    if($i==1) echo $info['title'];
    else echo $edit[$i-2];
    echo '"></div></div>';
    $i++;
  }
  ?>
    <div class="form-group">
      <div class="col-lg-offset-2 col-lg-10">
        <input type="hidden" class="form-control" name="edit" value="<?=$_GET['id']?>">
        <button type="submit" class="btn btn-default">修改数据</button>
      </div>
    </div>
  </form>
</div>
</section>

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
operate::deletedata('material','id='.$_GET['id']);
$errcon="删除成功";
include "./tpl/succ.tpl";
?>

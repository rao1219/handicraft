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
operate::deletedata('materialTable','id='.$_GET['db']);
$errurl='material.php';
$errcon="删除成功";
include "./tpl/succ.tpl";
?>

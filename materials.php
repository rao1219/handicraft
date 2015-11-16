<?php
//入口 目录+文件
include './conn/comment.php';
if(!isset($_GET['id'])){
    $errcon="网址有误，请确定后重试";
    include "./tpl/err.tpl";
}
$_GET['id']+=0;
$table=operate::getoneline('materialtable','id='.$_GET['id']);
$content=unserialize($table['info']);
if(!$table){
    $errcon="不存在该表";
    include "./tpl/err.tpl";
}
include "./tpl/materials.tpl";
?>
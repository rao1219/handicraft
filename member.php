<?php
//入口 目录+文件
include './conn/comment.php';
if(!$login){
    $errtime=3;
    $errcon="请先登陆!";
    $errurl="/action.php?ac=logininfo";
    include "./tpl/err.tpl";
}
if(isset($_GET['ac'])){
    $PATH="./tpl/member_".$_GET['ac'].'.tpl';
}else{
    $PATH="./tpl/member.tpl";
}
if(file_exists($PATH)){
    include "$PATH";
    exit;
}
$errcon="网址有误，请确定后重试";
include "./tpl/err.tpl";
?>
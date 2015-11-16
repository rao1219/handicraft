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
    if($_GET['ac']=='add' && isset($_GET['id'])){
        $_GET['id']+=0;
        $table=operate::getoneline('materialtable','id='.$_GET['id']);
        if(!$table){
            $errcon="不存在该表";
            include "./tpl/err.tpl";
        }
        $content=unserialize($table['info']);
        $PATH="./tpl/material_copy.tpl";
    }else{
        if($_GET['ac']=='edit'){
            $_GET['id']+=0;
            $table=operate::getoneline('materialtable','id='.$_GET['id'].' and uid='.$login);
            if(!$table){
                $errcon="不存在该表";
                include "./tpl/err.tpl";
            }
            $content=unserialize($table['info']);
        }
        $PATH="./tpl/material_".$_GET['ac'].'.tpl';
    }
}else{
    $PATH="./tpl/material.tpl";
}
if(file_exists($PATH)){
    include "$PATH";
    exit;
}
$errcon="网址有误，请确定后重试";
include "./tpl/err.tpl";
?>
<?php
//入口 目录+文件
include './conn/comment.php';
if(!$login){
    $errtime=3;
    $errcon="请先登陆!";
    $errurl="/action.php?ac=logininfo";
    include "./tpl/err.tpl";
}
if(isset($_GET['db'])){
    $_GET['db']+=0;
    $table=operate::getoneline('materialtable','id='.$_GET['db'].' and uid='.$login);
    if(!$table){
        $errcon="不存在该表";
        include "./tpl/err.tpl";
    }
    if(isset($_POST['add'])){
    //添加
        $filed=array();
        foreach($_POST as $key=>$value){
            if($key!="add" && $key!="t1" )
                $filed[]=$value;
        }
        $info=serialize($filed);
        operate::insertoneline('material',array('mid','title','info'),array($_GET['db'],$_POST['t1'],$info));
        $errcon="添加成功";
        include "./tpl/succ.tpl";
    }
    if(isset($_POST['edit'])){
    //修改
        $filed=array();
        foreach($_POST as $key=>$value){
            if($key!="edit" && $key!="t1" )
                $filed[]=$value;
        }
        $info=serialize($filed);
        operate::updateoneline('material',array('title','info'),array($_POST['t1'],$info),'id='.$_POST['edit']);
        $errcon="修改成功";
        include "./tpl/succ.tpl";
    }
    $content=unserialize($table['info']);
    $data=operate::getmuchlinesql('select * from material where mid='.$table[0].' order by id desc limit 30');
    include "./tpl/database.tpl";
}
?>
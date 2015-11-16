<?php
include './conn/comment.php';
if(isset($_GET['ac'])){
    if($_GET['ac']=="logout"){
        session_unset();
        $errtime="3";
        $errurl="/";
        $errcon="退出成功";
        include './tpl/succ.tpl';
    }
    if($_GET['ac']=="login"){
        if($loginfo=operate::getoneline('member','username="'.$_POST['username'].'" or email="'.$_POST['username'].'"','id,password')){
            if($_POST['password']==$loginfo['password']){
                operate::login($loginfo['id']);
                $errtime=3;
                $errurl="/";
                $errcon="登录成功!";
                include "./tpl/succ.tpl";
            }else{
                $errcon="密码错误,请重试";
                include "./tpl/err.tpl";
            }
        }else{
            $errtime=3;
            $errcon="不存在该用户!";
            include "./tpl/err.tpl";
        }
    }
    $PATH="./tpl/".$_GET['ac'].'.tpl';
	if(file_exists($PATH)){
		include "$PATH";
        exit;
	}
}
$errcon="网址有误，请确定后重试";
include "./tpl/err.tpl";
?>
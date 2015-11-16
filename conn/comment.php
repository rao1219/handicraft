<?php
error_reporting(0);
define("ACCESS",1);
session_start();
include "./conn/conn.php";
include "./conn/operater.php";
if(isset($_SESSION['userid'])){
    $login=$_SESSION['userid'];
    $user=operate::getoneline('member','id='.$_SESSION['userid']);
}else{
    $login=0;
}
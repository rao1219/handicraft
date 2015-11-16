<?php
include "./conn/comment.php";
if(!isset($_GET['key']) || strlen($_GET['key'])<2){
    $errcon="搜索词长度必须大于1!";
    include "./tpl/err.tpl";
}
include "tpl/search.tpl";
?>
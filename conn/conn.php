<?php
defined("ACCESS")||exit;
$INFO=array(
    'DB_HOST'=>'127.0.0.1',
    'DB_USER'=>'root',
    'DB_PASS'=>'',
    'DB_NAME'=>'material'
);;
$link=mysql_connect($INFO['DB_HOST'],$INFO['DB_USER'],$INFO['DB_PASS']);
$sql='use ' . $INFO['DB_NAME'];
mysql_query($sql);
mysql_query('set names "utf8"');
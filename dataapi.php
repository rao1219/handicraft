{ "aaData": [
<?php
error_reporting(0);
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
    $content=unserialize($table['info']);
    $data=operate::getmuchlinesql('select * from material where mid='.$table[0].' order by id desc limit 30');
    $i=1;
    foreach($data as $items){
        if($i>1) echo ',';
        echo '{';
        echo '"t1": "'.$items['title'].'"';
        $ii=2;
        $ds=unserialize($items['info']);
        foreach($ds as $item){
            echo ',"t'.$ii.'": "'.$item.'"';
            $ii++;
        }
        echo ',"t'.$ii.'": "<a href=\'editdata.php?id='.$items[0].'\' data-toggle=\'ajaxModal\' style=\'font-size:90%\'>[编辑]</a> <a href=\'deldata.php?id='.$items[0].'\' style=\'font-size:90%\' onClick=\"return confirm(\'此操作不可恢复,确定删除?\');\">[删除]</a>"';
        echo '}';
        $i++;
    }
}
?>
] }
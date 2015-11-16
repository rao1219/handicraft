<!DOCTYPE html>
<html lang="cn" class="app">
<head>  
  <meta charset="utf-8" />
  <title>物料表数据管理:<?=$table['name']?></title>
  <?php include './tpl/_head.tpl'; ?>
  <link rel="stylesheet" href="js/datatables/datatables.css" type="text/css"/>
</head>
<body class="">
  <section class="vbox">
    <?php include './tpl/_header.tpl'; ?>
    <section>
      <section class="hbox stretch">
        <?php include './tpl/_aside.tpl'; ?>
        <section id="content">
          <section class="vbox">
            <section class="scrollable padder">
              <div class="m-b-md">
                <h3 class="m-b-none">物料表数据管理:<?=$table['name']?><a href="adddata.php?db=<?=$_GET['db']?>" data-toggle="ajaxModal"  class="btn btn-info" style="float:right;">添加数据</a></h3>
              </div>
              <section class="panel panel-default">
                <header class="panel-heading">
                  <?=$table['name']?>
                  <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i> 
                </header>
                <div class="table-responsive">
                  <table class="table table-striped m-b-none" data-ride="datatables">
                    <thead>
                      <tr>
                      <?php
                      foreach($content as $item){
                        echo '<th>'.$item.'</th>';
                      }
                      ?>
                      <th>操作</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                </div>
              </section>
            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>


      </section>
    </section>    
  </section>
  <?php include './tpl/_bottom.tpl'; ?>
<script src="js/datatables/jquery.dataTables.min.js"></script>
<script src="js/datatables/jquery.csv-0.71.min.js"></script>
<script>
+function ($) { "use strict";
  $(function(){
  $('[data-ride="datatables"]').each(function() {
    var oTable = $(this).dataTable( {
      "bProcessing": true,
      "sAjaxSource": "dataapi.php?db=<?=$_GET['db']?>",
      "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r>t<'row'<'col-sm-6'i><'col-sm-6'p>>",
      "sPaginationType": "full_numbers",
      "aoColumns": [
        { "mData": "t1" }<?php
        $len=count($content);
        for($i=2;$i<=$len;$i++){
            echo ',{ "mData": "t'.$i.'" }';
        }
        $len+=1;
        echo ',{ "mData": "t'.$len.'" }';
        ?>
      ]
    } );
  });
  });
}(window.jQuery);
</script>
</body>
</html>
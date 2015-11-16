<!DOCTYPE html>
<html lang="cn" class="app">
<head>  
  <meta charset="utf-8" />
  <title>搜索:<?=$_GET['key']?></title>
  <?php include './tpl/_head.tpl'; ?>
</head>
<body class="">
  <section class="vbox">
    <?php include './tpl/_header.tpl'; ?>
    <section>
      <section class="hbox stretch">
        <?php include './tpl/_aside.tpl'; ?>
        <section id="content">
          <section class="vbox id="bjax-el">
            <section class="scrollable padder-lg">
              <h3 class="font-thin m-b">搜索结果:<?=$_GET['key']?></h3>
              <div class="row row-sm">
              <?php
                $SQL='select * from materialTable where name like \'%'.$_GET['key'].'%\' order by id desc limit 24 ';
                $material=operate::getmuchlinesql($SQL);
                if(!$material){
                    echo '<h2 class="font-thin m-b">没有相关物料表</h2>';
                }else
                foreach($material as $item){
                $content=unserialize($item['info']);
              ?>
                <div class="col-xs-6 col-sm-4 col-md-3">
                  <div class="item">
                    <div class="pos-rlt">
                      <div class="item-overlay opacity r r-2x bg-black">
                        <div class="center text-center m-t-n">
                          <a href="materials.php?id=<?=$item['id']?>"><i class="fa fa-table i-2x"></i></a>
                        </div>
                      </div>
                      <div class="well center-block">
                       <button class="btn btn-info btn-lg btn-block">表名:<?php echo str_ireplace($_GET['key'],'<span style="color:red;">'.$_GET['key'].'</span>',$item['name']); ?></button>
                        <?php
                        $i=0;
                        foreach($content as $key=>$value){
                            if($i>3){
                                echo  '<button class="btn btn-success btn-block">……</button>';
                                break;
                            }
                            if(!$i) echo '<button class="btn btn-primary btn-block">'.$value.'</button>';
                            else echo '<button class="btn btn-default btn-block">'.$value.'</button>';
                            $i++;
                        }
                        ?>
                     </div>
                    </div>
                  </div>
                </div>
                <?php
                }
                ?>            
              </div>
            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>


      </section>
    </section>    
  </section>

  <?php include './tpl/_bottom.tpl'; ?>
</body>
</html>
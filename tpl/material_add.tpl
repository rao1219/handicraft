<?php
if(isset($_POST['update'])){
    if($_POST['update']==1){
        $filed=array();
        foreach($_POST as $key=>$value){
            if($key!="name" && $key!="update" )
                $filed[]=$value;
        }
        $info=serialize($filed);
        $update = operate::insertoneline("materialTable",array("uid","name","info"),array($login,$_POST["name"],$info));
        if($update){
            $errurl="/material.php";
            $errcon="添加成功!";
            include './tpl/succ.tpl';
        }else{
            $errcon="未知原因添加失败!";
            include './tpl/err.tpl';
        }
    }
}
?><!DOCTYPE html>
<html lang="cn" class="app">
<head>  
  <meta charset="utf-8" />
  <title>添加物料表</title>
  <?php include './tpl/_head.tpl'; ?>
</head>
<body class="">
  <section class="vbox">
    <?php include './tpl/_header.tpl'; ?>
    <section>
      <section class="hbox stretch">
        <?php include './tpl/_aside.tpl'; ?>
        <section id="content">
          <section class="vbox">          
            <section class="scrollable wrapper">
           	<div class="panel panel-default">
              <div class="panel-heading">新物料表添加</div>
              <div class="panel-body">
                    <form class="form-horizontal" onsubmit="return validate_form()" method="POST">
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label">物料表名称:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" style="border-radius:0;" name="name" placeholder="请输入物料表名称">
                            </div>
                        </div>
                        <div class="panel-heading">物料表内容(注:提交后将无法添加新字段)</div><br>
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label">必选字段(用于检索):</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" style="border-radius:0;" name="title" value="物料名称">
                            </div>
                        </div>
                        <div class="form-group form-group-lg" id="t1">
                        <br>
                            <label class="col-sm-2 control-label">自选字段:</label>
                            <div class="col-sm-8">
                                <input type="text" name='t1' class="form-control" style="border-radius:0" value="物料序号">
                            </div>
                            <div class="col-sm-1">
                                <button type="button" class="btn btn-danger" onclick="deleteT('t1')">删除</button>
                            </div>
                        </div>
                        <div class="form-group form-group-lg" id="t2">
                        <br>
                            <label class="col-sm-2 control-label">自选字段:</label>
                            <div class="col-sm-8">
                                <input type="text" name='t2' class="form-control" style="border-radius:0" value="规格型号">
                            </div>
                            <div class="col-sm-1">
                                <button type="button" class="btn btn-danger" onclick="deleteT('t2')">删除</button>
                            </div>
                        </div>
                        <div class="form-group form-group-lg" id="t3">
                        <br>
                            <label class="col-sm-2 control-label">自选字段:</label>
                            <div class="col-sm-8">
                                <input type="text" name='t3' class="form-control" style="border-radius:0" value="数量">
                            </div>
                            <div class="col-sm-1">
                                <button type="button" class="btn btn-danger" onclick="deleteT('t3')">删除</button>
                            </div>
                        </div>
                        <div class="form-group form-group-lg" id="t4">
                        <br>
                            <label class="col-sm-2 control-label">自选字段:</label>
                            <div class="col-sm-8">
                                <input type="text" name='t4' class="form-control" style="border-radius:0" value="生产厂商">
                            </div>
                            <div class="col-sm-1">
                                <button type="button" class="btn btn-danger" onclick="deleteT('t4')">删除</button>
                            </div>
                        </div>
                        <div class="form-group form-group-lg" id="t5">
                        <br>
                            <label class="col-sm-2 control-label">自选字段:</label>
                            <div class="col-sm-8">
                                <input type="text" name='t5' class="form-control" style="border-radius:0" value="备注">
                            </div>
                            <div class="col-sm-1">
                                <button type="button" class="btn btn-danger" onclick="deleteT('t5')">删除</button>
                            </div>
                        </div>
                        <span id="addT">
                        </span>
                        <br>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-9" style="text-align:right">
                                <input type="hidden" name='update' value="1">
                                <button type="button" class="btn btn-primary btn-lg" style="width:20%" onclick="addfiled()">增加字段</button>
                                <button type="submit" class="btn btn-success btn-lg" style="width:20%;margin-left:2%;">提交表单</button>
                            </div>
                        </div>
                    </form>
              </div>
            </div>
            <script>
            var nowadd=6;
            function addfiled(){
                var Tcode='<div class="form-group form-group-lg" id="t'+nowadd+'"><br><label class="col-sm-2 control-label">自选字段:</label><div class="col-sm-8"><input type="text" name="t'+nowadd+'" class="form-control" style="border-radius:0"></div><div class="col-sm-1"><button type="button" class="btn btn-danger" onclick="deleteT(\'t'+nowadd+'\')">删除</button></div></div>';
                $(Tcode).appendTo('#addT');
                nowadd++;
            }
            function deleteT(id){
                $('#'+id).remove();
            }
            </script>
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
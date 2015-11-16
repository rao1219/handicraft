<?php
if(isset($_POST['update'])){
    if($_POST['update']==1){
        $upload_must_size= 100000; //允许上传文件的大小,头像100k
        if(strlen($_FILES["file"]["name"])!=0){
            if(preg_match('/image/',$_FILES["file"]["type"])){ 
               if($_FILES["file"]["size"] < $upload_must_size) 
               { 
                    define('ROOT',dirname(__FILE__).'/'); 
                    //上传成功
                    $picaddress="../images/head/".$login.'.'.substr($_FILES["file"]["name"],-3);
                    $toaddress = ROOT.$picaddress;
                    $res = move_uploaded_file($_FILES["file"]["tmp_name"],$toaddress);//从TEMP目录移出
                   //更新数据
                    operate::updateoneline("member",array("headpic"),array($picaddress),"id='".$login."'");
                    $errcon="修改头像成功!";
                    include './tpl/succ.tpl';
                } 
                else 
                { 
                    //文件过大
                    $errcon="文件请勿超过100K，请重新上传";
                    include './tpl/err.tpl';
                } 
            }else 
            { 
                //请上传图片类型文件
                $errcon="上传的文件非图片类型，请重新上传!";
                include './tpl/err.tpl';
            } 
        }else{
            //请选择文件
            $errcon="请选择图片文件!";
            include './tpl/err.tpl';
        }
    }else if($_POST['update']==2){
        $update;
        if(strlen($_POST["password"])>0){
            $update = operate::updateoneline("member",array("password","name","gender","intro"),array($_POST["password"],$_POST["name"],$_POST["gender"],$_POST["intro"]),"id='".$login."'");
        }else{
            $update = operate::updateoneline("member",array("name","gender","intro"),array($_POST["name"],$_POST["gender"],$_POST["intro"]),"id='".$login."'");
        }
        if($update){
            $errcon="修改成功!";
            include './tpl/succ.tpl';
        }else{
            $errcon="未知原因修改失败!";
            include './tpl/err.tpl';
        }
    }
}
?><!DOCTYPE html>
<html lang="cn" class="app">
<head>  
  <meta charset="utf-8" />
  <title>个人信息修改</title>
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
                <div class="panel-heading">头像修改</div>
                <div class="panel-body">
                <div class="row">
                <div class="col-xs-2">
                </div>
                <div class="col-sm-1">
                <img src="<?=$user['headpic']?>" class="img-circle" height="130px">
                </div>
                <div class="col-sm-8">
                    <form class="form-horizontal" enctype="multipart/form-data" method="POST">
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label">新头像:</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control" style="border-radius:0;" name="file" />
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="hidden" name='update' value="1">
                                <button type="submit" class="btn btn-info btn-lg" style="border-radius:0;width:100%">上传新头像</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xs-1"></div>
                </div>
                </div>
              <div class="panel-heading">个人资料修改</div>
              <div class="panel-body">
                    <form class="form-horizontal" onsubmit="return validate_form()" method="POST">
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label">用户名:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" style="border-radius:0;" value="<?=$user['username']?>" disabled>
                            </div>
                        </div>
                        <br>
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label">邮箱:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" style="border-radius:0;" value="<?=$user['email']?>" disabled>
                            </div>
                        </div>
                        <br>
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label">新密码:</label>
                            <div class="col-sm-10">
                                <input type="password" name='password' class="form-control" placeholder="不修改密码请勿填写" style="border-radius:0">
                            </div>
                        </div>
                        <br>
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label">姓名:</label>
                            <div class="col-sm-10">
                                <input type="text" name='name' class="form-control" style="border-radius:0" value="<?=$user['name']?>">
                            </div>
                        </div>
                        <br>
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label">性别:</label>
                            <div class="col-sm-10">
                               <select class="form-control" style="border-radius:0" name="gender">
                                  <option value="0" <?php if($user['gender']==0) echo 'selected';?>>男</option>
                                  <option value="1" <?php if($user['gender']==1) echo 'selected';?>>女</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label">其他介绍:</label>
                            <div class="col-sm-10">
                            <textarea class="form-control" name='intro' rows="5" style="border-radius:0;height:70px;"><?=$user['intro']?></textarea>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="hidden" name='update' value="2">
                                <button type="submit" class="btn btn-success btn-lg" style="border-radius:0;width:100%">修改</button>
                            </div>
                        </div>
                    </form>
              </div>
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
<?php
if(!$login){
?>
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  style="margin-top:10%;">
<div class="modal-dialog">
<div class="modal-content">
<form role="form" action="/action.php?ac=login" method="POST">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
</button>
<h4 class="modal-title" id="myModalLabel">
用户登录
</h4>
</div>
<div class="modal-body">
<div class="form-group">
  <label>用户名:</label>
  <input type="text" class="form-control" placeholder="UserName/E-mail" name="username">
</div>
<div class="form-group">
  <label>密码:</label>
  <input type="password" class="form-control" placeholder="Password" name="password">
</div>           
</div>
<div class="modal-footer">
<button type="submit" class="btn btn-primary">
登录
</button>
<button type="button" class="btn btn-default" data-dismiss="modal">
关闭
</button>
</div>
</form>
</div>
</div>
</div>
<?php
}
?>
<script src="js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="js/bootstrap.js"></script>
  <!-- App -->
  <script src="js/app.js"></script>  
  <script src="js/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/app.plugin.js"></script>
  <script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
  <script type="text/javascript" src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>

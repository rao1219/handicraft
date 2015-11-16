<header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
      <div class="navbar-header aside bg-info nav-xs">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
          <i class="icon-list"></i>
        </a>
        <a href="/" class="navbar-brand text-lt">
          <i class="fa fa-table"></i>
          <img src="images/logo.png" class="hide">
          <span class="hidden-nav-xs m-l-sm">物料管理</span>
        </a>
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
          <i class="icon-settings"></i>
        </a>
      </div>      <ul class="nav navbar-nav hidden-xs">
        <li>
          <a href="#nav,.navbar-header" data-toggle="class:nav-xs,nav-xs" class="text-muted">
            <i class="fa fa-indent text"></i>
            <i class="fa fa-dedent text-active"></i>
          </a>
        </li>
      </ul>
      <form class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search" action="search.php" method="get">
        <div class="form-group">
          <div class="input-group">
            <span class="input-group-btn">
              <button type="submit" class="btn btn-sm bg-white btn-icon rounded"><i class="fa fa-search"></i></button>
            </span>
            <input type="text" class="form-control input-sm no-border rounded" <?php  if(isset($_GET['key']) && strlen($_GET['key'])>0) echo "value=".$_GET['key'];?> placeholder="Search something..." name="key">
          </div>
        </div>
      </form>
      <div class="navbar-right ">
        <ul class="nav navbar-nav m-n hidden-xs nav-user user">
          <?php
        if(!$login){
            echo '<li><a href="#" data-toggle="modal" data-target="#LoginModal">登录</a></li><li><a href="/action.php?ac=register">注册</a></li>';
        }else{
          ?>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle bg clear" data-toggle="dropdown">
              <span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
                <img src="<?=$user['headpic']?>">
              </span>
              <?=$user['username']?><b class="caret"></b>
            </a>
            <ul class="dropdown-menu animated fadeInRight">            
              <li>
                <span class="arrow top"></span>
                <a href="/member.php?ac=edit">修改个人信息</a>
              </li>
              <li>
                <a href="/material.php">我的物料表</a>
              </li>
              <li class="divider"></li>
              <li>
                <a href="/action.php?ac=logout">退出</a>
              </li>
            </ul>
          </li>
          <?php
          }
          ?>
        </ul>
      </div>      
    </header>
<aside class="bg-black dk nav-xs aside hidden-print" id="nav">          
          <section class="vbox">
            <section class="w-f-md scrollable">
              <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railOpacity="0.2">
                <nav class="nav-primary hidden-xs">
                  <ul class="nav bg clearfix">
                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                      项目
                    </li>
                    <li>
                      <a href="/">
                        <i class="icon-docs icon text-success"></i>
                        <span class="font-bold">最新Table</span>
                      </a>
                    </li>
                    <?php
                    if($login){
                      ?>
                     <li>
                      <a href="/material.php?ac=add">
                        <i class="icon-plus icon text-success"></i>
                        <span class="font-bold">添加Table</span>
                      </a>
                    </li>
                       <li>
                      <a href="/material.php">
                        <i class="icon-screen-desktop icon text-success"></i>
                        <span class="font-bold">我的Table</span>
                      </a>
                    </li>
                      <?php
                    }
                    ?>
                    <li class="m-b hidden-nav-xs"></li>
                  </ul>
                    <ul class="nav" data-ride="collapse">
                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                      其他
                    </li>
                    <li >
                      <a href="#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                        <i class="icon-user icon">
                        </i>
                        <span>会员相关</span>
                      </a>
                      <ul class="nav dk text-sm">
                        <li >
                          <a href="member.php?ac=edit" class="auto">                                                        
                            <i class="fa fa-angle-right text-xs"></i>
                            <span>个人资料</span>
                          </a>
                        </li>
                        <li >
                          <a href="action.php?ac=logout" class="auto">                                                        
                            <i class="fa fa-angle-right text-xs"></i>
                            <span>退出</span>
                          </a>
                        </li>
                      </ul>
                    </li>
                    </ul>
                </nav>
              </div>
            </section>
          </section>
        </aside>
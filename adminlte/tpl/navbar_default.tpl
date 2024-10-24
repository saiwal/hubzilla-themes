<nav class="app-header navbar navbar-expand bg-body border-0 sticky-top"> <!--begin::Container-->
  <div class="container-fluid"> <!--begin::Start Navbar Links-->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-lte-toggle="sidebar" href="#" role="button"><i class="bi bi-layout-sidebar"></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link d-md-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasResponsive" aria-controls="offcanvasResponsive"><i class="bi bi-layout-text-sidebar"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <div class="navbar-search-block">
          <form class="form-inline" method="get" action="{{$nav.search.4}}" role="search">
						<input class="form-control form-control-sm mt-1 me-2" id="nav-search-text" type="text" value="" placeholder="{{$help}}" name="search" title="{{$nav.search.3}}" onclick="this.submit();" onblur="closeMenu('nav-search'); openMenu('nav-search-btn');"/>
					</form>
        </div>
      </li>

    <li class="nav-item d-none d-md-block"> <a class="nav-link" href="#" data-lte-toggle="fullscreen"> <i data-lte-icon="maximize" class="bi bi-arrows-fullscreen"></i> <i data-lte-icon="minimize" class="bi bi-fullscreen-exit" style="display: none;"></i> </a> </li> <!--end::Fullscreen Toggle-->
    <li class="nav-item dropdown">
        <button
          class="btn btn-link nav-link py-2 px-1 px-lg-2 dropdown-toggle d-flex align-items-center"
          id="bd-theme"
          type="button"
          aria-expanded="false"
          data-bs-toggle="dropdown"
          data-bs-display="static"
        >
          <span class="theme-icon-active">
            <i class="my-1"></i>
          </span>
          <span class="d-none ms-2" id="bd-theme-text">Toggle theme</span>
        </button>
        <ul
          class="dropdown-menu dropdown-menu-end"
          aria-labelledby="bd-theme-text"
          style="--bs-dropdown-min-width: 8rem;"
        >
          <li>
            <button
              type="button"
              class="dropdown-item d-flex align-items-center active"
              data-bs-theme-value="light"
              aria-pressed="false"
            >
              <i class="bi bi-sun-fill me-2"></i>
              Light
              <i class="bi bi-check-lg ms-auto d-none"></i>
            </button>
          </li>
          <li>
            <button
              type="button"
              class="dropdown-item d-flex align-items-center"
              data-bs-theme-value="dark"
              aria-pressed="false"
            >
              <i class="bi bi-moon-fill me-2"></i>
              Dark
              <i class="bi bi-check-lg ms-auto d-none"></i>
            </button>
          </li>
          <li>
            <button
              type="button"
              class="dropdown-item d-flex align-items-center"
              data-bs-theme-value="auto"
              aria-pressed="true"
            >
              <i class="bi bi-circle-fill-half-stroke me-2"></i>
              Auto
              <i class="bi bi-check-lg ms-auto d-none"></i>
            </button>
          </li>
        </ul>
      </li>

    {{if $userinfo}}
    <!--begin::User Menu Dropdown-->
    <li class="nav-item dropdown user-menu"> <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"> <img src="{{$userinfo.icon}}" class="user-image rounded-circle shadow" alt="User Image"> <span class="d-none d-md-inline">{{$userinfo.name}}</span> </a>
      <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-end"> <!--begin::User Image-->
        <li class="user-header text-bg-secondary"> <img src="{{$userinfo.icon}}" class="rounded-circle shadow" alt="User Image">
          <p>
            {{$userinfo.name}}
            <small>{{$sitelocation}}</small>
          </p>
        </li> <!--end::User Image--> <!--begin::Menu Body-->
        {{if $is_owner}}
        <li class="user-body p-0">
          <!--begin::Profile Row-->
          <div class="row">
            {{foreach $nav.usermenu as $usermenu}}
            <div class="col-6"><a href="{{$usermenu.0}}" class="dropdown-item">{{$usermenu.1}}</a> </div>
            {{/foreach}}
            {{if $nav.group}}
            <div class="col-6"><a href="{{$nav.group.0}}" class="dropdown-item">{{$nav.group.1}}</a>
            </div>
            {{/if}}
          </div> <!--end::Row-->
        </li>
        {{if $nav.manage}}
        <li class="user-body p-0">
          <!--begin::Channels Row-->
          <div class="row">
            <div class="col-6"><a href="{{$nav.manage.0}}" class="dropdown-item">{{$nav.manage.1}}</a>
            </div>
          </div> <!--end::Row-->
        </li>
        {{/if}}
        {{if $nav.channels}}
        <li class="user-body p-0">
          <!--begin::Channel list Row-->
          <div class="row">
            {{foreach $nav.channels as $chan}}
            <div class="col-6"><a href="manage/{{$chan.channel_id}}" class="dropdown-item">
              <i class="bi bi-circle{{if $localuser == $chan.channel_id}}-fill text-success{{else}} text-disabled{{/if}}"></i> {{$chan.channel_name}}
            </a></div>
            {{/foreach}}
        </li>
        {{/if}}
        {{if $nav.settings}}
        <li class="user-body p-0">
        <div class="row">
          <div class="col-6">
   			    <a class="dropdown-item" href="{{$nav.settings.0}}" title="{{$nav.settings.3}}" role="menuitem" id="{{$nav.settings.4}}">{{$nav.settings.1}}</a>
          </div>
          {{if $nav.admin}}
  	  			<div class="col-6">
			    		<a class="dropdown-item" href="{{$nav.admin.0}}" title="{{$nav.admin.3}}" role="menuitem" id="{{$nav.admin.4}}">{{$nav.admin.1}}</a>
            </div>
					{{/if}}
          </div>
        </li>
				{{/if}}
        <!--end::Menu Body-->
        <!--begin::Menu Footer-->
        <li class="user-footer"> 
          <div class="row">
          {{if $nav.profiles}}
            <div class="col-6">
              <a href="{{$nav.profiles.0}}" class="dropdown-item">{{$nav.profiles.1}}</a> 
            </div>
          {{/if}}
          {{if $nav.logout}}
            <div class="col-6">
            <a href="{{$nav.logout.0}}" class="btn btn-default btn-flat">{{$nav.logout.1}}</a>
            </div>
          {{/if}}
          </div> <!--end::Row-->
        </li> <!--end::Menu Footer-->
        {{/if}}
				{{if ! $is_owner}}
        <!--begin::Menu Footer-->
        <li class="user-footer"> 
          <a href="{{$nav.rusermenu.0}}" class="btn btn-default btn-flat">{{$nav.rusermenu.1}}</a> 
          <a href="{{$nav.rusermenu.2}}" class="btn btn-default btn-flat float-end">{{$nav.rusermenu.3}}</a>
        </li> <!--end::Menu Footer-->
        {{/if}}
      </ul>
    </li>
    {{/if}}
    <!--end::User Menu Dropdown-->
    </ul> <!--end::End Navbar Links-->
    {{if $nav.login && !$userinfo}}
      <div class="hstack gap-1 pt-1 pb-1 pr-2">
      {{if $nav.loginmenu.1.4}}
        <a class="btn btn-info btn-sm" href="#" title="{{$nav.loginmenu.1.3}}" data-bs-toggle="modal" data-bs-target="#nav-login">{{$nav.loginmenu.1.1}}</a>
      {{else}}
        <a class="btn btn-primary btn-sm" href="login" title="{{$nav.loginmenu.1.3}}">{{$nav.loginmenu.1.1}}</a>
      {{/if}}
      {{if $nav.register}}
        <a class="btn btn-warning btn-sm" href="{{$nav.register.0}}" title="{{$nav.register.3}}">{{$nav.register.1}}</a>
      {{/if}}
      </div>
    {{/if}}
  </div> <!--end::Container-->
</nav>

<!--begin::Sidebar-->
<aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
  <!--begin::Sidebar Brand-->
  <div class="sidebar-brand">
    <!--begin::Brand Link-->
    <a href="/" class="brand-link">
      <!--begin::Brand Image-->
<!--      <img
        src="./assets/img/AdminLTELogo.png"
        alt="U"
        class="brand-image opacity-75 shadow"
      /> -->
      <!--end::Brand Image-->
      <!--begin::Brand Text-->
      <span class="brand-text fw-light">{{$banner}}</span>
      <!--end::Brand Text-->
    </a>
    <!--end::Brand Link-->
  </div>
  <!--end::Sidebar Brand-->
  <!--begin::Sidebar Wrapper-->
  <div class="sidebar-wrapper">
    <nav class="mt-2">
      <!--begin::Sidebar Menu-->
      <ul
        class="nav sidebar-menu flex-column"
        data-lte-toggle="treeview"
        role="menu"
        data-accordion="false"
      >
        <!-- Pinned user apps -->
        {{if $navbar_apps.0}}
        <li class="nav-header" aria-disabled="true">{{$pinned_apps}}</li>
        {{foreach $navbar_apps as $navbar_app}}
          {{$navbar_app|replace:'fa':'generic-icons-nav fa'}}
        {{/foreach}}
        {{/if}}

        <!-- Channel apps; needs fixing -->
        {{if $channel_apps.0}}
        <li class="nav-header" aria-disabled="true">{{$channelapps}}</li>
        {{foreach $channel_apps as $channel_app}}
          {{$channel_app}} <br>
        {{/foreach}}
        {{/if}}

        {{if $is_owner}}
        <!-- Starred user apps -->
        <li class="nav-item"> 
        <a href="#" class="nav-link"> <i class="nav-icon bi bi-star"></i>
          <p>{{$featured_apps}}<i class="nav-arrow bi bi-chevron-right"></i></p>
        </a>
        <ul class="nav nav-treeview" style="display: none; box-sizing: border-box;">
        {{foreach $nav_apps as $nav_app}}
          {{$nav_app}}
        {{/foreach}}
        </ul>
        </li>        
        <li class="nav-header"><a class="nav-link" href="/apps"><i class="bi bi-gear"></i><p>{{$addapps}}</p></a></li>
        {{else}}
        <li class="nav-header" aria-disabled="true">{{$sysapps}}</li>
        <!-- System apps -->
        {{foreach $nav_apps as $nav_app}}
          {{$nav_app}}
        {{/foreach}}
        {{/if}} 

      </ul>
      <!--end::Sidebar Menu-->
    </nav>
  </div>
  <!--end::Sidebar Wrapper-->
</aside>
<!--end::Sidebar-->


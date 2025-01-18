<div class="card mb-3">
  <div class="card-header">
	{{$title}}
  </div>
  <div class="card-body">
	<ul class="nav nav-pills flex-column">
		{{foreach $menu_items as $menu_item}}
		<li class="nav-item">
			<a class="nav-link{{if $menu_item.active}} active{{/if}}" href="{{$menu_item.href}}" title="{{$menu_item.title}}">{{$menu_item.label}}</a>
		<li>
		{{/foreach}}
	</ul>
  </div>
</div>

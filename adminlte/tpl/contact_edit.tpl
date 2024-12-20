<form id="contact-edit-form" action="contactedit/{{$contact_id}}" method="post" >
	<div id="contact-edit-tools" class="panel-group"  role="tablist" >
		<div class="panel">
			<div class="section-subtitle-wrapper" role="tab" id="roles-tool">
				<h5>
					<a class="section" data-bs-toggle="collapse" data-bs-target="#roles-tool-collapse" href="#" aria-expanded="true" aria-controls="roles-tool-collapse" data-section="roles">
						{{$roles_label}}
					</a>
				</h5>
			</div>
			<div id="roles-tool-collapse" class="panel-collapse collapse{{if $section == 'roles'}} show{{/if}}" role="tabpanel" aria-labelledby="roles-tool" data-bs-parent="#contact-edit-tools">
				<div class="section-content-tools-wrapper">
					{{include file="field_select.tpl" field=$permcat}}
					<button class="btn btn-outline-secondary btn-sm float-end sub_section{{if $sub_section == 'perms'}} sub_section_active{{/if}}" type="button" onclick="openClose('perms-table', 'table')" data-section="perms">
						{{$compare_label}}
					</button>
					<a href="permcats/{{$permcat_value}}" class="btn btn-sm btn-outline-primary">
						<i class="bi bi-box-arrow-up-right"></i>&nbsp;{{$permcat_new}}
					</a>
					<table id="perms-table" class="table table-hover table-sm mt-3" style="display: {{if $sub_section == 'perms'}}table{{else}}none{{/if}};">
						<thead>
							<tr class="w-100">
								<th scope="col">{{$permission_label}}</th>
								<th scope="col">{{$them}}</th>
								<th scope="col">{{$me}}</th>
							</tr>
						</thead>
						<tbody>
							{{foreach $perms as $perm}}
							<tr>
								<td>{{$perm.1}}</td>
								<td>
									{{if $perm.2}}
									<i class="bi bi-check-lg text-success"></i>
									{{else}}
									<i class="bi bi-x-lg text-danger"></i>
									{{/if}}
								</td>
								<td>
									{{if $perm.3}}
									<i class="bi bi-check-lg text-success"></i>
									{{else}}
									<i class="bi bi-x-lg text-danger"></i>
									{{/if}}
								</td>
							</tr>
							{{/foreach}}

						</tbody>
					</table>
				</div>
			</div>
		</div>
		{{if $groups}}
		<div class="panel">
			<div class="section-subtitle-wrapper" role="tab" id="group-tool">
				<h5>
					<a class="section" data-bs-toggle="collapse" data-bs-target="#group-tool-collapse" href="#" aria-expanded="true" aria-controls="group-tool-collapse" data-section="group">
						{{$pgroups_label}}
					</a>
				</h5>
			</div>
			<div id="group-tool-collapse" class="panel-collapse collapse{{if $section == 'group'}} show{{/if}}" role="tabpanel" aria-labelledby="group-tool" data-bs-parent="#contact-edit-tools">
				<div class="section-content-tools-wrapper clearfix">
					{{foreach $groups as $group}}
					{{include file="field_checkbox.tpl" field=$group}}
					{{/foreach}}
					<a href="group/new" class="btn btn-sm btn-outline-primary">
						<i class="bi bi-box-arrow-up-right"></i>&nbsp;{{$pgroups_label}}
					</a>
				</div>
			</div>
		</div>
		{{/if}}
		{{if $multiprofs}}
		<div class="panel">
			<div class="section-subtitle-wrapper" role="tab" id="profile-tool">
				<h5>
					<a class="section" data-bs-toggle="collapse" data-bs-target="#profile-tool-collapse" href="#" aria-expanded="true" aria-controls="profile-tool-collapse" data-section="profile">
						{{$profiles_label}}
					</a>
				</h5>
			</div>
			<div id="profile-tool-collapse" class="panel-collapse collapse{{if $section == 'profile'}} show{{/if}}" role="tabpanel" aria-labelledby="profile-tool" data-bs-parent="#contact-edit-tools">
				<div class="section-content-tools-wrapper">
					{{$profile_select}}
					<a href="profiles" class="btn btn-sm btn-outline-primary">
						<i class="bi bi-box-arrow-up-right"></i>&nbsp;{{$profiles_label}}
					</a>
				</div>
			</div>
		</div>
		{{/if}}
		{{if $slide}}
		<div class="panel">
			<div class="section-subtitle-wrapper" role="tab" id="affinity-tool">
				<h5>
					<a class="section" data-bs-toggle="collapse" data-bs-target="#affinity-tool-collapse" href="#" aria-expanded="true" aria-controls="affinity-tool-collapse" data-section="affinity">
						{{$affinity_label}}
					</a>
				</h5>
			</div>
			<div id="affinity-tool-collapse" class="panel-collapse collapse{{if $section == 'affinity'}} show{{/if}}" role="tabpanel" aria-labelledby="affinity-tool" data-bs-parent="#contact-edit-tools">
				<div class="section-content-tools-wrapper">
						<div class="mb-2"><label>{{$lbl_slider}}</label></div>
						{{$slide}}
						<input id="contact-closeness-mirror" type="hidden" name="closeness" value="{{$close}}" />
				</div>
			</div>
		</div>
		{{/if}}
		{{if $connfilter}}
		<div class="panel">
			<div class="section-subtitle-wrapper" role="tab" id="filter-tool">
				<h5>
					<a class="section"  data-bs-toggle="collapse" data-bs-target="#filter-tool-collapse" href="#" aria-expanded="true" aria-controls="filter-tool-collapse" data-section="filter">
						{{$filter_label}}
					</a>
				</h5>
			</div>
			<div id="filter-tool-collapse" class="panel-collapse collapse{{if $section == 'filter'}} show{{/if}}" role="tabpanel" aria-labelledby="filter-tool" data-bs-parent="#contact-edit-tools">
				<div class="section-content-tools-wrapper">
					{{include file="field_textarea.tpl" field=$incl}}
					{{include file="field_textarea.tpl" field=$excl}}
				</div>
			</div>
		</div>
		{{else}}
		<input type="hidden" name="{{$incl.0}}" value="{{$incl.2}}" />
		<input type="hidden" name="{{$excl.0}}" value="{{$excl.2}}" />
		{{/if}}
	</div>
</form>

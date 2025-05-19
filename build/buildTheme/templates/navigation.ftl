<#if nav_items?has_content>
	<ul class="ttu-nav-list">
		<#list nav_items as nav_item>
			<#assign
				nav_item_attr_has_popup = ""
				nav_item_css_class = ""
			/>

			<#if nav_item.isSelected()>
				<#assign
					nav_item_css_class = "selected"
				/>
			</#if>

			<li class="${nav_item_css_class}">
				<a href="${nav_item.getURL()}" ${nav_item.getTarget()}>
					${nav_item.getName()}
				</a>
			</li>
		</#list>
	</ul>
</#if>
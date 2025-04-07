<#if nav_items?has_content>
	<div class="ttu-breadcrumb-container">
		<ul class="ttu-breadcrumb">
			<#list nav_items as nav_item>
				<#if nav_item_index == 0>
					<li>
						<a href="${nav_item.getURL()}" ${nav_item.getTarget()}>${nav_item.getName()}</a>
					</li>
				<#else>
					<li>
						<span class="divider">/</span>
						<a href="${nav_item.getURL()}" ${nav_item.getTarget()}>${nav_item.getName()}</a>
					</li>
				</#if>
			</#list>
		</ul>
	</div>
</#if>
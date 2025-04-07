<#assign
	portlet_display = portletDisplay
	portlet_back_url = htmlUtil.escapeHREF(portlet_display.getURLBack())
	portlet_title = htmlUtil.escape(portlet_display.getTitle())
	portlet_id = htmlUtil.escapeAttribute(portlet_display.getId())
/>

<div class="portlet-boundary portlet-boundary_${portlet_id}_ portlet-static portlet-static-end portlet-barebone">
	<div id="p_p_id${portlet_id}" class="portlet-barebone">
		<div class="portlet-body">
			${portlet_display.writeContent(writer)}
		</div>
	</div>
</div>
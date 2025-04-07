<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<@liferay_util["include"] page=top_head_include />
	<style>
		/* Reset */
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
			background-color: #000000; /* Match the header color */
		}
		
		#wrapper {
			margin: 0;
			padding: 0;
		}
		
		/* Ensure control menu doesn't create gaps */
		.has-control-menu #wrapper {
			margin-top: 0 !important;
		}
		
		.control-menu {
			margin-bottom: 0 !important;
			border-bottom: none !important;
		}
		
		/* Header */
		#banner {
			background-color: #000000;
			height: 70px;
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 0;
			margin: 0;
		}
		
		/* Logo area */
		.ttu-logo {
			display: flex;
			align-items: center;
			margin-left: 15px;
		}
		
		.ttu-logo img {
			height: 45px;
		}
		
		.site-name {
			color: #ffffff;
			font-size: 24px;
			margin-left: 10px;
			font-weight: normal;
		}
		
		/* Header icons */
		.ttu-header-icons {
			display: flex;
			margin-right: 15px;
		}
		
		.ttu-header-icon {
			display: flex;
			flex-direction: column;
			align-items: center;
			color: #ffffff;
			text-decoration: none;
			margin-left: 20px;
			font-size: 12px;
			text-align: center;
		}
		
		.ttu-header-icon img {
			height: 24px;
			width: 24px;
			margin-bottom: 5px;
			filter: invert(1); /* Make SVGs white */
		}
		
		/* Layout container */
		.ttu-container {
			display: flex;
			min-height: calc(100vh - 70px);
			margin-top: 0;
			padding-top: 0;
		}
		
		/* Sidebar */
		#ttu-sidebar {
			background-color: #8C1D40; /* TTU maroon */
			width: 230px;
			flex-shrink: 0;
		}
		
		#ttu-sidebar ul {
			list-style: none;
			margin: 0;
			padding: 0;
		}
		
		#ttu-sidebar li {
			border-bottom: 1px solid rgba(255, 255, 255, 0.1);
		}
		
		#ttu-sidebar a {
			display: block;
			padding: 12px 20px;
			color: #ffffff;
			text-decoration: none;
			font-size: 14px;
		}
		
		#ttu-sidebar a:hover {
			background-color: rgba(0, 0, 0, 0.2);
		}
		
		#ttu-sidebar li.selected a,
		#ttu-sidebar li.selected {
			background-color: rgba(0, 0, 0, 0.3);
			font-weight: bold;
		}
		
		/* Content area */
		#content {
			flex: 1;
			padding: 20px;
			background-color: #f5f5f5;
		}
		
		/* Breadcrumbs */
		.ttu-breadcrumbs {
			margin-bottom: 20px;
			font-size: 14px;
		}
		
		.ttu-breadcrumbs a {
			color: #0275d8;
			text-decoration: none;
		}
		
		/* Section containers */
		.portlet {
			margin-bottom: 20px;
		}
		
		.portlet-topper {
			background-color: #f5f5f5;
			border-bottom: 1px solid #ddd;
			padding: 10px 15px;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		
		.portlet-title-text {
			font-size: 18px;
			font-weight: normal;
			color: #333;
			margin: 0;
		}
		
		.portlet-content {
			background-color: #fff;
			border: 1px solid #ddd;
			border-top: none;
			padding: 15px;
		}
		
		/* Remove extra portlet spacing */
		.portlet-content-container {
			padding: 0;
		}
		
		/* Fix any white space in Liferay navigation */
		#mainNav, 
		.product-menu-toggle,
		nav.application-bar {
			background-color: #37394f !important;
			margin: 0 !important;
			padding: 0 !important;
			border: none !important;
		}
		
		/* Fix general spacing issues */
		#navigationCollapse,
		.navbar,
		.navbar-collapse {
			margin: 0;
			padding: 0;
			background-color: inherit;
		}
		
		/* Remove any default spacing */
		.portlet-boundary {
			margin: 0;
			padding: 0;
		}
	</style>
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<!-- Main wrapper with no margins -->
<div id="wrapper">
	<!-- Header -->
	<header id="banner" role="banner">
		<div class="ttu-logo">
			<img src="${images_folder}/ttu-logo.svg" alt="Texas Tech University" />
			<div class="site-name">Raiderlink</div>
		</div>
		
		<div class="ttu-header-icons">
			<a href="#" class="ttu-header-icon">
				<img src="${images_folder}/info.svg" alt="My Personal Information" />
				<span>My Personal<br>Information</span>
			</a>
			<a href="#" class="ttu-header-icon">
				<img src="${images_folder}/email.svg" alt="Email" />
				<span>Email</span>
			</a>
			<a href="#" class="ttu-header-icon">
				<img src="${images_folder}/help.svg" alt="Banner Assistance" />
				<span>Banner<br>Assistance</span>
			</a>
			<a href="${sign_out_url}" class="ttu-header-icon">
				<img src="${images_folder}/logout.svg" alt="Logout" />
				<span>Logout</span>
			</a>
		</div>
	</header>

	<!-- Content container with no top margin -->
	<div class="ttu-container">
		<!-- Direct Navigation from nav_items -->
		<div id="ttu-sidebar">
			<#if nav_items?has_content>
				<ul>
					<#list nav_items as nav_item>
						<#assign
							nav_item_attr_selected = ""
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
			<#else>
				<ul>
					<li><a href="${site_default_url}">Home</a></li>
				</ul>
			</#if>
		</div>

		<!-- Content Area -->
		<div id="content">
			<!-- Breadcrumbs -->
			<div class="ttu-breadcrumbs">
				<#if nav_items?has_content>
					<#list nav_items as nav_item>
						<#if nav_item.isSelected()>
							<a href="${site_default_url}">TTU</a> / ${nav_item.getName()}
						</#if>
					</#list>
				<#else>
					<a href="${site_default_url}">TTU</a>
				</#if>
			</div>
			
			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}
				${portletDisplay.setTitle(the_title)}
				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>
		</div>
	</div>
</div>

<@liferay_util["include"] page=body_bottom_include />
<@liferay_util["include"] page=bottom_include />

</body>
</html>
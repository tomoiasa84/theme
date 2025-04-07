<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div id="wrapper">
	<!-- TTU Header -->
	<header id="banner" role="banner">
		<div id="ttu-header">
			<div class="ttu-logo">
				<img src="${images_folder}/ttu-logo.svg" alt="Texas Tech University" height="45" />
				<span class="site-name">Raiderlink</span>
			</div>
			
			<div class="ttu-header-icons">
				<a href="#" class="ttu-header-icon">
					<i class="icon-user"></i>
					<span>My Personal<br>Information</span>
				</a>
				<a href="#" class="ttu-header-icon">
					<i class="icon-envelope"></i>
					<span>Email</span>
				</a>
				<a href="#" class="ttu-header-icon">
					<i class="icon-book"></i>
					<span>Banner<br>Assistance</span>
				</a>
				<a href="${sign_out_url}" class="ttu-header-icon">
					<i class="icon-signout"></i>
					<span>Logout</span>
				</a>
			</div>
		</div>
	</header>

	<div class="ttu-container">
		<!-- TTU Sidebar Navigation using Liferay's navigation -->
		<div id="ttu-sidebar">
			<#if has_navigation && is_setup_complete>
				<@liferay.navigation_menu default_preferences="${preferences}" />
			</#if>
		</div>

		<!-- Main Content Area -->
		<div id="content">
			<!-- Breadcrumbs -->
			<div class="ttu-breadcrumbs">
				<a href="#">TTU</a> / <a href="#">Employee</a>
			</div>

			<!-- Content Area -->
			<div class="ttu-content-container">
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
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>
</html>
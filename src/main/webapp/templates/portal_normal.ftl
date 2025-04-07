<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<@liferay_util["include"] page=top_head_include />
	<style>
		/* Basic styles */
		#banner {
			background-color: #000000;
			color: #ffffff;
			padding: 10px 20px;
			display: flex;
			justify-content: space-between;
			align-items: center;
			height: 70px;
		}
		
		.ttu-logo {
			display: flex;
			align-items: center;
		}
		
		.site-name {
			color: #ffffff;
			font-size: 24px;
			margin-left: 10px;
		}
		
		.ttu-container {
			display: flex;
		}
		
		#ttu-sidebar {
			background-color: #8C1D40;
			width: 270px;
			min-height: calc(100vh - 70px);
		}
		
		#content {
			flex: 1;
			padding: 20px;
			background-color: #f5f5f5;
		}
		
		.ttu-header-icons {
			display: flex;
		}
		
		.ttu-header-icon {
			color: white;
			text-decoration: none;
			text-align: center;
			margin-left: 20px;
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		
		.ttu-header-icon i {
			font-size: 24px !important;
			margin-bottom: 5px !important;
			display: block !important;
		}
		
		/* Force Font Awesome icons to be visible */
		.icon-user, .icon-envelope, .icon-question-sign, .icon-signout {
			display: inline-block !important;
			font-size: 24px !important;
			width: 24px !important;
			height: 24px !important;
			line-height: 24px !important;
			text-align: center !important;
		}
		
		/* Ensure text is displayed */
		.ttu-header-icon span {
			display: block !important;
			text-align: center !important;
			font-size: 12px !important;
			line-height: 1.2 !important;
		}
		/* Sidebar Navigation with hover and selected states */
#ttu-sidebar li {
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    transition: background-color 0.2s;
}

#ttu-sidebar li a {
    display: block;
    padding: 12px 20px;
    color: #ffffff;
    text-decoration: none;
    font-size: 14px;
}

#ttu-sidebar li:hover {
    background-color: rgba(0, 0, 0, 0.2);
}

#ttu-sidebar li.selected {
    background-color: rgba(0, 0, 0, 0.3);
}

#ttu-sidebar li.selected a {
    font-weight: bold;
}

/* Special case for gray item - Law School MyTech */
#ttu-sidebar li:nth-child(3) {
    background-color: #999999;
}

/* Available Budget dropdown arrow */
#ttu-sidebar li:nth-child(9) a::after {
    content: "▼";
    float: right;
    font-size: 10px;
    margin-top: 2px;
}

/* Responsive Styles */
@media (max-width: 768px) {
  .ttu-container {
    flex-direction: column;
  }
  
  #ttu-sidebar {
    width: 100%;
    position: fixed;
    top: 70px;
    left: -100%;
    z-index: 1000;
    transition: left 0.3s ease;
    height: calc(100vh - 70px);
    overflow-y: auto;
  }
  
  #ttu-sidebar.show {
    left: 0;
  }
  
  #content {
    margin-left: 0;
    width: 100%;
  }
  
  .hamburger-menu {
    display: block;
  }
}

@media (min-width: 769px) {
  .hamburger-menu {
    display: none;
  }
}

/* Hamburger Menu */
.hamburger-menu {
  position: fixed;
  top: 15px;
  left: 15px;
  z-index: 1100;
  cursor: pointer;
  background-color: transparent;
  border: none;
  width: 30px;
  height: 30px;
  padding: 0;
}

.hamburger-menu span {
  display: block;
  width: 100%;
  height: 3px;
  background-color: white;
  margin: 5px 0;
  transition: all 0.3s;
}

.hamburger-menu.active span:nth-child(1) {
  transform: rotate(45deg) translate(5px, 5px);
}

.hamburger-menu.active span:nth-child(2) {
  opacity: 0;
}

.hamburger-menu.active span:nth-child(3) {
  transform: rotate(-45deg) translate(7px, -6px);
}
	</style>
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div id="wrapper">
	<!-- TTU Header -->
	<header id="banner" role="banner">
	    <button class="hamburger-menu" aria-label="Toggle menu">
    <span></span>
    <span></span>
    <span></span>
  </button>
	
		<div class="ttu-logo">
			<img src="${themeDisplay.getPathThemeImages()}/ttu-logo.svg" alt="Texas Tech University" height="45" style="margin-right: 10px;" />
			<span class="site-name">Raiderlink</span>
		</div>
		
		<div class="ttu-header-icons">
    <a href="#" class="ttu-header-icon">
        <img src="${themeDisplay.getPathThemeImages()}/info.svg" alt="Personal Information" height="30" />
        <span>My Personal<br>Information</span>
    </a>
    <a href="#" class="ttu-header-icon">
        <img src="${themeDisplay.getPathThemeImages()}/email.svg" alt="Email" height="30" />
        <span>Email</span>
    </a>
    <a href="#" class="ttu-header-icon">
        <img src="${themeDisplay.getPathThemeImages()}/help.svg" alt="Banner Assistance" height="30" />
        <span>Banner<br>Assistance</span>
    </a>
    <a href="${sign_out_url}" class="ttu-header-icon">
        <img src="${themeDisplay.getPathThemeImages()}/logout.svg" alt="Logout" height="30" />
        <span>Logout</span>
    </a>
</div>
	</header>

	<div class="ttu-container">
		<!-- Simple sidebar with navigation -->
		<div id="ttu-sidebar">
    <ul style="list-style: none; padding: 0; margin: 0;">
        <#if nav_items??>
            <#list nav_items as nav_item>
                <#assign
                    nav_item_css_class = ""
                />

                <#if nav_item.isSelected()>
                    <#assign nav_item_css_class = "selected" />
                </#if>

                <li style="border-bottom: 1px solid rgba(255, 255, 255, 0.1);" class="${nav_item_css_class}">
                    <a href="${nav_item.getURL()}" style="display: block; padding: 12px 20px; color: #ffffff; text-decoration: none; font-size: 14px;">
                        ${nav_item.getName()}
                    </a>
                </li>
            </#list>
        </#if>
    </ul>
</div>

		<!-- Content Area -->
		<div id="content">
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

<!-- Add this before the closing </body> tag -->
<script>
  (function() {
    var hamburgerBtn = document.querySelector('.hamburger-menu');
    var sidebar = document.querySelector('#ttu-sidebar');
    
    if (hamburgerBtn && sidebar) {
      hamburgerBtn.addEventListener('click', function() {
        sidebar.classList.toggle('show');
        hamburgerBtn.classList.toggle('active');
      });
    }
    
    // Close sidebar when clicking outside
    document.addEventListener('click', function(event) {
      var isClickInside = sidebar.contains(event.target) || hamburgerBtn.contains(event.target);
      
      if (!isClickInside && sidebar.classList.contains('show')) {
        sidebar.classList.remove('show');
        hamburgerBtn.classList.remove('active');
      }
    });
    
    // Adjust sidebar on window resize
    window.addEventListener('resize', function() {
      if (window.innerWidth > 768 && sidebar.classList.contains('show')) {
        sidebar.classList.remove('show');
        hamburgerBtn.classList.remove('active');
      }
    });
  })();
</script>

</body>
</html>
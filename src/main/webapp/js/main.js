// TTU Raiderlink Theme JavaScript

AUI().ready(
    function(A) {
        // Initialize expandable menu items in the sidebar
        var expandableMenuItems = A.all('#ttu-sidenav .expandable');
        
        expandableMenuItems.each(function(item) {
            var toggle = item.one('.ttu-menu-toggle');
            var link = item.one('a');
            
            if (toggle) {
                toggle.on('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    
                    if (toggle.get('innerHTML') === '▼') {
                        toggle.set('innerHTML', '▲');
                    } else {
                        toggle.set('innerHTML', '▼');
                    }
                    
                    // Find submenu if exists
                    var submenu = item.one('.ttu-submenu');
                    if (submenu) {
                        submenu.toggleClass('hidden');
                    }
                });
            }
            
            if (link) {
                link.on('click', function(e) {
                    // Regular link behavior - no special handling
                });
            }
        });
        
        // Add gear icon to section headers
        var sectionHeaders = A.all('.ttu-section-header');
        sectionHeaders.each(function(header) {
            var titleNode = header.one('.ttu-section-title');
            if (titleNode && !titleNode.hasClass('has-gear')) {
                titleNode.addClass('has-gear');
            }
        });
        
        // Handle portlet configuration icons
        var configIcons = A.all('.portlet-topper-toolbar .lexicon-icon');
        configIcons.each(function(icon) {
            // Make icon more visible in TTU theme
            var parent = icon.ancestor('a');
            if (parent) {
                parent.setStyle('color', '#333');
            }
        });
        
        // Fix header icon layout if any have long text
        var headerIcons = A.all('.ttu-header-icon');
        var maxHeight = 0;
        
        // First get the max height
        headerIcons.each(function(icon) {
            var height = icon.get('offsetHeight');
            if (height > maxHeight) {
                maxHeight = height;
            }
        });
        
        // Then set all to match for consistent layout
        if (maxHeight > 0) {
            headerIcons.each(function(icon) {
                icon.setStyle('height', maxHeight + 'px');
            });
        }
        
        // Initialize any popovers or tooltips
        var tooltipTriggers = A.all('[data-toggle="tooltip"]');
        tooltipTriggers.each(function(trigger) {
            new A.Tooltip({
                trigger: trigger,
                align: { points: ['bc', 'tc'] },
                zIndex: 100
            }).render();
        });
    }
);

// Handle viewport adjustments
Liferay.on('screenChange', function(event) {
    AUI().use('aui-base', function(A) {
        var screenSize = event.screenSize;
        
        if (screenSize === 'xs' || screenSize === 'sm') {
            // Mobile adjustments
            A.one('body').addClass('ttu-mobile');
        } else {
            A.one('body').removeClass('ttu-mobile');
        }
    });
});
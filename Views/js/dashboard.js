$(document).ready(function() {
    // Handle Products menu click
    $(".sidebar .menu-item.products").on("click", function(event) {
        event.stopPropagation(); // Prevent the click from propagating and closing the menu
        
        // Toggle the active class and visibility of the sub-menu
        var submenu = $(this).find(".sub-menu");
        
        if (submenu.is(":visible")) {
            submenu.slideUp(); // Hide the submenu if it's already visible
        } else {
            submenu.slideDown(); // Show the submenu if it's hidden
        }
        // Optionally, close other submenus if necessary
        $(".sidebar .menu-item").not(this).removeClass("active").find(".sub-menu").slideUp();
        $(this).toggleClass("active"); // Toggle the active class on the clicked menu item
    });

    // Close all submenus when clicking outside the sidebar
    $(document).on("click", function(event) {
        if (!$(event.target).closest(".sidebar").length) {
            $(".sidebar .sub-menu").slideUp(); // Hide all submenus
            $(".sidebar .menu-item").removeClass("active"); // Remove active class from all menu items
        }
    });
});
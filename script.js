// Get all buttons and pages
const menuLinks = document.querySelectorAll(".menu a");
const pages = document.querySelectorAll(".page");

// Add click event to each button
menuLinks.forEach(link => {
    link.addEventListener("click", event => {
        event.preventDefault();

        // Remove active class from all links and pages
        menuLinks.forEach(link => link.classList.remove("active"));
        pages.forEach(page => page.classList.remove("active"));

        // Add active class to the clicked link and its corresponding page
        const targetPageId = link.id.replace("-btn", "-page");
        document.getElementById(targetPageId).classList.add("active");
        link.classList.add("active");
    });
});

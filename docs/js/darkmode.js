document.addEventListener('DOMContentLoaded', function() {
    const themeToggle = document.getElementById('theme-toggle');
    const body = document.body;

    // Check if dark mode was previously set
    const storedTheme = localStorage.getItem('theme');
    if (storedTheme === 'dark') {
        body.classList.add('dark-theme');
    }

    // Event listener for toggling dark mode
    themeToggle.addEventListener('click', function() {
        body.classList.toggle('dark-theme');

        // Save the user's theme preference in local storage
        if (body.classList.contains('dark-theme')) {
            localStorage.setItem('theme', 'dark');
        } else {
            localStorage.setItem('theme', 'light');
        }
    });
});

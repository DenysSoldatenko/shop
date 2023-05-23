document.addEventListener("DOMContentLoaded", function() {
    var userIcon = document.getElementById("user-icon");
    var modal = document.getElementById("user-modal");
    var closeButton = modal.querySelector(".btn-close");

    function toggleModal(event) {
        event.preventDefault();
        modal.classList.toggle("show");

        // Store the modal state in local storage
        var modalVisible = modal.classList.contains("show");
        localStorage.setItem("modalVisible", modalVisible);
    }

    userIcon.addEventListener("click", toggleModal);
    closeButton.addEventListener("click", toggleModal);

    modal.addEventListener("click", function(event) {
        if (event.target === modal) {
            toggleModal(event);
        }
    });

    // Check if the modal state exists in local storage
    var modalVisible = localStorage.getItem("modalVisible");
    if (modalVisible === "true") {
        modal.classList.add("show");
    }

    // Reload the page when navigating away
    window.addEventListener("beforeunload", function() {
        localStorage.removeItem("modalVisible");
    });
});

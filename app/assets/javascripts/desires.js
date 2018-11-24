// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    // AJAX Delete File function ->
    $("#create_desire").on('click', function () {
        if (confirm('Are you sure ?')) {
            $.ajax({
                url: '/desires' + this.classList(0) + this.classList.item(1),
                type: 'POST',

                success: function (r) {
                    this.parentElement.parentElement.disabled = false;
                }
            });
        }
    });
});
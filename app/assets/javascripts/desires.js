// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    // AJAX Delete File function ->
    $("#create_desire").on('click', function () {
        var classes = $("#create_desire").attr('class').split(" ");
        if (confirm('Are you sure ?')) {
            $.ajax({
                url: '/desires?user_id=' + classes[0] +
                '&product_id=' + classes[1],
                type: 'POST',

                success: function (r) {
                    this.parentElement.parentElement.disabled = false;
                }
            });
        }
    });
});
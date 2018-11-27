// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    $("#create_desire").on('click', function () {
        if (this.id === "create_desire") {
            var classes = $("#create_desire").attr('class').split(" ");
            $.ajax({
                url: '/desires?user_id=' + classes[0] +
                '&product_id=' + classes[1] +
                '&desires_quantity=' + classes[2],
                type: 'POST',
                success: function (r) {

                }
            });
            this.enabled = false;
            this.id = "create_desire_block";
        }
    });
});


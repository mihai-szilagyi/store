var Store = Store || {};
function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#prod_image')
                    .attr('src', e.target.result)
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
}

$(document).ready(function(){

    $('.sort').on('change', function(){        
        $.post("/store/product_list",{order_by : $("#order_by").val(),
                                      order_type : $("#order_type").val()},
                                function(data){
                                    $("#catalog").html(data);
                                });
    });




});




$(document).ready(function() {
 
  $("#owl-example").owlCarousel();
 
 $('.carousel').carousel({
  interval: 6000
})
});


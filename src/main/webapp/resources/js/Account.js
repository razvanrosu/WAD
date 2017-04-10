/**
 * Created by Razvan on 4/9/2017.
 */
$(function(){
    $('.update-address').click(function(){
        var form = $(this).closest('form');
        var data = form.serialize();
        var action = form.attr('action');
        var type = form.attr('method');
        $.ajax({
            type: type,
            url: action,
            data: data,
            success: function(response) {
                if (response) {
                    bootbox.alert("Address saved succesfully!");
                }
            }
        });
        return false;
    });
    $('.delete-address').click(function(){
        var form = $(this).closest('form');
        var id = form.find('input[name="id"]').val();

        $.ajax({
            type: "GET",
            url: "<c:url value='/users/deleteAddress.do'/>?id=" + id,
            success: function(response) {
                if (response) {
                    $(form).closest('.panel').remove();
                }
            }
        });
        return false;
    });
    $('.add-address').click(function(){
        $('#addressForm').find('input').val('');
        $('#addressForm').modal({'show': true});
        return false;
    });
    $('#saveAddress').click(function(){
        var form = $("#newAddressForm");
        var data = form.serialize();
        var action = form.attr('action');
        var type = form.attr('method');
        $.ajax({
            type: type,
            url: action,
            data: data,
            success: function(response) {
                if (response.id != null) {
                    $('#addressForm').modal('hide');
                    $('#addressForm').find('input').val('');
                    var length = $('.addressForm').length -1;
                    var template = $('#accordion .panel').first().clone(true);
                    template.removeClass('hidden');
                    template.find(".collapse").removeClass("in");
                    template.find(".accordion-toggle").attr("href",  '#collapse_' + length).html('Address #' + length);
                    template.find(".panel-collapse").attr("id", 'collapse_' + length).addClass("collapse").removeClass("in");

                    template.find('input[name="id"]').val(response.id);
                    template.find('input[name="street"]').val(response.street);
                    template.find('input[name="number"]').val(response.number);
                    template.find('input[name="city"]').val(response.city);
                    template.find('input[name="country"]').val(response.country);
                    template.find('input[name="zip"]').val(response.zip);
                    $('#accordion').append(template.fadeIn());
                }
            }
        });
        return false;
    });
});
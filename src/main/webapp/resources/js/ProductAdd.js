/**
 * Created by razvan on 3/25/2017.
 */

function addToShoppingCart(productId) {


    var quantity = $("#selectQuantity" + productId).text();
    quantity = quantity.replace(/\s/g, '');
    if(quantity != parseInt(quantity, 10)){
        quantity = 1;
    }

    $("#selectQuantity" + productId).empty();
    $("#selectQuantity" + productId).append("Nr <span class=\"caret\"></span>");
    $("#cartButton").fadeOut(500);
    $("#cartButton").fadeIn(500);


    $.ajax({
        url : "/add/" + productId + "/" + quantity,
        method : "POST",
        success : function () {

        }

    })
    return false;
}


$("#cartButton").click(function () {
    $("#cart").empty();
               $.ajax({
                url : "/displayCart",
                method : "GET",
                dataType : "json",
                success : function (cartItems) {
                    if(cartItems.length !== 0){
                        var totalPrice = 0;
                        cartItems.forEach(function (cartItem, index) {

                            $("#cart").append("<li class = \"cartItem\"id = " + "item" + cartItem.id + ">" +
                                "<img src=" + cartItem.product.imagePath + " class=\"positionCartImage \" width=\"40\" height=\"40\" alt=\"Image\">" +
                                "<a href=\"#\">" + cartItem.quantity + " x " + cartItem.product.name + "</a>" +
                                "<a href=\"#\" class=\"glyphicon glyphicon-remove\" style='padding-left: 80px' onclick=\"deleteItem(" + cartItem.id + ")\"></a></li>");
                            totalPrice += cartItem.quantity * cartItem.product.price;

                        } )

                        $("#cart").append("<li><a class = \"glyphicon glyphicon-fire fa-2x\"href=\"#\" style = \"font-size:20px\"> Total price : " + totalPrice + " </a></li>");
                        $("#cart").append("<li><a class = \"glyphicon glyphicon-share-alt fa-2x\"href=\"#\" id = \"cartPage\" onclick=\"goToCartPage()\" style = \"font-size:20px\">  Go to cart</a></li>");
                    }

                    else{
                        $("#cart").append("<li><a href=\"#\"> No items in Cart </a></li>");
                    }

        }

    })
    return true;
});

function deleteItem(id) {
    $.ajax({
        url : "/deleteOrderItem/" + id,
        method : "DELETE",
        success : function () {
            //bootbox.alert("Deleted");
        }
    })
};

function deleteItemFromCartPage(id, price, quantity){
    $.ajax({
        url : "/deleteOrderItem/" + id,
        method : "DELETE",
        success : function () {

            $("#total").fadeOut("slow", function () {
                $("#total").html($("#total").html() - (price * quantity));
            }).fadeIn("slow");

            var size = $("#cartSize").html();

            $("#cartSize").fadeOut("slow", function () {
                $("#cartSize").html(size - 1)
            }).fadeIn("slow");


            $("#row-"+id).fadeOut("slow", function() {
                $("#row-"+id).remove();
            });

            if(size < 2){
                window.location.href = "/products.html";
            }
        }
    })
};

function goToCartPage () {
    window.location.href = "/viewCart";
};

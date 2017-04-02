/**
 * Created by razvan on 4/1/2017.
 */
$(".panel-primary").click(function (){
    goToProductDetails($(this)[0].id);
});



function goToProductDetails(productId){
    // $.ajax({
    //     url : "/product/" + productId,
    //     method : "GET",
    //     success : function () {
    //         window.location.href = url;
    //     }
    // });
    window.location.href = "/product/" + productId;
}

$("a.quantityItem").click(function(){
    // remove previously added selectedLi
    $('.selectedLi').removeClass('selectedLi');
    // add class `selectedLi`
    $(this).addClass('selectedLi');
    var selText = $(this).text();
    this.parentElement.parentElement.parentElement.firstElementChild.innerHTML = selText + " <span class=\"caret\"></span>";
});

$(document).ready(function() {

    var totHeight = $("#imageRow").height();

    $("#row1").css("height", totHeight - totHeight/5);
    //$("#row2").css("height", totHeight / 2);
});
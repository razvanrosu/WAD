/**
 * Created by razvan on 4/1/2017.
 */
$(".panel-primary").click(function (){
    goToProductDetails($(this)[0].id);
});



function goToProductDetails(productId){
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

function filterProducts() {
    // Declare variables
    var input, filter, ul, li, a, i;
    input = document.getElementById('myInput');
    filter = input.value.toLowerCase();
    var products = document.getElementsByClassName("col-sm-3");
    var i = 0;
    while (i < products.length){
        if(!products[i].getElementsByClassName("panel-heading")[0].innerHTML.toLowerCase().includes(filter)){
            $(".col-sm-3#" + products[i].id).hide("slow");
        }
        else{
            $(".col-sm-3#" + products[i].id).show("slow");
        }
        i++;
    }
}
/**
 * Created by Razvan on 5/13/2017.
 */

$(document).ready(function () {
    var trigger = $('.hamburger'),
        isClosed = false;

    trigger.click(function () {
        hamburger_cross();
    });

    function hamburger_cross() {

        if (isClosed == true) {
            trigger.removeClass('is-open');
            trigger.addClass('is-closed');
            isClosed = false;
        } else {
            trigger.removeClass('is-closed');
            trigger.addClass('is-open');
            isClosed = true;
        }
    }

    $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
    });
    // $('#pageContent').click(function () {
    //     $('#wrapper').removeClass('toggled');
    //     $('.hamburger').removeClass('is-open');
    //     $('.hamburger').addClass('is-closed')
    //     isClosed = false;
    // });


    $(document).click(function(e) {
        var sidebar = $("#sidebar-wrapper, #navButton");
        if (!sidebar.is(e.target) && sidebar.has(e.target).length === 0) {
            $('#wrapper').removeClass('toggled');
            $('.hamburger').removeClass('is-open');
            $('.hamburger').addClass('is-closed');
            isClosed = false;
        }
    });


});
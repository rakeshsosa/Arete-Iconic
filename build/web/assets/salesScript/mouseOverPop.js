/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function () {
});
var moveLeft = 0;
var moveDown = 0;
$('span.popper').hover(function (e) {
    var target = '#' + ($(this).attr('data-popbox'));
    $(target).show();
    moveLeft = $(this).outerWidth();
    moveDown = ($(target).outerHeight() / 2);   
}, function () {
    var target = '#' + ($(this).attr('data-popbox'));
    if (!($("a.popper").hasClass("show"))) {
        $(target).hide();
    }
});

$('span.popper').mousemove(function (e) {
    var target = "";
    var target = '#' + ($(this).attr('data-popbox'));
    leftD = e.pageX + parseInt(moveLeft);
    maxRight = leftD + $(target).outerWidth();
    windowLeft = $(window).width() - 40;
    windowRight = 0;
    maxLeft = e.pageX - (parseInt(moveLeft) + $(target).outerWidth() + 20);

    if (maxRight > windowLeft && maxLeft > windowRight) {
        leftD = maxLeft;
    }

    topD = e.pageY - parseInt(moveDown) - 40;
    $(target).css('top', topD).css('left', leftD);
    getRecipes(this);
});

function getRecipes($this) {
    var $itemRow = $($this).closest('tr');
    var menuCode = $($itemRow).find("#menuCode").val();
    $.ajax({
        type: "POST",
        url: '../sales/getRecipeName.htm',
        data: {
            menuCode: menuCode
        },
        success: function (data) {
            $($itemRow).find("#menuPop1").html(data);
        }

    });
}




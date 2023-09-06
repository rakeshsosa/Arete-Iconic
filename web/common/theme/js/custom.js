/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/** ******  left menu  *********************** **/
$(function () {

    $('#sidebar-menu li').removeClass('active');
    $('body').removeClass('nav-sm');
    $('body').addClass('nav-md');
    $('.left_col').removeClass('scroll-view');
    $('.left_col').removeAttr('style');
    $('.sidebar-footer').hide(10);


});

$(function () {
    $('#sidebar-menu li ul').slideUp();
    $('#sidebar-menu li').removeClass('active');

    $('#sidebar-menu li').click(function () {
        if ($(this).is('.active')) {
            $(this).removeClass('active');
            $('ul', this).slideUp();
            $(this).removeClass('nv');
            $(this).addClass('vn');
        } else {
            $('#sidebar-menu li ul').slideUp();
            $(this).removeClass('vn');
            $(this).addClass('nv');
            $('ul', this).slideDown();
            $('#sidebar-menu li').removeClass('active');
            $(this).addClass('active');
        }
    });

    $('#menu_toggle').click(function () {
        if ($('body').hasClass('nav-md')) {
            $('body').removeClass('nav-md');
            $('body').addClass('nav-sm');
            $('.left_col').removeClass('scroll-view');
            $('.left_col').removeAttr('style');
            $('.sidebar-footer').hide();

            if ($('#sidebar-menu li').hasClass('active')) {
                $('#sidebar-menu li.active').addClass('active-sm');
                $('#sidebar-menu li.active').removeClass('active');
            }
        } else {
            $('body').removeClass('nav-sm');
            $('body').addClass('nav-md');
            $('.sidebar-footer').show();

            if ($('#sidebar-menu li').hasClass('active-sm')) {
                $('#sidebar-menu li.active-sm').addClass('active');
                $('#sidebar-menu li.active-sm').removeClass('active-sm');
            }
        }
    });
});

/* Sidebar Menu active class 
 $(function () {
 var url = window.location;
 $('#sidebar-menu a[href="' + url + '"]').parent('li').addClass('current-page');
 $('#sidebar-menu a').filter(function () {
 return this.href == url;
 }).parent('li').addClass('current-page').parent('ul').slideDown().parent().addClass('active');
 });
 
 //$(function () {
 //    $('#sidebar-menu li ul').slideUp();
 //    $('#sidebar-menu li').removeClass('active');
 //
 //    $('#sidebar-menu li').click(function () {
 //        if ($(this).is('.active')) {
 //            $(this).removeClass('active');
 //            $('ul', this).slideUp();
 //            $(this).removeClass('nv');
 //            $(this).addClass('vn');
 //        } else {
 //            $('#sidebar-menu li ul').slideUp();
 //            $(this).removeClass('vn');
 //            $(this).addClass('nv');
 //            $('ul', this).slideDown();
 //            $('#sidebar-menu li').removeClass('active');
 //            $(this).addClass('active');
 //        }
 //    });
 //
 //    $('#menu_toggle').click(function () {
 //        if ($('body').hasClass('nav-md')) {
 //            $('body').removeClass('nav-md');
 //            $('body').addClass('nav-sm');
 //            $('.left_col').removeClass('scroll-view');
 //            $('.left_col').removeAttr('style');
 //            $('.sidebar-footer').hide();
 //
 //            if ($('#sidebar-menu li').hasClass('active')) {
 //                $('#sidebar-menu li.active').addClass('active-sm');
 //                $('#sidebar-menu li.active').removeClass('active');
 //            }
 //        } else {
 //            $('body').removeClass('nav-sm');
 //            $('body').addClass('nav-md');
 //            $('.sidebar-footer').show();
 //
 //            if ($('#sidebar-menu li').hasClass('active-sm')) {
 //                $('#sidebar-menu li.active-sm').addClass('active');
 //                $('#sidebar-menu li.active-sm').removeClass('active-sm');
 //            }
 //        }
 //    });
 //});
 //
 ///* Sidebar Menu active class */
//$(function () {
//    var url = window.location;
//    $('#sidebar-menu a[href="' + url + '"]').parent('li').addClass('current-page');
//    $('#sidebar-menu a').filter(function () {
//        return this.href == url;
//    }).parent('li').addClass('current-page').parent('ul').slideDown().parent().addClass('active');
//});

/** ******  /left menu  *********************** **/
//$(function () {
//    $('#sidebar-menu li ul').slideUp();
//    $('#sidebar-menu li').removeClass('active');
//
//    $('#sidebar-menu li').click(function () {
//        if ($(this).is('.active')) {
//            $(this).removeClass('active');
//            $('ul', this).slideUp();
//            $(this).removeClass('nv');
//            $(this).addClass('vn');
//        } else {
//            $('#sidebar-menu li ul').slideUp();
//            $(this).removeClass('vn');
//            $(this).addClass('nv');
//            $('ul', this).slideDown();
//            $('#sidebar-menu li').removeClass('active');
//            $(this).addClass('active');
//        }
//    });
//
//    $('#menu_toggle').click(function () {
//        if ($('body').hasClass('nav-md')) {
//            $('body').removeClass('nav-md');
//            $('body').addClass('nav-sm');
//            $('.left_col').removeClass('scroll-view');
//            $('.left_col').removeAttr('style');
//            $('.sidebar-footer').hide();
//
//            if ($('#sidebar-menu li').hasClass('active')) {
//                $('#sidebar-menu li.active').addClass('active-sm');
//                $('#sidebar-menu li.active').removeClass('active');
//            }
//        } else {
//            $('body').removeClass('nav-sm');
//            $('body').addClass('nav-md');
//            $('.sidebar-footer').show();
//
//            if ($('#sidebar-menu li').hasClass('active-sm')) {
//                $('#sidebar-menu li.active-sm').addClass('active');
//                $('#sidebar-menu li.active-sm').removeClass('active-sm');
//            }
//        }
//    });
//});
//
///* Sidebar Menu active class */
//$(function () {
//    var url = window.location;
//    $('#sidebar-menu a[href="' + url + '"]').parent('li').addClass('current-page');
//    $('#sidebar-menu a').filter(function () {
//        return this.href == url;
//    }).parent('li').addClass('current-page').parent('ul').slideDown().parent().addClass('active');
//});

/** ******  /left menu  *********************** **/



/** ******  tooltip  *********************** **/
$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})
/** ******  /tooltip  *********************** **/
/** ******  progressbar  *********************** **/
if ($(".progress .progress-bar")[0]) {
    $('.progress .progress-bar').progressbar(); // bootstrap 3
}
/** ******  /progressbar  *********************** **/
/** ******  switchery  *********************** **/
if ($(".js-switch")[0]) {
    var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
    elems.forEach(function (html) {
        var switchery = new Switchery(html, {
            color: '#26B99A'
        });
    });
}
/** ******  /switcher  *********************** **/
/** ******  collapse panel  *********************** **/
// Close ibox function
$('.close-link').click(function () {
    var content = $(this).closest('div.x_panel');
    content.remove();
});

// Collapse ibox function
$('.collapse-link').click(function () {
    var x_panel = $(this).closest('div.x_panel');
    var button = $(this).find('i');
    var content = x_panel.find('div.x_content');
    content.slideToggle(200);
    (x_panel.hasClass('fixed_height_390') ? x_panel.toggleClass('').toggleClass('fixed_height_390') : '');
    (x_panel.hasClass('fixed_height_320') ? x_panel.toggleClass('').toggleClass('fixed_height_320') : '');
    button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
    setTimeout(function () {
        x_panel.resize();
    }, 50);
});
/** ******  /collapse panel  *********************** **/
/** ******  iswitch  *********************** **/
if ($("input.flat")[0]) {
    $(document).ready(function () {
        $('input.flat').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });
    });
}
/** ******  /iswitch  *********************** **/
/** ******  star rating  *********************** **/
// Starrr plugin (https://github.com/dobtco/starrr)
var __slice = [].slice;

(function ($, window) {
    var Starrr;

    Starrr = (function () {
        Starrr.prototype.defaults = {
            rating: void 0,
            numStars: 5,
            change: function (e, value) {
            }
        };

        function Starrr($el, options) {
            var i, _, _ref,
                    _this = this;

            this.options = $.extend({}, this.defaults, options);
            this.$el = $el;
            _ref = this.defaults;
            for (i in _ref) {
                _ = _ref[i];
                if (this.$el.data(i) != null) {
                    this.options[i] = this.$el.data(i);
                }
            }
            this.createStars();
            this.syncRating();
            this.$el.on('mouseover.starrr', 'span', function (e) {
                return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
            });
            this.$el.on('mouseout.starrr', function () {
                return _this.syncRating();
            });
            this.$el.on('click.starrr', 'span', function (e) {
                return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
            });
            this.$el.on('starrr:change', this.options.change);
        }

        Starrr.prototype.createStars = function () {
            var _i, _ref, _results;

            _results = [];
            for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
                _results.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"));
            }
            return _results;
        };

        Starrr.prototype.setRating = function (rating) {
            if (this.options.rating === rating) {
                rating = void 0;
            }
            this.options.rating = rating;
            this.syncRating();
            return this.$el.trigger('starrr:change', rating);
        };

        Starrr.prototype.syncRating = function (rating) {
            var i, _i, _j, _ref;

            rating || (rating = this.options.rating);
            if (rating) {
                for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
                    this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
                }
            }
            if (rating && rating < 5) {
                for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
                    this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                }
            }
            if (!rating) {
                return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
            }
        };

        return Starrr;

    })();
    return $.fn.extend({
        starrr: function () {
            var args, option;

            option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
            return this.each(function () {
                var data;

                data = $(this).data('star-rating');
                if (!data) {
                    $(this).data('star-rating', (data = new Starrr($(this), option)));
                }
                if (typeof option === 'string') {
                    return data[option].apply(data, args);
                }
            });
        }
    });
})(window.jQuery, window);

$(function () {
    return $(".starrr").starrr();
});

$(document).ready(function () {

    $('#stars').on('starrr:change', function (e, value) {
        $('#count').html(value);
    });


    $('#stars-existing').on('starrr:change', function (e, value) {
        $('#count-existing').html(value);
    });

});
/** ******  /star rating  *********************** **/
/** ******  table  *********************** **/
$('table input').on('ifChecked', function () {
    check_state = '';
    $(this).parent().parent().parent().addClass('selected');
    countChecked();
});
$('table input').on('ifUnchecked', function () {
    check_state = '';
    $(this).parent().parent().parent().removeClass('selected');
    countChecked();
});

var check_state = '';
$('.bulk_action input').on('ifChecked', function () {
    check_state = '';
    $(this).parent().parent().parent().addClass('selected');
    countChecked();
});
$('.bulk_action input').on('ifUnchecked', function () {
    check_state = '';
    $(this).parent().parent().parent().removeClass('selected');
    countChecked();
});
$('.bulk_action input#check-all').on('ifChecked', function () {
    check_state = 'check_all';
    countChecked();
});
$('.bulk_action input#check-all').on('ifUnchecked', function () {
    check_state = 'uncheck_all';
    countChecked();
});

function countChecked() {
    if (check_state == 'check_all') {
        $(".bulk_action input[name='table_records']").iCheck('check');
    }
    if (check_state == 'uncheck_all') {
        $(".bulk_action input[name='table_records']").iCheck('uncheck');
    }
    var n = $(".bulk_action input[name='table_records']:checked").length;
    if (n > 0) {
        $('.column-title').hide();
        $('.bulk-actions').show();
        $('.action-cnt').html(n + ' Records Selected');
    } else {
        $('.column-title').show();
        $('.bulk-actions').hide();
    }
}
/** ******  /table  *********************** **/
/** ******    *********************** **/
/** ******    *********************** **/
/** ******    *********************** **/
/** ******    *********************** **/
/** ******    *********************** **/
/** ******    *********************** **/
/** ******  Accordion  *********************** **/

$(function () {
    $(".expand").on("click", function () {
        $(this).next().slideToggle(200);
        $expand = $(this).find(">:first-child");

        if ($expand.text() == "+") {
            $expand.text("-");
        } else {
            $expand.text("+");
        }
    });
});

/** ******  Accordion  *********************** **/
/** ******  scrollview  *********************** **/
$(document).ready(function () {

    $(".scroll-view").niceScroll({
        touchbehavior: true,
        cursorcolor: "rgba(42, 63, 84, 0.35)"
    });

});
/** ******  /scrollview  *********************** **/

$(document).ready(function (){
   
     $('tbody tr td').css('text-align', '');
       $('tbody tr td div').css('text-align', '');
    $('tbody tr').each(function ()
    {
        //debugger;
        // right align any numeric columns
       //$('tbody tr td').css('text-align', 'left');
       $('tbody tr td div').css('text-align', 'left');
        $(this).children('td').filter(function ()
        {
             debugger;
            var cond1 = this.innerHTML.match(/^[0-9\s\.,]+$/);
            if (cond1) {
                $(this).css('text-align','');
                $(this).css('text-align', 'right');
                //$(".testclass").css('text-align','right');
            }
            else{
                $(this).css('text-align', 'left');
            }
            
        }).css('text-align', 'right');
    });
});
function readURL(input) {
                                // $('#blah').show();
                                // checkImageSize();
                                if (input.files && input.files[0]) {
                                    var reader = new FileReader();

                                    reader.onload = function (e) {
                                        $('#blah')
                                                .attr('src', e.target.result)
                                    };

                                    reader.readAsDataURL(input.files[0]);
                                    // console.log(reader);
                                    // $("#upload-message").hide();
                                    document.getElementById("guide-message").style.display = 'block';
                                    var a = $("#guide-message").addClass('msg');
                                    a.text('update your logo');
                                    $("#upload-message").hide();
                                };
                            };
 
function firstToUpperCase(e) {
                var str5 = e.target.value;
                var a5 = str5.charAt(0).toUpperCase() + str5.substr(1);
                e.target.value= a5;
            }
            function isNumberWithDot(evt){
                var val = evt.target.value;
                if(isNaN(val)){
                     val = val.replace(/[^0-9\.]/,'');
                     if(val.split('.').length>3) 
                         val =val.replace(/\.+$/,"");
                }
                evt.target.value = val;
            }

            function isNumberKey(evt)
            {
                $(this).on("cut copy paste",function(e) {
                    e.preventDefault();
                 });
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode >= 31 && (charCode < 48 || charCode > 57)){
                    swal("Special characters and alphabets are not allowed!");
                    evt.preventDefault();
                    return false;
                } else {
                    return true;
                }
                    
                
            }
            
            function isSplCharNumberKey(evt)
            {
                $(this).on("cut copy paste",function(e) {
                    e.preventDefault();
                 });
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)){
                    swal("Alphabets are not allowed.");
                    evt.preventDefault();
                    return false;
                } else {
                    return true;
                }
                    
                
            }
            
             function validateEmail(emailField){
        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

        if (reg.test(emailField.value) == false) 
        {
            swal('Enter valid email id');
            emailField.value = '';
            return false;
        }

        return true;

      }
            
            function isAlphaNumeric(evt) {
                $(this).on("cut copy paste",function(e) {
                    e.preventDefault();
                 });
                var charCode = (evt.which) ? evt.which : event.keyCode;

                if (charCode > 32 && (charCode < 48 || charCode > 57) && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
                {
                    //swal("Special Characters are not allowed.");
                    swal("Special characters are not allowed!");
                    evt.preventDefault();
                    return false;

                } else {
                    return true;
                }

            }
            
            function isAlphabet(e){
                $(this).on("cut copy paste",function(e) {
                    e.preventDefault();
                 });
                var regex = new RegExp("^[a-zA-Z_ ]+$");
                var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
                var key = e.keyCode || e.charCode;
                if (regex.test(str) || key == 8 || key == 46) {
                        return true;
                }
                else
                {
                    swal('Special characters and numbers are not allowed!');
                    e.preventDefault();
                return false;
                
                }
            }
            
            function enforceMinMax(el){
                if(el.value != ""){
                  if(parseInt(el.value) < parseInt(el.min)){
                    el.value = el.min;
                  }
                  if(parseInt(el.value) > parseInt(el.max)){
                    el.value = el.max;
                  }
                }
              }
            
            $('.decimal').keypress(function (e) {
                console.log(e.keycode);
                var character = String.fromCharCode(e.keyCode)
                var newValue = this.value + character;
                if (isNaN(newValue) || hasDecimalPlace(newValue, 4)) {
                    e.preventDefault();
                    return false;
                }
            });
            
            function allowThreeDecimal(ev){
               var v = parseFloat(ev.target.value);
                if (isNaN(v)) {
                    ev.target.value = '';
                } else {
                    ev.target.value = v.toFixed(3);
                }
            }
            
            function allowTwoDecimal(ev){
               var v = parseFloat(ev.target.value);
                if (isNaN(v)) {
                    ev.target.value = '';
                } else {
                    ev.target.value = v.toFixed(2);
                }
            }
            
            $("[type='number']").on('keydown', function(event){
                return (event.keyCode !== 69 && event.keyCode != 107 && event.keyCode != 109 && event.keyCode != 189 && event.keyCode !=187)
            })

            function hasDecimalPlace(value, x) {
                var pointIndex = value.indexOf('.');
                return  pointIndex >= 0 && pointIndex < value.length - x;
            }
            
                function notAllowNumbers(evt){
                      $(this).on("cut copy paste",function(e) {
                    e.preventDefault();
                 });
                var charCode = (evt.which) ? evt.which : event.keyCode;

                if (charCode > 48 && charCode < 57)
                {
                    //swal("Special Characters are not allowed.");
                    swal("Numbers are not allowed.");
                    evt.preventDefault();
                    return false;

                } else {
                    return true;
                }  

            }

    
            
            function validateemails(e) {

                var emailList = e.target.value.split(',');
                for (i=0;i<emailList.length;i++) { 
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
                var result= regex.test(emailList[i]);
                 if(result==false) { 
                        swal("Please Enter Valid Mail ID");
                        e.target.value = '';
                        return false;
                    }
                }
                
                return true;

                }


//is numberkey code starts
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
}
    return true;
}
//is numberkey code ends

            $( document ).ready(function() {
              $("#vat-type").css('pointer-events','none');
                $( "#frname, #toname, #bankname, #accholdername, #customerName" ).keypress(function(e) {
                    var regex = new RegExp("^[a-zA-Z_ ]+$");
			var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
			if (regex.test(str)) {
				return true;
			}
			else
			{
			swal('Special characters and numbers are not allowed!');
                        e.preventDefault();
			return false;
			}
                });
                
            })

// Disable form submissions if there are invalid fields
$(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
});


$( document ).ready( function () {
                autosize();
                function autosize(){
                    var text = $('.autosize');

                    text.each(function(){
                        $(this).attr('rows',1);
                        resize($(this));
                    });

                    text.on('input', function(){
                        resize($(this));
                    });

                    function resize ($text) {
                        $text.css('height', 'auto');
                        $text.css('height', $text[0].scrollHeight+'px');
                    }
                }

                });

                                 
                                 
                                 function search_question() { 
            let input = document.getElementById('searchbar').value 
            input=input.toLowerCase(); 
            let x = document.getElementsByClassName('questions'); 

            for (i = 0; i < x.length; i++) {  
                if (!x[i].innerHTML.toLowerCase().includes(input)) { 
                    x[i].style.display="none"; 
                } 
                else { 
                    x[i].style.display="block";                  
                } 
            } 
        }
        

  $('.accordion a').click(function(){
    $(this).toggleClass('active');
    $(this).next('.content').slideToggle(400);
   });



 $("#savebtn").click(function () {
        $("#coustmermnForm").validate({
            rules: {},
            messages: {},
            errorElement: 'div',
            errorClass: 'invalid-feedback',
            errorPlacement: function (error, element) {
                if (element.parent('.input-group-prepend').length) {
                    $(element).siblings(".invalid-feedback").append(error);
                } else {
                    error.insertAfter(element);
                }
            },
            highlight: function (element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            }
        });
    });
    
    
    
//   --------------------------
//Invoice Subtotal Calculations code starts
//   --------------------------
//        function checkamtpaid(e){
//            e.preventDefault();
//            var subTotalInput = document.getElementById("subTotalInput").value;
//            var amtpaid = document.getElementById("amount_paid_rate").value;
//            if(subTotalInput == '' || subTotalInput == 0){
//                swal("Please Enter Atleast one item and rate details")
//            }
//            else if(amtpaid != 0){
//                document.getElementById("coustmermnForm").submit();
//            } else{
//                swal("Please enter amount paid");
//            }
//            
//        }


                  


//is numberkey code starts
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
}
    return true;
}
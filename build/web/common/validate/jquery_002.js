(function ($) {
    $.fn.validationEngineLanguage = function () {
    };
    $.validationEngineLanguage = {
        newLang: function () {
            $.validationEngineLanguage.allRules = {
                "required": {// Add your regex rules here, you can take telephone as an example
                    "regex": "none",
                    "alertText": "* This field is required",
                    "alertTextCheckboxMultiple": "* Please select an option",
                    "alertTextCheckboxe": "* This checkbox is required",
                    "alertTextDateRange": "* Both date range fields are required"
                },
                "requiredInFunction": {
                    "func": function (field, rules, i, options) {
                        return (field.val() == "test") ? true : false;
                    },
                    "alertText": "* Field must equal test"
                },
                "password": {
                    "regex": /^[a-zA-Z]\w{7,23}$/,
                    "alertText": "* Invalid Password"
                },
                "samepass": {
                    "func": function () {
                        var a = document.getElementById('nPassword').value;
                        var b = document.getElementById('nPassword1').value;
                        return (a == b) ? true : false;
                    },
                    "alertText": "* New Password & Confirm Password does not match"
                },
                "samepass1": {
                    "func": function () {
                        var a2 = document.getElementById('pass').value;
                        var b2 = document.getElementById('repass').value;
                        return (a2 == b2) ? true : false;
                    },
                    "alertText": "* Password & Re-Password does not match"
                },
                "oldpass": {
                    "func": function () {
                        var a1 = document.getElementById('oPassword').value;
                        var b1 = document.getElementById('oPassword1').value;
                        return (a1 == b1) ? true : false;
                    },
                    "alertText": "* Enter Valid Password"
                },
                "dateRange": {
                    "regex": "none",
                    "alertText": "* Invalid ",
                    "alertText2": "Date Range"
                },
                "dateTimeRange": {
                    "regex": "none",
                    "alertText": "* Invalid ",
                    "alertText2": "Date Time Range"
                },
                "minSize": {
                    "regex": /^[a-zA-Z0-9]{4,}$/,
                    "alertText": "* Minimum four Character Required"
                },
                "maxSize": {
                    "regex": "none",
                    "alertText": "* Maximum ",
                    "alertText2": " characters allowed"
                },
                "groupRequired": {
                    "regex": "none",
                    "alertText": "* You must fill one of the following fields"
                },
                "min": {
                    "regex": "none",
                    "alertText": "* Minimum value is "
                },
                "max": {
                    "regex": "none",
                    "alertText": "* Maximum value is "
                },
                "past": {
                    "regex": "none",
                    "alertText": "* Date prior to "
                },
                "future": {
                    "regex": "none",
                    "alertText": "* Date past "
                },
                "maxCheckbox": {
                    "regex": "none",
                    "alertText": "* Maximum ",
                    "alertText2": " options allowed"
                },
                "minCheckbox": {
                    "regex": "none",
                    "alertText": "* Please select ",
                    "alertText2": " options"
                },
                "equals": {
                    "regex": "none",
                    "alertText": "* Fields do not match"
                },
                "creditCard": {
                    "regex": "none",
                    "alertText": "* Invalid credit card number"
                },
                "phone": {
                    // credit: jquery.h5validate.js / orefalo
                    "regex": /^(\d{7})([\+][1-9]{1,3}[\ \.\-])?([\(]{1}[0-9]{2,6}[\)])?([0-9\ \-\/]{3,20})((x|ext|extension)[\ ]?[0-9]{1,4})?$/,
                    "alertText": "* Invalid Contact Number"
                },
                "email": {
                    // HTML5 compatible email regex ( http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#    e-mail-state-%28type=email%29 )
                    "regex": /^([\w+-.%]+@[\w-.]+\.[A-Za-z]{2,4},?)+$/,
                    "alertText": "* Invalid email address"
                },
                "email2": {
                    // HTML5 compatible email regex
                    "regex": /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/,
                    "alertText": "* Invalid email address"
                },
                "email1": {
                    // HTML5 compatible email regex ( http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#    e-mail-state-%28type=email%29 )
                    "regex": /^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/,
                    "alertText": "* Invalid email address"

                },
                "pancard": {
                    // HTML5 compatible email regex ( http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#    e-mail-state-%28type=email%29 )
                    "regex": /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/,
                    "alertText": "* Invalid PAN Number"

                },
                "curcode": {
                    // HTML5 compatible email regex ( http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#    e-mail-state-%28type=email%29 )
                    "regex": /^([A-Z]){3}?$/,
                    "alertText": "* Enter Min & Max 3 Characters"

                },
                "ifsc": {
                    // HTML5 compatible email regex ( http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#    e-mail-state-%28type=email%29 )
                    "regex": /^([A-Z]){4}([0]){1}([A-Z0-9]){6}?$/,
                    "alertText": "* Invalid IfSC Code"

                },
                "bankac": {
                    // credit: jquery.h5validate.js / orefalo
                    "regex": /^(?!.*-.*-.*-)(?=(?:\d{9,18}$)|(?:(?=.{9,11}$)[^-]*-[^-]*$)|(?:(?=.{10,12}$)[^-]*-[^-]*-[^-]*$)  )[\d-]+$/,
                    "alertText": "* Invalid Account Number"
                },
                "notzero": {
                    "regex": /^(([0-9]*[1-9][0-9]*([.][0-9]+)?)|([0]+[.][0-9]*[1-9][0-9]*))$/,
                    "alertText": "* Invalid Quantity"
                },
                "integer": {
                    "regex": /^[\-\+]?\d+$/,
                    "alertText": "* Not a valid integer"
                },
                "number": {
                    // Number, including positive, negative, and floating decimal. credit: orefalo
                    "regex": /^[1-9]\d*$/,
                    "alertText": "* Invalid Quantity"
                },
                "float": {
                    // Number, including positive, negative, and floating decimal. credit: orefalo
                    "regex": /^(?:[1-9]\d*|0)?(?:\.\d+)?$/,
                    "alertText": "* Invalid Amount"
                },
                "float1": {
                    // Number, including positive, negative, and floating decimal. credit: orefalo
                    "regex": /^(100(?:\.0{1,2})?|0*?\.\d{1,2}|\d{1,2}(?:\.\d{1,3})?)$/,
                    "alertText": "* Invalid Amount"

                },
                "float4": {
                    // Number, including positive, negative, and floating decimal. credit: orefalo
                    "regex": /^(99(?:\.0{1,2})?|0*?\.\d{1,2}|\d{1,2}(?:\.\d{1,3})?)$/,
                    "alertText": "* Invalid Amount"

                },
                "float2": {
                    // Number, including positive, negative, and floating decimal. credit: orefalo
                    "regex": /^(100000(?:\.0{1,2})?|[0]*?\.\d{1,9}|\d{1,9}(?:\.\d{1,3})?)$/,
                    "alertText": "* Please enter 3 decimal value only"
                },
                "float3": {
                    // Number, including positive, negative, and floating decimal. credit: orefalo
                    "regex": /^(1000(?:\.0{1,3})?|0*?\.\d{1,3}|\d{1,3}(?:\.\d{1,3})?)$/,
                    "alertText": "* Please Enter 3 decimal values"

                },
                "float7": {
                    // Number, including positive, negative, and floating decimal. credit: orefalo
                    "regex": /^(1000(?:\.0{1,2})?|0*?\.\d{1,2}|\d{1,2}(?:\.\d{1,2})?)$/,
                    "alertText": "* Please Enter 2 decimal values"

                },
                "onlyLetterSp1": {
                    "regex": /^[a-zA-Z\ \']+$/,
                    "alertText": "*Please Enter Only Alphabets"
                },
                "date": {
                    //	Check if date is valid by leap year
                    "func": function (field) {
                        var pattern = new RegExp(/^(\d{4})[\/\-\.](0?[1-9]|1[012])[\/\-\.](0?[1-9]|[12][0-9]|3[01])$/);
                        var match = pattern.exec(field.val());
                        if (match == null)
                            return false;

                        var year = match[1];
                        var month = match[2] * 1;
                        var day = match[3] * 1;
                        var date = new Date(year, month - 1, day); // because months starts from 0.

                        return (date.getFullYear() == year && date.getMonth() == (month - 1) && date.getDate() == day);
                    },
                    "alertText": "* Invalid date, must be in YYYY-MM-DD format"
                },
                "date1": {
                    "regex": /^(([0-9])|([0-2][0-9])|([3][0-1]))\-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\-\d{4}$/,
                    "alertText": "* Invalid date, must be in dd-MMM-yyyy format"
                },
                "ipv4": {
                    "regex": /^((([01]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))[.]){3}(([0-1]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))$/,
                    "alertText": "* Invalid IP address"
                },
                "url": {
                    "regex": /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i,
                    "alertText": "* Invalid URL"
                },
                "onlyNumberSp": {
                    "regex": /^[0-9\ ]+$/,
                    "alertText": "* Numbers only"
                },
                "pincode": {
                    "regex": /^(\d{5})[0-9\ ]+$/,
                    "alertText": "* Invalid Pin Code"
                },
                "onlyLetterSp": {
                    "regex": /^[a-zA-Z\ \']+$/,
                    "alertText": "* Letters only"
                },
                "onlyLetterNumber": {
                    "regex": /^[0-9a-zA-Z]+$/,
                    "alertText": "* No special characters allowed"
                },
                // --- CUSTOM RULES -- Those are specific to the demos, they can be removed or changed to your likings
                "ajaxUserCall": {
                    "url": "ajaxValidateFieldUser",
                    // you may want to pass extra data on the ajax call
                    "extraData": "name=eric",
                    "alertText": "* This user is already taken",
                    "alertTextLoad": "* Validating, please wait"
                },
                "ajaxUserCallPhp": {
                    "url": "phpajax/ajaxValidateFieldUser.php",
                    // you may want to pass extra data on the ajax call
                    "extraData": "name=eric",
                    // if you provide an "alertTextOk", it will show as a green prompt when the field validates
                    "alertTextOk": "* This username is available",
                    "alertText": "* This user is already taken",
                    "alertTextLoad": "* Validating, please wait"
                },
                "ajaxNameCall": {
                    // remote json service location
                    "url": "ajaxValidateFieldName",
                    // error
                    "alertText": "* This name is already taken",
                    // if you provide an "alertTextOk", it will show as a green prompt when the field validates
                    "alertTextOk": "* This name is available",
                    // speaks by itself
                    "alertTextLoad": "* Validating, please wait"
                },
                "ajaxNameCallPhp": {
                    // remote json service location
                    "url": "phpajax/ajaxValidateFieldName.php",
                    // error
                    "alertText": "* This name is already taken",
                    // speaks by itself
                    "alertTextLoad": "* Validating, please wait"
                },
                "validate2fields": {
                    "alertText": "* Please input HELLO"
                },
                //tls warning:homegrown not fielded 
                "dateFormat": {
                    "regex": /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:0?[1-9]|1[0-2])(\/|-)(?:0?[1-9]|1\d|2[0-8]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(0?2(\/|-)29)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$/,
                    "alertText": "* Invalid Date"
                },
                //tls warning:homegrown not fielded 
                "dateTimeFormat": {
                    "regex": /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1}$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^((1[012]|0?[1-9]){1}\/(0?[1-9]|[12][0-9]|3[01]){1}\/\d{2,4}\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1})$/,
                    "alertText": "* Invalid Date or Date Format",
                    "alertText2": "Expected Format: ",
                    "alertText3": "mm/dd/yyyy hh:mm:ss AM|PM or ",
                    "alertText4": "yyyy-mm-dd hh:mm:ss AM|PM"
                }
            };

        }
    };

    $.validationEngineLanguage.newLang();

})(jQuery);

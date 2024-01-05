$(document).ready(function () {
    $(window).load(function () {
        $(".loader").fadeOut("slow");
    });
})
$(function () {
    $(".select2").select2();
});
function ShowImagePreview(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('.Photo').prop('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
$(function () {
    $(".Current").keyup(function () {
        $('.Remaining').val(($('.Total').val() - $('.Previous').val()) - $('.Current').val());
        var remaining = $('.Total').val() - $('.Previous').val();
        var remainingbalance = $('.Remaining').val();
        if ($('.Current').val() > remaining) {
            alertify.defaults.transition = "slide";
            alertify.defaults.theme.ok = "btn btn-primary";
            alertify.defaults.theme.cancel = "btn btn-danger";
            alertify.defaults.theme.input = "form-control";
            window.showConfirm = function () {
                alertify.confirm("Current amount can't more than remaining amount. Remaining amount should be " + remaining + " or less than " + remaining + "").set({ title: "Alert Message" });
            }
            window.showConfirm();
            $('.Remaining').val(0);
            $('.Current').val(0);
        }
        if (remainingbalance == 0) {
            $(".NextPaymentOn").val('1').change();
            $(".NextPaymentOn").prop('disabled', true);
        }
        else {
            $(".NextPaymentOn").val('0').change();
            $(".NextPaymentOn").prop('disabled', false);
        }
    });
});
var prm = Sys.WebForms.PageRequestManager.getInstance();
prm.add_endRequest(function () {
    $(function () {
        $(".select2").select2();
    });
    function ShowImagePreview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.Photo').prop('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(function () {
        $(".Current").keyup(function () {
            $('.Remaining').val(($('.Total').val() - $('.Previous').val()) - $('.Current').val());
            var remaining = $('.Total').val() - $('.Previous').val();
            var remainingbalance = $('.Remaining').val();
            if ($('.Current').val() > remaining) {
                alertify.defaults.transition = "slide";
                alertify.defaults.theme.ok = "btn btn-primary";
                alertify.defaults.theme.cancel = "btn btn-danger";
                alertify.defaults.theme.input = "form-control";
                window.showConfirm = function () {
                    alertify.confirm("Current amount can't more than remaining amount. Remaining amount should be " + remaining + " or less than " + remaining + "").set({ title: "Alert Message" });
                }
                window.showConfirm();
                $('.Remaining').val(0);
                $('.Current').val(0);
            }
            if (remainingbalance == 0) {
                $(".NextPaymentOn").val('1').change();
                $(".NextPaymentOn").prop('disabled', true);
            }
            else {
                $(".NextPaymentOn").val('0').change();
                $(".NextPaymentOn").prop('disabled', false);
            }
            
        });
    });
    $(document).ready(function () {
        $(window).load(function () {
            $(".loader").fadeOut("slow");
        });
    })
    function ShowImagePreviewProfilePhoto(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.ProfilePhoto').prop('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    
});
function ShowImagePreviewProfilePhoto(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('.ProfilePhoto').prop('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
var str = location.href.toLowerCase();
$("#Navabar li a").each(function () {
    if (str.indexOf($(this).attr("href").toLowerCase()) > -0) {
        $("#Navabar li.active").removeClass("active");
        $(this).parent().addClass("active");
    }
});
$("#Navabar li.active").parents().each(function () {
    if ($(this).is("li")) {
        $(this).addClass("active");
    }
});
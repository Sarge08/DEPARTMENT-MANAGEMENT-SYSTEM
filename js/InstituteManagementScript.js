$(function () {
    function toggleChevron(e) {
        $(e.target)
                .prev('.panel-heading')
                .find("span")
                .toggleClass('rotate-icon');
        $('.panel-body.animated').toggleClass('zoomIn zoomOut');
    }
    $('#accordion').on('hide.bs.collapse', toggleChevron);
    $('#accordion').on('show.bs.collapse', toggleChevron);
})
$(".ToolTip").tooltip();
var str = location.href.toLowerCase();
$(".ChrisInnerListItem li").each(function () {
    var rl = str.indexOf($(this).children().attr("href").toLowerCase());
    var page = $(this).children().attr("href");
    if (rl > 0) {
        if (page != rl) {
            $(".ChrisInnerListItem").parent('treeview').parent().removeClass("active");
            $(this).parent().parent().addClass("active");

            $(".ChrisInnerListItem li").removeClass("active");
            $(this).addClass("active");
        }
    }
});
$(window).scroll(function () {
    var height = $(window).scrollTop();

    if (height > 600) {
        $(".sidebar").addClass("Fixed");
    }
    else {
        $(".sidebar").removeClass("Fixed");
    }
});
$(".treeview.active").each(function () {
    if ($(this).children().is(".treeview")) {
        $(this).addClass("active");
    }
    if ($(this).children().is("li")) {
        $(this).addClass("active");
    }
});
setInterval("settime()", 1000);
function settime() {
    var curtime = new Date();
    var curhour = curtime.getHours();
    var curmin = curtime.getMinutes();
    var cursec = curtime.getSeconds();
    var time = "";
    if (curhour == 0) curhour = 12;
    time = (curhour > 12 ? curhour - 12 : curhour) + ":" +
           (curmin < 10 ? "0" : "") + curmin + ":" +
           (cursec < 10 ? "0" : "") + cursec + " " +
           (curhour > 11 ? "PM" : "AM");


    document.getElementById('ctl00_clock').value = time;
}


$(window).load(function () {
    $(".loader").fadeOut("slow");
});
  $(".modal .close,.btn-danger").click(function () {
                $(".modal .form-control").val('');
   })    

$.CHRIS = {};
$.CHRIS.options = {

  SpeedDelay: 100,
  sidebarToggle: "[data-toggle='offcanvas']",
  PushSidebar: true,
  ActivateDropDownSideBar: true,
  SidebarMenuControl: {
    btnToggle: "[data-toggle='control-sidebar']",
    slide: true
  },
  screenSizes: {
    lg: 1200,
    md: 992,
    sm: 768,
    xs: 480
  }
};

$(function () {
  if (typeof CHRISOptions !== "undefined") {
    $.extend(true,
      $.CHRIS.options,
      CHRISOptions);
  }

  var Debasish = $.CHRIS.options;

  MyFunction();

  $.CHRIS.layout.activate();

  if (Debasish.ActivateDropDownSideBar) {
    $.CHRIS.CollapseMenu('.sidebar');
  }

  if (Debasish.PushSidebar) {
      $.CHRIS.pushMenu.activate(Debasish.sidebarToggle);
  }

});



function MyFunction() {
  $.CHRIS.layout = {
    activate: function () {
      var Deb = this;
      Deb.fix();
      Deb.SideBarMenuFix();
      $('body, html, .wrapper').css('height', 'auto');
      $(window, ".wrapper").resize(function () {
        Deb.fix();
        Deb.SideBarMenuFix();
      });
    },
    fix: function () {
      //$(".layout-boxed > .wrapper").css('overflow', 'hidden');
      var NavBarFixedBommom = $('.ChrisFooterMenu').outerHeight() || 0;
      var InnerDistance = $('.menu-header').outerHeight() + NavBarFixedBommom + 50.5;
        var TotalHeight = $(window).height();
      var SideBarMenuHeight = $(".sidebar").height() || 0;
      if ($("body").hasClass("fixed")) {
        $(".ChrisMainContent, .right-side").css('min-height', TotalHeight - NavBarFixedBommom);
      } else {
        var TotalWidth;
        if (TotalHeight >= SideBarMenuHeight) {
            $(".ChrisMainContent, .right-side").css('min-height', TotalHeight - InnerDistance);
            TotalWidth = TotalHeight - InnerDistance;
        } else {
          $(".ChrisMainContent, .right-side").css('min-height', SideBarMenuHeight);
          TotalWidth = SideBarMenuHeight;
        }

        var controlSidebar = $($.CHRIS.options.SidebarMenuControl.selector);
        if (typeof controlSidebar !== "undefined") {
          if (controlSidebar.height() > TotalWidth)
            $(".ChrisMainContent, .right-side").css('min-height', controlSidebar.height());
        }

      }
    },
    SideBarMenuFix: function () {
      if (!$("body").hasClass("FixedMenu")) {
        return;
      } 
    }
  };

  $.CHRIS.pushMenu = {
      activate: function (btnToggle) {
      var screenSizes = $.CHRIS.options.screenSizes;
      $(document).on('click', btnToggle, function (e) {
        e.preventDefault();
        if ($(window).width() > (screenSizes.sm - 1)) {
            $("#myclock").show();
          if ($("body").hasClass('sidebar-collapse')) {
            $("body").removeClass('sidebar-collapse').trigger('expanded.pushMenu');
          } else {
              $("#myclock").hide();
            $("body").addClass('sidebar-collapse').trigger('collapsed.pushMenu');
          }
        }
        else {
          if ($("body").hasClass('sidebar-open')) {
            $("body").removeClass('sidebar-open').removeClass('sidebar-collapse').trigger('collapsed.pushMenu');
          } else {
            $("body").addClass('sidebar-open').trigger('expanded.pushMenu');
          }
        }
      });

      $(".ChrisMainContent").click(function () {
        if ($(window).width() <= (screenSizes.sm - 1) && $("body").hasClass("sidebar-open")) {
          $("body").removeClass('sidebar-open');
        }
      });
    },
  };
  $.CHRIS.CollapseMenu = function (menu) {
    var Deb = this;
    var SpeedDelay = $.CHRIS.options.SpeedDelay;
    $(document).off('click', menu + ' li a')
      .on('click', menu + ' li a', function (e) {
        var $this = $(this);
        var checkElement = $this.next();

        if ((checkElement.is('.ChrisInnerListItem')) && (checkElement.is(':visible')) && (!$('body').hasClass('sidebar-collapse'))) {
          checkElement.slideUp(SpeedDelay, function () {
            checkElement.removeClass('menu-open');
          });
          checkElement.parent("li").removeClass("active");
        }
        else if ((checkElement.is('.ChrisInnerListItem')) && (!checkElement.is(':visible'))) {
          var parent = $this.parents('ul').first();
          var ul = parent.find('ul:visible').slideUp(SpeedDelay);
          ul.removeClass('menu-open');
          var parent_li = $this.parent("li");
          checkElement.slideDown(SpeedDelay, function () {
            checkElement.addClass('menu-open');
            parent.find('li.active').removeClass('active');
            parent_li.addClass('active');
            Deb.layout.fix();
          });
        }
        if (checkElement.is('.ChrisInnerListItem')) {
          e.preventDefault();
        }
      });
  };

 
  $.CHRIS.controlSidebar = {
    activate: function () {
      var Deb = this;
      var Happy = $.CHRIS.options.SidebarMenuControl;
      var sidebar = $(Happy.selector);
      var btn = $(Happy.btnToggle);
      btn.on('click', function (e) {
        e.preventDefault();
        if (!sidebar.hasClass('control-sidebar-open')
          && !$('body').hasClass('control-sidebar-open')) {
            Deb.open(sidebar, Happy.slide);
        } else {
            Deb.close(sidebar, Happy.slide);
        }
      });

      var SideBarControlbtn = $(".control-sidebar-bg");
      Deb._fix(SideBarControlbtn);

      if ($('body').hasClass('fixed')) {
        Deb._fixForFixed(sidebar);
      } else {
        if ($('.ChrisMainContent, .right-side').height() < sidebar.height()) {
          Deb.FixedContentPlaceholder(sidebar);
        }
      }
    },
    open: function (sidebar, slide) {
      if (slide) {
        sidebar.addClass('control-sidebar-open');
      } else {
        $('body').addClass('control-sidebar-open');
      }
    },
    close: function (sidebar, slide) {
      if (slide) {
        sidebar.removeClass('control-sidebar-open');
      } else {
        $('body').removeClass('control-sidebar-open');
      }
    },
    _fix: function (sidebar) {
      var Deb = this;
      if ($("body").hasClass('layout-boxed')) {
        sidebar.css('position', 'absolute');
        sidebar.height($(".wrapper").height());
        if (Deb.hasBindedResize) {
          return;
        }
        $(window).resize(function () {
          Deb._fix(sidebar);
        });
        Deb.hasBindedResize = true;
      } else {
        sidebar.css({
          'position': 'fixed',
          'height': 'auto'
        });
      }
    },
    FixedContentPlaceholder: function (sidebar) {
      $(".ChrisMainContent, .right-side").css('min-height', sidebar.height());
    }
  };
}



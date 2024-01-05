$(".carousel").swipe({
    excludedElements: "input, select, textarea, .noSwipe",
    swipeLeft: function () {
        $(this).carousel('next');
    },
    swipeRight: function () {
        $(this).carousel('prev');
    },
    allowPageScroll: 'vertical'
});
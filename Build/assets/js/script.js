(function() {

  $(function() {
    var carsousel, carsouselClickAction, carsouselOptions, carsouselReadyAction, zoomImageWindowResizeAction;
    $(document).foundation();
    zoomImageWindowResizeAction = function() {
      var demo4obj, winWidth;
      demo4obj = $('#demo4').data('imagezoom');
      winWidth = $(window).width();
      if (winWidth > 900) {
        return demo4obj.changeZoomSize(480, 300);
      } else {
        return demo4obj.changeZoomSize(winWidth * 0.4, winWidth * 0.4 * 0.625);
      }
    };
    carsouselClickAction = function(el, pos, evt) {
      var demo4obj;
      el.siblings().removeClass("active");
      el.addClass("active");
      carsousel.setCurrent(pos);
      evt.preventDefault();
      demo4obj = $('#demo4').data('imagezoom');
      return demo4obj.changeImage(el.find('img').attr('src'), el.find('img').data('largeimg'));
    };
    carsouselReadyAction = function() {
      var imageZoomOptions;
      imageZoomOptions = {
        type: 'standard',
        zoomSize: [480, 300],
        bigImageSrc: 'demo_assets/large/2.jpg',
        offset: [10, -4],
        zoomViewerClass: 'standardViewer',
        onShow: function(obj) {
          return obj.$viewer.hide().fadeIn(500);
        },
        onHide: function(obj) {
          return obj.$viewer.show().fadeOut(500);
        }
      };
      $('#product-image-spotlight').ImageZoom(imageZoomOptions);
      $('#product-image-carousel li:eq(0)').addClass('active');
      return $(window).resize(zoomImageWindowResizeAction);
    };
    carsouselOptions = {
      start: 1,
      minItems: 4,
      onClick: carsouselClickAction,
      onReady: carsouselReadyAction
    };
    return carsousel = $('#product-image-carousel').elastislide(carsouselOptions);
  });

}).call(this);

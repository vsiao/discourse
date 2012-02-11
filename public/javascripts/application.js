$(function() {
  $(window).resize(function() {
    $('#page-content').css({ height:$(window).height()-40 });
  });
  $(window).resize();
});

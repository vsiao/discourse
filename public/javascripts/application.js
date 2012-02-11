$(function() {
  $(window).resize(function() {
    $('#page-content').css({ height:$(window).height()-41 });
  });
  $(window).resize();
});

$(function() {
  var faye = new Faye.Client('http://128.237.116.88:9292/faye');
  faye.subscribe("/messages/new", function(data) {
    eval(data);
  });
});

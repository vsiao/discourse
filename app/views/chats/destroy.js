var thistab = $('#tab-<%= @chat.channel.name %>');
var active = thistab.hasClass('active');
thistab.remove();
$('#<%= @chat.channel.name %>').remove();
if (active)
{
  var tabs = $('.tab');
  if (tabs.length == 0)
  {
    window.location = '/channels';
  }
  else
  {
    var newtab = $($('.tab')[0]);
    newtab.addClass('active');
    $('#'+newtab.attr('channel')).show();
  }
}

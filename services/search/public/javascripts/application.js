WEHub = {};

WEHub.dialog = function(title, message) {
  var modal = $("#dialog-modal");
  modal.html(message);
  modal.dialog({
    zIndex: 2000, /* override Open Layers */
    height: 400,
    width: 600,
    title: title
  });
}

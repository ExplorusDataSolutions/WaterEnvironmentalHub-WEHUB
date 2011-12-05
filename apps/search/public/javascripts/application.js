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

WEHub.modal = function(title, message) {
  var modal = $("#dialog-modal");
  modal.html(message);
  modal.dialog({
    zIndex: 2000, /* override Open Layers */
    minHeight: 200,
    width: 600,
    title: title,
  	modal: true
  });
}

WEHub.logged_in = function() {
  return $.cookie('we_hub') ? true : false;  
}

WEHub.display_name = function() {
  return $.cookie('we_hub') ? $.cookie('we_hub').match(/display_name=([^&]*)/)[1].replace(/\+/g, ' ') : '';
}

WEHub.id = function() {
  return $.cookie('we_hub') ? $.cookie('we_hub').match(/id=([^&]*)/)[1] : '';
}

WEHub.OpenLayers = {}

WEHub.OpenLayers.setMarker = function setMarker(map, markers, lon, lat, html){
  var lonLatMarker = new OpenLayers.LonLat(lon, lat).transform(new OpenLayers.Projection("EPSG:4326"), map.getProjectionObject());

  var feature = new OpenLayers.Feature(markers, lonLatMarker);

  var size = new OpenLayers.Size(20, 34);
  var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
  var icon = new OpenLayers.Icon('/images/marker-blue.png', size, offset);   
  
  function onPopupClose(evt) {
      this.destroy();
  }
  
  function onFeatureSelect(evt) {
    popup = new OpenLayers.Popup.FramedCloud("featurePopup",
                           feature.lonlat,
                           null,
                           html,
                           null, true, onPopupClose);
    popup.feature = feature;
    map.addPopup(popup, true);
  }
  
  function onFeatureUnselect(evt) {
    feature = evt.feature;
    if (feature.popup) {
      popup.feature = null;
      map.removePopup(feature.popup);
      feature.popup.destroy();
      feature.popup = null;
    }
  }
  var marker = new OpenLayers.Marker(lonLatMarker, icon.clone());

  marker.feature = feature;
  marker.events.register("mousedown", feature, onFeatureSelect);
  markers.addMarker(marker);
}

WEHub.OpenLayers.setCenter = function(map, lon, lat, zoomLevel) {
  map.setCenter(new OpenLayers.LonLat(lon, lat).transform(
    new OpenLayers.Projection("EPSG:4326"),
    map.getProjectionObject()
  ), zoomLevel);
}

function add_new_dataset(){
	var hid_last_cnt	=	$('#hid_last_cnt').val()*1 + 1;
	$('#hid_last_cnt').val(hid_last_cnt);
	$.ajax({
      url: "/tools/add_new_dataset/",
      type:'POST',
      dataType:'html',
      data:{"hid_last_cnt": hid_last_cnt},
      success: function(data) {
                          $('#filter-content').append(data);
                      },
      error: function (data){alert("An error occurred:");}
    });
}

function remove_dataset(){
	jQuery("input[name=filter-check]:checked").each
    (
      function()
      {
	  	var id 	=	jQuery(this).val();
		$('#filter-' + id).remove();
      }
    );
}

function add_new_dataset_map(){
	var hid_last_cnt	=	$('#hid_last_cnt').val()*1 + 1;
	$('#hid_last_cnt').val(hid_last_cnt);
	$.ajax({
      url: "/tools/add_new_dataset_map/",
      type:'POST',
      dataType:'html',
      data:{"hid_last_cnt": hid_last_cnt},
      success: function(data) {
                          $('#filter-content').append(data);
                      },
      error: function (data){alert("An error occurred:");}
    });
}

function remove_dataset_map(){
	jQuery("input[name=filter-check]:checked").each
    (
      function()
      {
	  	var id 	=	jQuery(this).val();
		$('#filter-' + id).remove();
      }
    );
}

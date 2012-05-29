WEHub = {};

WEHub.dialog = function(title, message, options) {
  var modal = $("#dialog-modal");
  modal.html(message);
  var defaults = {
    zIndex: 2000, /* override Open Layers */
    height: 400,
    width: 600,
    title: title
  }
  if (options) {
    $.extend(defaults, options)
  }  
  modal.dialog(defaults);
}

WEHub.modal = function(title, message, options) {
  var modal = $("#dialog-modal");
  modal.html(message);
  var defaults = {
    zIndex: 2000, /* override Open Layers */
    minHeight: 200,
    width: 600,
    title: title,
  	modal: true
  }
  if (options) {
    $.extend(defaults, options)
  }
  modal.dialog(defaults);
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

WEHub.isProductionSite = function() {
  return document.domain.match(/waterenvironmentalhub\.ca/) ? true : false;
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

WEHub.OpenLayers.buildFeature = function(map, lon, lat, html){
  var point = new OpenLayers.Geometry.Point(lon, lat).transform(new OpenLayers.Projection("EPSG:4326"), map.getProjectionObject());
  return new OpenLayers.Feature.Vector(point, { html: html });
}

WEHub.OpenLayers.setCenter = function(map, lon, lat, zoomLevel) {
  map.setCenter(new OpenLayers.LonLat(lon, lat).transform(
    new OpenLayers.Projection("EPSG:4326"),
    map.getProjectionObject()
  ), zoomLevel);
}

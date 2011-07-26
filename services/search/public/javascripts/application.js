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
    height: 200,
    width: 600,
    title: title,
	modal: true
  });
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

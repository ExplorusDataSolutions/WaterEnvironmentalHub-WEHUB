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


function profile_about_me_edit(){
	if ($('#about-me-edit').css('display') == 'none'){
		$('#about-me-content').hide(1000);
		$('#about-me-edit').show(1000)
	}else{
		$('#about-me-edit').hide(1000);
		$('#about-me-content').show(1000);
	}
}
function profile_skills_edit(){
	if ($('#skills-edit').css('display') == 'none'){
		$('#skills-content').hide(1000);
		$('#skills-edit').show(1000)
	}else{
		$('#skills-edit').hide(1000);
		$('#skills-content').show(1000);
	}
}
function close_friends(friends_cnt){
	$('#profile-friend-'+friends_cnt).hide(1000);
}

function update_about_me(){
	var about_me	=	$('#about_me').val();
	$.ajax({
      url: "/user/ajax_update_about_me/",
      type:'POST',
      dataType:'html',
      data:{"about_me": about_me},
      success: function(data) {
                         $('#about-me-edit').hide(1000);
                      },
      error: function (data){alert("An error occurred:");}
    });
}

function update_skills(){
	var skills	=	$('#skills').val();
	$.ajax({
      url: "/user/ajax_update_skills/",
      type:'POST',
      dataType:'html',
      data:{"skills": skills},
      success: function(data) {
                         $('#skills-edit').hide(1000);
                      },
      error: function (data){alert("An error occurred:");}
    });
}

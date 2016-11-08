function readURL(input) {
  
  if (input.files && input.files[0]) {
    var reader = new FileReader();       
    reader.onload = function (e) {
      $('#image_preveiw').attr('src', e.target.result);
    }  
  reader.readAsDataURL(input.files[0]);
  }
}
   
$(document).on('change', '#feed_image', function() {
  readURL(this);
}); 

$(document).on('change', '#user_image', function() {
  readURL(this);
}); 


$(document).on('change', '#bookmark_checkbox', function() {

  if($(this).prop("checked") == true){
    checked =  $(this).prop('checked');
    var $this = $(this),
      feed_id = $this.data("id");
    $.ajax({
      url: '/bookmarks', 
      type: 'post',
      data: { feed_id: feed_id , mark_as: checked } 
    });
    function toggleOn() {
      $('#bookmark_checkbox').bootstrapToggle('on')
    }
  }
  else{
    unchecked =  $(this).prop('checked');
    var $this = $(this),
      feed_id = $this.data("id");
    $.ajax({
      url: '/bookmarks', 
      type: 'post',
      data: { feed_id: feed_id , mark_as: unchecked } 
    });
  }

});

  

// $(document).on('change', '#remove_bookmark', function() {
//   debugger
//     checked = $(this).is(':checked');
//     var $this = $(this),
//       feed_id = $this.data("id");
//     $.ajax({
//       url: '/bookmarks', 
//       type: 'post',
//       data: { feed_id: feed_id , mark_as: checked } 
//     });
// });
   




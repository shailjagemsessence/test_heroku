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


$(document).on('click', '#bookmark_checkbox', function() {
  var $this = $(this),
    checked,
    feed_id = $this.closest("div").attr("id");
    $.ajax({
    url: '/feeds/'+feed_id+'/bookmark_the_feed/',
    type: 'put',
    data: {  bookmark: $(this).is(':checked') }
  });
});
    
  
  
// $( document ).ready(function() {
//   $('#toggle-one').bootstrapToggle();
// });
  

  
    
  
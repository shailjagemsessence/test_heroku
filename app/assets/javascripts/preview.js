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


$(document).on('change', '.bookmark_checkbox', function() {
  checked =  $(this).prop('checked');
  alert(checked);
  var $this = $(this);
    feed_id = $this.data("feed-id");
    alert(feed_id);
    $.ajax({
    url: '/feeds/'+feed_id+'/bookmark_the_feed/',
    type: 'put',
    data: {  bookmark: checked }
  });
});
  
  
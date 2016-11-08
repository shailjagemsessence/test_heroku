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





 
  


//var checkboxValues = JSON.parse(localStorage.getItem('checkboxValues')) || {};
// var $checkboxes = $("#bookmark_checkbox");

// $checkboxes.on("change", function(){
//   $checkboxes.each(function(){
//     checkboxValues[this.id] = this.checked;
//   });
//   localStorage.setItem("checkboxValues", JSON.stringify(checkboxValues));
// });
   
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
    checked =  $(this).prop('checked');
    var $this = $(this),
      feed_id = $this.data("id");
    $.ajax({
      url: '/bookmarks', 
      type: 'post',
      data: { feed_id: feed_id , mark_as: checked } 
    });
  });


$(document).on('click', '#myId', function(){
        debugger
        removeClass('hidden');
    });
});


$(function() {
  $('a#show_whatever').click(function(event){
    event.preventDefault();
    $('div#whatever').toggle();
  });
});   





// $(document).on("focus", "[data-behaviour~='datepicker']", function(e) {
//   return $(this).datepicker;
// });

// ({
//   format: "dd-mm-yyyy"
// });


// var ready_post;

// ready_post = function() {
//   var readURL;
//   $('.photo-upload').on('change', function(e) {
//     return readURL(this);
//   });
//   readURL = function(input) {
//     var reader;
//     if (input.files && input.files[0]) {
//       return reader = new FileReader();
//     }
//   };
//   reader.onload = function(e) {
//     var $swap;
//     $('.image_to_upload').attr('src', e.target.result).removeClass('hidden');
//     $swap = $('.swap');
//     if ($swap) {
//       return $swap.removeClass('hidden');
//     }
//   };
//   return reader.readAsDataURL(input.files[0]);
// };

// $(document).ready(ready_post);

// $(document).on('page:load', ready_post);


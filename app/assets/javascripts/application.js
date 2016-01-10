//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


 $(document).ready(function() {

   $('#devform').show();
   $('#orgform').hide();
    })

  $('#org').click(function() {
   $('#orgform').show();
   $('#devform').hide();
    })
 });




//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  registerForm()
  renderEditUserForm()
  editUserInfo()
});


function registerForm(){
  $('#dev').click(function() {
    $('#devform').show();
    $('#orgform').hide();
  })
  $('#org').click(function() {
    $('#orgform').show();
    $('#devform').hide();
  })
}

function renderEditUserForm(){
  $('div').on("click", ".render-edit-user-form", function(event){
    event.preventDefault()
    $('.developer-profile').hide()
    $('.edit-developer-from').show()
  })
}

function editUserInfo(){
  $('div').on("click", ".edit-profile", function(event){
    event.preventDefault()
    var userInfo = $(".edit-profile-form").serialize()
    var request = $.ajax({
      url: "/users/:id",
      type: "PUT",
      data: userInfo
    })
    request.done(function(response){
      console.log(response)
      console.log(typeof response)
    })
  })
}

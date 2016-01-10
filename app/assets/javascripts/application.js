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
  $('body').on("click", ".display-edit-developer-form", function(event){
    event.preventDefault()
    userID = $("input").first().val()
    var request = $.ajax({
      url: "/users/" + userID + "/edit",
      type: "GET"
    })
    request.done(function(response){
      $('body').empty()
      document.body.innerHTML = response
    })
  })
}

function editUserInfo(){
  $('body').on("click", ".update-developer-profile", function(event){
    event.preventDefault()
    var userInfo = $(".edit-developer-form").serialize()
    var request = $.ajax({
      url: "/users/:id",
      type: "PUT",
      data: userInfo
    })
    request.done(function(response){
      $('.edit-developer-div').hide()
      $('body').empty()
      document.body.innerHTML = response
    })
  })
}

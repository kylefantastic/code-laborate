//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {
  registerForm()
  renderEditUserForm()
  editUserInfo()
  renderEditProjectForm()
  editProjectInfo()
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
    var userID = $("input").first().val()
    var request = $.ajax({
      url: "/users/" + userID + "/edit",
      type: "GET"
    })
    request.done(function(response){
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
      document.body.innerHTML = response
    })
  })
}

function renderEditProjectForm(){
  $('#project-container').on("click", "#get-project-edit", function(e){
    e.preventDefault();
    var projectID = $('#project_id').val()
    var request = $.ajax({
      url: "/projects/" + projectID + "/edit",
      type: "GET"
    })
    request.done(function(response){
      $('#project-container').html(response)
    })
  })
}

function editProjectInfo(){
  $('#project-container').on("click", "#submit-project-update", function(e){
    e.preventDefault();
    var projectInfo = $("#project-edit-form").serialize()
    var projectID = $('#project_id').val()
    var request = $.ajax({
      url: "/projects/" + projectID,
      type: "PUT",
      data: projectInfo
    })
    request.done(function(response){
      $('#project-container').html(response)
    })
  })
}


